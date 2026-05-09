package com.example.DoAn.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DoAn.domain.Cart;
import com.example.DoAn.domain.CartDetail;
import com.example.DoAn.domain.Categories;
import com.example.DoAn.domain.Order;
import com.example.DoAn.domain.OrderDetail;
import com.example.DoAn.domain.Product;

import com.example.DoAn.domain.User;
import com.example.DoAn.repository.CartDetailRepository;
import com.example.DoAn.repository.CartRepository;
import com.example.DoAn.repository.OrderDetailRepository;
import com.example.DoAn.repository.OrderRepository;
import com.example.DoAn.repository.ProductRepository;
import com.example.DoAn.service.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final UserService userService;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository oderDetailRepository;

    public ProductService(ProductRepository productRepository, UserService userService, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, OrderRepository orderRepository,
            OrderDetailRepository oderDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.userService = userService;
        this.cartRepository = cartRepository;
        this.orderRepository = orderRepository;
        this.oderDetailRepository = oderDetailRepository;
    }

    public Page<Product> getAllProducts(Pageable page) {
        return this.productRepository.findByIsDeletedFalse(page);
    }

    public Page<Product> getAllProductsWithSpec(Pageable page, String name, Double minPrice, Double maxPrice,
            List<Long> categoryIds, Long provinceId) {
        Specification<Product> spec = Specification.where(ProductSpecs.isNotDeleted());

        if (name != null && !name.isEmpty()) {
            spec = spec.and(ProductSpecs.nameLike(name));
        }

        if (maxPrice != null) {
            spec = spec.and(ProductSpecs.priceBetween(minPrice, maxPrice));
        }

        if (categoryIds != null && !categoryIds.isEmpty()) {
            spec = spec.and(ProductSpecs.hasCategories(categoryIds));
        }

        if (provinceId != null) {
            spec = spec.and(ProductSpecs.hasProvinceId(provinceId));
        }
        return this.productRepository.findAll(spec, page);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findByIsDeletedFalse();
    }

    public List<Product> getProductsByProvinceId(Long provinceId) {
        if (provinceId == null) {
            return this.getAllProducts();
        }
        return this.productRepository.findByProvince_IdAndIsDeletedFalse(provinceId);
    }

    public Product handleSaveProduct(Product product) {
        Product manh = this.productRepository.save(product);
        return manh;
    }

    public Product getProductByName(String name) {
        return this.productRepository.findByName(name);
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        product.setIsDeleted(true);
        productRepository.save(product);
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public List<Product> findRelatedProducts(Product product) {
        List<Long> categoryIds = product.getCategories()
                .stream()
                .map(Categories::getId)
                .collect(Collectors.toList());
        System.out.println("Category IDs của sản phẩm: " + categoryIds);
        Pageable limit = PageRequest.of(0, 10);
        Page<Product> page = productRepository.findByCategories_IdInAndIdNotAndIsDeletedFalse(categoryIds,
                product.getId(), limit);
        return page.getContent();
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                //
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    if (realProduct.getSalePrice() != null && realProduct.getSalePrice() > 0) {
                        cd.setPrice(realProduct.getSalePrice());
                    } else {
                        cd.setPrice(realProduct.getPrice());
                    }
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.delete(cartDetail);

            // Lấy lại số sản phẩm còn trong giỏ
            List<CartDetail> remainingDetails = cartDetailRepository.findByCartId(currentCart.getId());
            int remainingCount = remainingDetails.size();
            System.out.println("Số sản phẩm còn lại trong giỏ hàng: " + remainingCount);

            // update cart
            currentCart.setSum(remainingCount);
            cartRepository.save(currentCart);

            session.setAttribute("sum", remainingCount);
        }
    }

    // public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
    // for (CartDetail cartDetail : cartDetails) {
    // Optional<CartDetail> cdOptional =
    // this.cartDetailRepository.findById(cartDetail.getId());
    // if (cdOptional.isPresent()) {
    // CartDetail currentCartDetail = cdOptional.get();
    // currentCartDetail.setQuantity(cartDetail.getQuantity());
    // this.cartDetailRepository.save(currentCartDetail);
    // }
    // }
    // }

    public List<String> handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        List<String> errors = new ArrayList<>();

        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                Product product = currentCartDetail.getProduct();
                if (cartDetail.getQuantity() > product.getQuantity()) {
                    errors.add("Sản phẩm '" + product.getName() + "' chỉ còn " + product.getQuantity() + " trong kho.");
                } else {
                    currentCartDetail.setQuantity(cartDetail.getQuantity());
                    this.cartDetailRepository.save(currentCartDetail);
                }
            }
        }
        return errors;
    }

    public List<String> getCartStockErrors(List<CartDetail> cartDetails) {
        List<String> errors = new ArrayList<>();
        if (cartDetails == null) {
            return errors;
        }

        for (CartDetail cartDetail : cartDetails) {
            Product product = cartDetail.getProduct();
            if (product != null && cartDetail.getQuantity() > product.getQuantity()) {
                errors.add(buildCartStockError(product));
            }
        }

        return errors;
    }

    public List<String> getCartStockErrors(User user) {
        Cart cart = this.cartRepository.findByUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        return this.getCartStockErrors(cartDetails);
    }

    public Cart findByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public Page<Product> findPagedSortedByPriceAsc(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("price").ascending());
        return productRepository.findAll(pageable);
    }

    public Page<Product> findPagedSortedByPriceDesc(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("price").descending());
        return productRepository.findAll(pageable);
    }

    public Page<Product> findPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        return productRepository.findAll(pageable);
    }

    @Transactional
    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone, int paymentStatus) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");
                order.setPaymentStatus(paymentStatus);
                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice() * cd.getQuantity();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail
                List<Long> cartDetailIds = new ArrayList<>();

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.oderDetailRepository.save(orderDetail);
                    cartDetailIds.add(cd.getId());
                }

                System.out.println("Starting to delete cart details...");
                // step 2: delete cart_detail and cart
                for (Long id : cartDetailIds) {
                    try {
                        // Kiểm tra xem CartDetail có tồn tại trước khi xóa không
                        Optional<CartDetail> cartDetail = this.cartDetailRepository.findById(id);
                        if (cartDetail.isPresent()) {
                            System.err.println("Có tìm CartDetail  with ID " + id);
                            this.cartDetailRepository.deleteById(id);
                        } else {
                            System.err.println("CartDetail with ID " + id + " not found");
                        }
                    } catch (Exception e) {
                        System.err.println("Error deleting CartDetail with ID: " + id);
                        e.printStackTrace();
                    }
                }

                cart.setSum(0);
                cartRepository.save(cart);

                // step 3 : update session
                session.setAttribute("sum", 0);
            }
        }

    }

    // Lấy ra tổng số sản phẩm
    public Long countAllProducts() {
        return this.productRepository.countAllProducts();
    }

    // Lấy ra danh sách sản phẩm sắp hết hàng
    public List<Product> findProductsLowStock() {
        return this.productRepository.findProductsLowStock();
    }

    private String buildCartStockError(Product product) {
        return "Sản phẩm '" + product.getName() + "' chỉ còn " + product.getQuantity() + " trong kho.";
    }
}
