package com.example.DoAn.controller.client;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BlogController {

    @GetMapping("/blog")
    public String getBlogPage(Model model) {
        model.addAttribute("activePage", "blog");
        return "client/blog/show";
    }

    @GetMapping("/blog/{id}")
    public String getBlogDetail(@PathVariable("id") int id, Model model) {
        BlogPost post = BlogPostData.getById(id);
        if (post == null) {
            return "redirect:/blog";
        }

        model.addAttribute("activePage", "blog");
        model.addAttribute("post", post);
        return "client/blog/detail";
    }

    public static class BlogPost {
    private final int id;
    private final String title;
    private final String dateLabel;
    private final String imagePath;
    private final String intro;
    private final List<Section> sections;

    public BlogPost(int id, String title, String dateLabel, String imagePath, String intro, List<Section> sections) {
        this.id = id;
        this.title = title;
        this.dateLabel = dateLabel;
        this.imagePath = imagePath;
        this.intro = intro;
        this.sections = sections;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDateLabel() {
        return dateLabel;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getIntro() {
        return intro;
    }

    public List<Section> getSections() {
        return sections;
    }
    }

    public static class Section {
    private final String heading;
    private final List<String> paragraphs;
    private final List<String> bullets;

    public Section(String heading, List<String> paragraphs, List<String> bullets) {
        this.heading = heading;
        this.paragraphs = paragraphs;
        this.bullets = bullets;
    }

    public String getHeading() {
        return heading;
    }

    public List<String> getParagraphs() {
        return paragraphs;
    }

    public List<String> getBullets() {
        return bullets;
    }
    }

    private static final class BlogPostData {
    private static final Map<Integer, BlogPost> POSTS = new LinkedHashMap<>();

    static {
        // Nội dung cứng (dài ~2-3 màn), trình bày đẹp theo dạng section.
        POSTS.put(1, new BlogPost(
            1,
            "Khám phá những món ngon theo mùa: Hướng dẫn về những món tươi ngon nhất hiện nay",
            defaultDateLabel(1),
            "/images/blog/blog1.jpg",
            "Có một điều kỳ diệu ở các sản phẩm nông sản theo mùa — cảm nhận rất rõ vị ngọt, độ giòn và hương thơm tự nhiên. Nếu bạn đang háo hức khám phá những sản phẩm tươi ngon trong mùa này, bài viết này là hướng dẫn nhỏ giúp bạn bắt đầu.",
            sections(
                section(
                    "Tại sao nông sản theo mùa lại quan trọng?",
                    paras(
                        "Thực phẩm theo mùa không chỉ đơn thuần là ‘đúng lúc’ — mà còn là cách kết nối với khí hậu và thổ nhưỡng từng vùng.",
                        "Khi cây trái vào vụ, chúng có điều kiện phát triển tối ưu, ít cần can thiệp, vì thế chất lượng thường ổn định hơn."
                    ),
                    bullets(
                        "Tươi hơn vì thời gian từ thu hoạch đến bàn ăn ngắn hơn",
                        "Ngon hơn nhờ chín tự nhiên đúng mùa",
                        "Giá hợp lý hơn do nguồn cung dồi dào"
                    )
                ),
                section(
                    "Những món ngon mùa xuân để thưởng thức",
                    paras(
                        "Mùa xuân là thời điểm rau lá non, trái cây thanh mát lên ngôi. Hãy ưu tiên các món chế biến đơn giản để giữ độ tươi.",
                        "Một bữa ăn cân bằng có thể bắt đầu bằng salad rau xanh, thêm trái cây tráng miệng theo mùa."
                    ),
                    bullets(
                        "Đậu Hà Lan: giòn ngọt, hợp xào nhanh hoặc trộn salad",
                        "Củ cải: ăn sống, muối chua nhẹ hoặc nấu canh",
                        "Rau thơm: tăng hương vị mà không cần nêm quá nhiều"
                    )
                ),
                section(
                    "Vì sao rau quả tươi ngon hơn",
                    paras(
                        "Bí quyết nằm ở độ chín và độ ẩm. Rau củ để lâu thường mất nước, hương vị nhạt dần.",
                        "Chọn rau quả có màu sắc tự nhiên, bề mặt tươi, cuống còn xanh. Tránh những quả có vết dập hoặc mềm bất thường."
                    ),
                    bullets(
                        "Ưu tiên mua lượng vừa đủ 2–3 ngày",
                        "Bảo quản theo nhóm (rau lá / củ / trái cây) để tránh ‘chín lây’",
                        "Rửa trước khi ăn, không rửa trước khi cất nếu chưa dùng ngay"
                    )
                ),
                section(
                    "Gợi ý thực đơn 1 ngày theo mùa",
                    paras(
                        "Nếu bạn băn khoăn bắt đầu từ đâu, hãy thử một thực đơn đơn giản: sáng nhẹ nhàng, trưa đủ chất, tối gọn gàng.",
                        "Quan trọng nhất vẫn là chọn nguyên liệu tươi và chế biến tối giản."
                    ),
                    bullets(
                        "Sáng: sữa chua + trái cây theo mùa",
                        "Trưa: cơm + rau luộc + đạm nạc + canh",
                        "Tối: salad + soup rau củ"
                    )
                )
            )));

        POSTS.put(2, new BlogPost(
            2,
            "Bí quyết tạo nên những món salad ngon miệng và bổ dưỡng",
            defaultDateLabel(2),
            "/images/blog/blog2.jpg",
            "Salad không chỉ là ‘rau trộn’. Một tô salad ngon là sự cân bằng giữa vị — giòn — béo nhẹ — chua thanh. Dưới đây là công thức tư duy để bạn tự phối salad theo khẩu vị.",
            sections(
                section(
                    "Cấu trúc một tô salad ngon",
                    paras(
                        "Một salad ngon thường có: nền rau xanh + topping giòn + chất đạm + sốt.",
                        "Đừng ngại thêm đạm vì nó giúp no lâu và cân bằng dinh dưỡng."
                    ),
                    bullets(
                        "Nền: xà lách, rau mầm, cải bó xôi",
                        "Đạm: ức gà, trứng luộc, cá ngừ",
                        "Topping: bơ, hạt, ngô, phô mai"
                    )
                ),
                section(
                    "Sốt (dressing): ít nhưng đúng",
                    paras(
                        "Sốt là linh hồn của salad. Chỉ cần 1–2 muỗng là đủ nếu phối đúng.",
                        "Nguyên tắc dễ nhớ: chua + béo + ngọt nhẹ + muối."
                    ),
                    bullets(
                        "Chua: chanh, giấm táo",
                        "Béo: dầu olive, sữa chua",
                        "Ngọt: mật ong (rất ít)"
                    )
                ),
                section(
                    "3 combo salad dễ làm",
                    paras(
                        "Bạn có thể thử 3 combo sau để đổi vị trong tuần.",
                        "Hãy ưu tiên nguyên liệu theo mùa để salad luôn tươi và giá hợp lý."
                    ),
                    bullets(
                        "Salad gà áp chảo + xà lách + cà chua + sốt chanh",
                        "Salad cá ngừ + bắp + dưa leo + sốt sữa chua",
                        "Salad bơ + trứng + rau mầm + dầu olive"
                    )
                ),
                section(
                    "Mẹo giữ salad giòn lâu",
                    paras(
                        "Rau lá cần được làm khô trước khi trộn. Nước thừa làm salad nhanh ‘ỉu’.",
                        "Nếu mang đi làm, để sốt riêng và trộn ngay trước khi ăn."
                    ),
                    bullets(
                        "Rau khô mới trộn sốt",
                        "Để sốt riêng nếu mang đi",
                        "Topping giòn cho vào cuối cùng"
                    )
                )
            )));

        // Các bài còn lại: cùng format, nội dung cứng khác nhau (ngắn gọn nhưng đủ dài 2-3 màn).
        for (int i = 3; i <= 9; i++) {
        if (POSTS.containsKey(i)) continue;
        POSTS.put(i, new BlogPost(
            i,
            defaultTitle(i),
            defaultDateLabel(i),
            "/images/blog/blog" + i + ".jpg",
            "Bài viết này tổng hợp những gợi ý thực tế và dễ áp dụng để bạn ăn ngon hơn với nông sản tươi — tập trung vào cách chọn, cách sơ chế và cách bảo quản.",
            sections(
                section(
                    "Chọn nguyên liệu tươi",
                    paras(
                        "Ưu tiên nguyên liệu theo mùa và quan sát bề mặt, mùi hương, độ chắc tay.",
                        "Tránh chọn rau củ đã dập nát hoặc có dấu hiệu héo rũ."
                    ),
                    bullets(
                        "Màu sắc tự nhiên",
                        "Cầm chắc tay",
                        "Không có mùi lạ"
                    )
                ),
                section(
                    "Sơ chế đúng cách",
                    paras(
                        "Rửa sạch nhiều lần dưới nước chảy và để ráo trước khi chế biến.",
                        "Với rau lá, có thể ngâm nước muối loãng 5–10 phút rồi xả lại."
                    ),
                    bullets(
                        "Rửa dưới vòi nước",
                        "Để ráo trước khi nấu",
                        "Cắt vừa ăn để giữ độ giòn"
                    )
                ),
                section(
                    "Bảo quản để tươi lâu",
                    paras(
                        "Phân loại và bảo quản đúng nhóm sẽ giúp rau củ giữ độ tươi lâu hơn.",
                        "Đừng để trái cây chín chung với rau lá vì khí ethylene sẽ làm rau nhanh héo."
                    ),
                    bullets(
                        "Rau lá: bọc giấy/khăn khô",
                        "Củ: để ngăn mát khô",
                        "Trái cây: tách riêng theo độ chín"
                    )
                ),
                section(
                    "Gợi ý món dễ làm",
                    paras(
                        "Khi bận rộn, hãy chọn các món nhanh như xào nhanh, luộc chấm, hoặc salad đơn giản.",
                        "Thêm một nguồn đạm (trứng, ức gà, đậu hũ) để bữa ăn cân bằng hơn."
                    ),
                    bullets(
                        "Rau xào tỏi",
                        "Canh rau củ",
                        "Salad + trứng luộc"
                    )
                )
            )));
        }

        // Thêm 1–2 đoạn văn dài cho tất cả trang detail (1 -> 9)
        for (BlogPost post : POSTS.values()) {
            addExtraDetailText(post);
        }
    }

    private static void addExtraDetailText(BlogPost post) {
        if (post == null || post.getSections() == null) {
            return;
        }

        post.getSections().add(section(
            "Góc nhỏ từ Fresh Food",
            paras(
                "Một mẹo nhỏ để bữa ăn luôn “ngon như mới” là bạn hãy dành 5–10 phút sau khi mua hàng để phân loại và sắp xếp lại nguyên liệu. Rau lá nên được bọc khăn giấy khô, cho vào túi hoặc hộp kín có lót giấy; củ quả thì lau khô, để riêng ngăn mát; trái cây chín nhanh nên tách khỏi rau để tránh làm rau héo. Chỉ một bước chuẩn bị ngắn như vậy có thể giúp bạn tiết kiệm rất nhiều thời gian nấu nướng trong tuần và hạn chế lãng phí thực phẩm.",
                "Ngoài ra, khi chế biến, hãy ưu tiên các cách làm đơn giản để giữ độ tươi và dinh dưỡng: xào nhanh lửa lớn, hấp, luộc vừa chín tới hoặc trộn salad. Nếu muốn vị đậm đà hơn mà không cần nêm quá nhiều, bạn có thể dùng rau thơm, chanh, gừng, tỏi, tiêu hoặc một ít dầu olive để tăng hương và độ “bắt miệng”. Quan trọng nhất là lắng nghe cơ thể: ăn đủ rau, đủ đạm, uống đủ nước và điều chỉnh khẩu phần phù hợp với nhịp sinh hoạt của bạn."
            ),
            bullets()
        ));
    }

    private static BlogPost getById(int id) {
        return POSTS.get(id);
    }

    private static String defaultTitle(int id) {
        return switch (id) {
        case 3 -> "Nghệ thuật chuẩn bị bữa ăn: Làm thế nào để tiết kiệm thời gian và ăn uống lành mạnh suốt cả tuần";
        case 4 -> "Niềm vui mùa thu hoạch: Tôn vinh sự trù phú của mùa vụ";
        case 5 -> "Từ hạt giống đến bàn ăn: Cách thu hoạch những sản phẩm tốt nhất từ khu vườn của bạn";
        case 6 -> "Hướng dẫn dành cho người mới bắt đầu về cách thu hoạch thành công: Mẹo và thủ thuật";
        case 7 -> "Ăn theo mùa: Vì sao thực phẩm theo mùa luôn ngon và tốt cho sức khỏe hơn?";
        case 8 -> "Bảo quản rau củ đúng cách: Giữ độ tươi lâu hơn trong tủ lạnh";
        case 9 -> "Gợi ý thực đơn xanh: 5 món nhanh gọn từ rau củ cho ngày bận rộn";
        default -> "Fresh Food Blog";
        };
    }

    private static String defaultDateLabel(int id) {
        return switch (id) {
        case 1 -> "May 23, 2024";
        case 2 -> "May 21, 2024";
        case 3 -> "May 19, 2024";
        case 4 -> "May 17, 2024";
        case 5 -> "May 15, 2024";
        case 6 -> "May 13, 2024";
        case 7 -> "May 11, 2024";
        case 8 -> "May 09, 2024";
        case 9 -> "May 07, 2024";
        default -> "May 23, 2024";
        };
    }

    private static List<Section> sections(Section... items) {
        List<Section> list = new ArrayList<>();
        for (Section s : items) list.add(s);
        return list;
    }

    private static Section section(String heading, List<String> paras, List<String> bullets) {
        return new Section(heading, paras, bullets);
    }

    private static List<String> paras(String... items) {
        List<String> list = new ArrayList<>();
        for (String s : items) list.add(s);
        return list;
    }

    private static List<String> bullets(String... items) {
        List<String> list = new ArrayList<>();
        for (String s : items) list.add(s);
        return list;
    }
    }
}
