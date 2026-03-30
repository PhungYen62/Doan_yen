package com.example.DoAn.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.DoAn.domain.Product;
import com.example.DoAn.domain.User;
import com.example.DoAn.utils.StringUtils;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(
            ServletContext servletContext) {

        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // don't upload file
        if (file.isEmpty())
            return "";
        // relative path: absolute path
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            // uuid

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return finalName;
    }

    public String handleSaveUploadImage(MultipartFile file, String targetFolder) {
        if (file.isEmpty())
            return "";

        // Đường dẫn thư mục
        String rootPath = this.servletContext.getRealPath("/resources/images/products");
        String finalName = "";

        try {
            byte[] bytes = file.getBytes();

            // Tạo thư mục nếu chưa tồn tại
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Đặt tên file: dùng timestamp để tránh trùng lặp
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            // Lưu file vào server
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return targetFolder + "/" + finalName; // Trả về đường dẫn đầy đủ của ảnh
    }

    public void deleteProductImagesFromFolder(Product product) {
        String productFolder = StringUtils.removeAccent(product.getName()).replaceAll("\\s+", "_");
        String uploadDir = "src/main/webapp/resources/images/products/" + productFolder;

        File folder = new File(uploadDir);
        if (folder.exists() && folder.isDirectory()) {
            for (File file : folder.listFiles()) {
                file.delete(); // Xóa từng file
            }
            folder.delete(); // Xóa thư mục nếu rỗng
        }
    }

    public boolean deleteAvatarImage(User user) {
        if (user.getAvatar() == null || user.getAvatar().isBlank()) {
            System.out.println("Người dùng chưa có ảnh đại diện.");
            return false;
        }

        String filePath = "src/main/webapp/resources/images/avatar/" + user.getAvatar();
        File file = new File(filePath);

        if (file.exists() && file.isFile()) {
            boolean deleted = file.delete();
            if (deleted) {
                System.out.println("Đã xoá file: " + file.getAbsolutePath());
            } else {
                System.out.println("Không thể xoá file: " + file.getAbsolutePath());
            }
            return deleted;
        } else {
            System.out.println("File không tồn tại: " + file.getAbsolutePath());
            return false;
        }
    }

    public void updateProductImage(String imagePath) {
        if (imagePath == null || imagePath.isEmpty()) {
            return; // Tránh lỗi nếu đường dẫn bị null
        }

        // Tách thư mục và tên file
        int lastSlashIndex = imagePath.lastIndexOf("/");
        if (lastSlashIndex == -1)
            return; // Tránh lỗi nếu đường dẫn không hợp lệ

        String folderPath = imagePath.substring(0, lastSlashIndex); // "products/Tao"
        String fileName = imagePath.substring(lastSlashIndex + 1); // "1742981752576-best-product-6.jpg"

        // Đường dẫn thư mục chứa ảnh
        File folder = new File("src/main/webapp/resources/images/products/" + folderPath);
        File file = new File(folder, fileName); // File ảnh cần xóa

        if (file.exists()) {
            file.delete(); // Xóa file ảnh cụ thể
        }

        // Xóa thư mục nếu không còn file nào bên trong
        if (folder.isDirectory() && folder.list().length == 0) {
            folder.delete();
        }
    }

}
