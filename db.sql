-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2024 at 09:28 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `count_comment` int(11) NOT NULL DEFAULT 0,
  `count_like` int(11) NOT NULL DEFAULT 0,
  `path` varchar(255) DEFAULT NULL,
  `is_edit` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `post_id`, `user_id`, `date`, `count_comment`, `count_like`, `path`, `is_edit`) VALUES
(446, '123', 5, 31, '2024-01-22 10:15:29.000000', 3, 0, '446', b'0'),
(448, '12345', 5, 31, '2024-01-22 10:17:41.000000', 0, 0, '446_448', b'0'),
(449, '23123', 5, 31, '2024-01-22 10:24:43.000000', 2, 0, '449', b'0'),
(450, '123123', 5, 31, '2024-01-22 10:24:47.000000', 1, 0, '449_450', b'0'),
(460, '12111112', 5, 31, '2024-01-22 15:04:57.000000', 0, 1, '460', b'0'),
(461, '123213', 5, 31, '2024-01-22 15:12:25.000000', 4, 1, '461', b'0'),
(466, '123123', 4, 31, '2024-01-25 03:01:52.000000', 0, 1, '466', b'0'),
(467, '123123', 4, 31, '2024-01-25 03:01:55.000000', 0, 2, '467', b'0'),
(468, '12312313', 4, 31, '2024-01-25 03:01:57.000000', 0, 2, '468', b'0'),
(469, '123123123', 4, 31, '2024-01-25 03:01:59.000000', 0, 2, '469', b'0'),
(470, '1313213', 4, 31, '2024-01-25 03:02:00.000000', 0, 2, '470', b'0'),
(471, '424234', 4, 31, '2024-01-25 03:02:02.000000', 0, 3, '471', b'0'),
(472, '12312312', 4, 31, '2024-01-25 03:02:03.000000', 0, 4, '472', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `type`, `type_id`, `user_id`) VALUES
(443, 'comment', 472, 37),
(444, 'comment', 471, 37),
(445, 'comment', 470, 37),
(446, 'comment', 466, 31),
(447, 'comment', 467, 31),
(448, 'comment', 472, 31);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count_comment` bigint(20) DEFAULT NULL,
  `count_like` bigint(20) DEFAULT NULL,
  `count_view` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `date`, `status`, `title`, `user_id`, `count_comment`, `count_like`, `count_view`) VALUES
(1, '<p>Content of th123123123123e editor.</p>', '2024-01-07 21:17:04.000000', b'0', '213123', 1, 107, 1, 1062),
(2, '<h2>&nbsp;</h2><p>&nbsp;</p><p>Bài đăng này đã không được cập nhật trong 7 năm</p><p>Trong bài viết này mình sẽ chia sẻ cho bạn cách tối ưu tốc độ website, để có tốc độ load trang web nhanh hơn cũng như có điểm ranking cao hơn với google search engine.</p><p>Đầu tiên bạn vào trang web <a href=\"https://developers.google.com/speed/pagespeed/insights/\">https://developers.google.com/speed/pagespeed/insights/</a> và nhập địa chỉ website vào input và ấn Analyze thì google sẽ chấm điểm website của bạn xem nó được bao nhiêu điểm và sẽ đưa ra những recommend để web site của bạn chạy nhanh hơn dưới đây mình sẽ tổng hợp những yêu cầu chủ yếu của google đưa ra và cách fix những yêu cầu này.</p><h2><strong>1. Optimize images</strong></h2><p>Đây có lẽ là yêu cầu đầu tiên và cũng là hay gặp nhất với bất kì website nào. Như bạn thấy trong hình thì có nhiều ảnh được đưa ra là có thể giảm đến 90% dung lượng của ảnh xuống, kết quả thật đáng mơ ước phải không.</p><figure class=\"image\"><img style=\"aspect-ratio:1009/476;\" src=\"http://imgur.com/Ym6zBZp.png\" alt=\"alt\" width=\"1009\" height=\"476\"></figure><p>Vậy làm sao để fix được trường hợp này. Thật may là google đã làm hết cho bạn, bạn chỉ cần kéo xuống dưới cùng của site đó (tab destop nhé) và download ảnh về và thay vào website của mình mà thôi.</p><figure class=\"image\"><img style=\"aspect-ratio:596/134;\" src=\"http://imgur.com/TcGfIPR.png\" alt=\"optimize img.png\" width=\"596\" height=\"134\"></figure><p>Vậy cũng sẽ có nhiều bạn thắc mắc rằng nếu dung lượng của ảnh giảm đi nhiều như vậy thì chất lượng ảnh sẽ như thế nào. Tôi xin trả lời rằng chất lượng ảnh sẽ ko thay đổi nếu trong danh sách ảnh của bạn chỉ có từ là Losslessly compressing hoặc là compressing, còn nếu bạn nhìn thấy có từ resized tức là google đã thay đổi kích thước ảnh của bạn, nó sẽ thay đổi chất lượng với các kích thước màn hình khác nhau, nên tốt nhất bạn nên check kỹ trường hợp này.</p><p>Với những hình ảnh có thừa kích thước (Delivering scaled image assets):</p><figure class=\"image\"><img style=\"aspect-ratio:525/224;\" src=\"http://imgur.com/5VXaU7V.png\" alt=\"\" width=\"525\" height=\"224\"></figure><p>Nghĩa là chỗ đó bạn đã fix ảnh có width và heght là 400 x 400 chẳng hạn, thì tốt nhất bạn phải cắt ảnh có có kích thước như vậy nó sẽ giảm đáng kể dung lượng ảnh xuống.</p><figure class=\"image\"><img style=\"aspect-ratio:770/391;\" src=\"http://imgur.com/h2bAmiO.png\" alt=\"pixel\" width=\"770\" height=\"391\"></figure><p>Bạn có thể thấy lượng pixel thừa là rất nhiều với những hình ảnh lớn hơn kích thước bạn cần.</p><p>Một lưu ý cuối cùng với bạn là nên Download img ở tab desktop về thì chất lượng ảnh sẽ được giữ nguyên.</p><h2><strong>2. Minify Css/Js</strong></h2><p>Minify css tức là nén file css/js lại để có dung lượng file nhỏ hơn, nó sẽ xóa tất cả khoảng trống trong file css/js của bạn để giảm dung lượng của file xuống.</p><figure class=\"image\"><img style=\"aspect-ratio:1064/446;\" src=\"http://imgur.com/cmlVYU6.png\" alt=\"minify css js.png\" width=\"1064\" height=\"446\"></figure><p>Trước khi minify</p><p>&nbsp;body\n{\n &nbsp;background-color:#d0e4fe;\n}\nh1\n{\n &nbsp; color:orange;\n &nbsp; text-align:center;\n}\n</p><p>Sau khi minify:</p><p>&nbsp;body {background-color:#d0e4fe;} h1 {color:orange;text-align:center;}\n</p><p>Trường hợp này thì cách fix hoàn toàn tương tự như đối với phần đầu tiên optimize images thôi, bạn chỉ cần download về và thay các file css/js là xong.</p><p>Khi thay các file thì nó sẽ là 1 chuỗi css/js liền mạch sẽ rất khó khăn trong quá trình phát triển, vậy lời khuyên cho bạn là tốt nhất website đã chạy thực tế hoặc những file đó đã không sửa đến nữa thì thay. Hoặc nếu bạn có hiểu biết về lập trình thì bạn có thể sử dụng công cụ nén là gulp, bạn vui lòng search từ khóa minify css/js with gulp sẽ có rất nhiều bài hướng dẫn về trường hợp này.</p><p>Đối với css thì các bạn không nên dùng @import url(\"style.css\") trong file css vì nó sẽ làm chậm quá trình tải trang web.</p><h2><strong>3. Render blocking Css</strong></h2><p>Đây cũng là phần rất nhiều website hiện nay đang mắc phải và cách fix của nó cũng không hề đơn giản như hai phần trước. Vậy render là gì, Render chính là cách mà trình duyệt load trang web của bạn. Thông thường khi website được load nó sẽ download toàn bộ css về trước khi render html, vậy làm sao quá trình render được nhanh nhất:</p><ol><li>Như đã nói ở trên là không sử dụng @import trong file css, mà nếu thật sự cần thì load 1 file riêng &lt;link rel=\"stylesheet\" href=\"style.css\"&gt;</li><li>Gộp những file nhỏ thành một file css duy nhất, nếu các bạn load quá nhiều css thì trình duyệt sẽ phải tạo nhiều request tới server để download về những file có dung lượng rất nhỏ, vậy tốt nhất nên gộp thành một để tạo 1 request duy nhất.</li><li>Chỉ rõ label conditional css, nghĩa là file nào được sử dụng ở tất cả thiết bị thì chúng ta thêm vào media = \"all\", còn nếu chỉ sử dụng cho print thì thêm vào &lt;link href=\"print.css\" rel=\"stylesheet\" media=\"print\"&gt; hoặc &lt;link href=\"other.css\" rel=\"stylesheet\" media=\"(min-width: 40em)\"&gt;. Thuộc tính media báo cho trình duyệt biết rằng nó sẽ chỉ phải download file đó khi cần thiết mà thôi.</li><li>Không nên sử dụng một file css quá nhỏ, tốt nhất nên gộp nó vào hoặc inline nó trên cùng của trang.</li></ol><p>&lt;style&gt;\n.... your small css instructions here .....\n&lt;/style&gt;\n</p><ol><li>Không nên dùng style trực tiếp trong thẻ HTMl. &lt;p style=\"color:red\"&gt;Some text has red color&lt;/p&gt; mà nên dùng nó trong file css riêng.</li></ol><p>Ngoài ra bạn có thể tham khảo bài viết của <a href=\"https://viblo.asia/u/sonchedinh\">@sonchedinh</a> tại đây. <a href=\"https://viblo.asia/sonchedinh/posts/qm6RWq5zGeJE\">https://viblo.asia/sonchedinh/posts/qm6RWq5zGeJE</a></p><h2><strong>4. Render blocking javascripts</strong></h2><p>Render blocking javascripts tức là các file javascripts sẽ chặn hiển thị của trang web:</p><figure class=\"image\"><img style=\"aspect-ratio:1071/461;\" src=\"http://imgur.com/WUMgapp.png\" alt=\"render js.png\" width=\"1071\" height=\"461\"></figure><p>Render Javascripts có nghĩa là khi tải một trang web, nếu trình duyệt gặp một file hay một thuộc tính javascripts nó sẽ ngừng tải html để tải và thực thi mã javascript, khi nào thực thi xong javascripts thì html mới tiếp tục được tải. Điều này sẽ làm chậm quá trình tải trang web của bạn.</p><p>Lời khuyên của google đưa ra là defer or asynchronously vậy defer và asynchronously là gì, và làm sao để fix nó.</p><p>// nothing\n&lt;script src=\"scripts.js\"&gt;&lt;/script&gt;\n// async\n&lt;script src=\"scripts.js\" async&gt;&lt;/script&gt;\n\n// defer\n&lt;script src=\"scripts.js\" defer&gt;&lt;/script&gt;\n</p><p>Nhìn đoạn code trên ta thấy có 3 cách để load một file javascript. Vậy điển khác nhau giữa chúng là gì:</p><figure class=\"image\"><img style=\"aspect-ratio:600/335;\" src=\"http://imgur.com/caYWKQ0.jpg\" alt=\"defer async javascript.jpg\" width=\"600\" height=\"335\"></figure><p>Nhìn vào bức ảnh này bạn có thể thấy cách load trang:</p><ol><li>Dòng đầu tiên là cách load trang không có thuộc tính nào, html sẽ dừng tải đến khi mã javascript được tải và thực thi xong. Như vậy trang của bạn phải dừng lại để tải Javascript xong mới tiếp tục tải HTML, nó sẽ làm chậm quá trình load trang web của bạn.</li><li>Có thuộc tính async lúc này HTML và Javascript được tải song song, nhưng HTML sẽ dừng tải đến khi javascript được thực thi xong.</li><li>Có thuộc tính defer tức là HTML và Javascript sẽ cùng được tải, khi tải xong HTML thì Javascript mới được thực thi.</li></ol><p>Vậy nếu file Js của bạn chỉ cần thực hiện khi trang được load hoàn toàn thì có thể dùng thuộc tính defer còn nếu muốn nó được thực hiện cùng với HTML được load thì dùng async.</p><p>Do vậy tùy theo tác dụng của file js của bạn mà quyết định cho phù hợp dùng thuộc tính nào.</p><p>Chú ý: Nếu bạn dùng thư viện Jquery mà có file php nào đó bạn viết trực tiếp js vào thì thư viện cần được load theo cách thông thường.</p><p>Lưu ý nữa là với mã javascript bạn luôn để ở cuối trang web - trước thẻ &lt;/body&gt;, và css thì luôn để đầu trang - trước thẻ &lt;/head&gt;.</p><h2><strong>5. Leverage browser caching</strong></h2><p>Đây có lẽ là một phần rất quan trong đối với bất kỳ website nào. Chúng ta sẽ thông báo cho trình duyệt là phải remember những resources (images, js, css ...) đã được load, khi người dùng sang trang khác hoặc quay lại trang cũ thì những gì đã được load rồi sẽ không phải load lại lần nữa.</p><p>Bạn vui lòng tạo 1 file .htaccess hoặc edit nếu đã có và thêm vào đoạn mã sau:</p><p>## EXPIRES CACHING ##\n&lt;IfModule mod_expires.c&gt;\n &nbsp; &nbsp;ExpiresActive On\n &nbsp; &nbsp;ExpiresByType image/jpg \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/jpeg \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/gif \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/png \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType text/css \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType text/html \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType application/pdf \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType text/x-javascript \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType application/x-shockwave-flash \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType image/x-icon \"access 1 year\"\n &nbsp; &nbsp;ExpiresDefault \"access 1 month\"\n&lt;/IfModule&gt;\n\n# 1 Month for most static assets\n&lt;filesMatch \".(css|jpg|jpeg|png|gif|js|ico)$\"&gt;\n &nbsp; &nbsp;Header set Cache-Control \"max-age=2592000, public\"\n&lt;/filesMatch&gt;\n## EXPIRES CACHING ##\n</p><p>Bạn có thể thay đổi thời gian được cache ở trên cho phù hợp với website của mình.</p><p>Lưu ý .htaccess không có tác dụng với web server là NGINX</p><h2><strong>6. Enable gzip compression</strong></h2><p>Gzip là một giải pháp để nén file (js, css, html ...) trong quá trình truyền tải qua mạng. Nó sẽ giúp cho dung lượng của file giảm đi đáng kể để tăng tốc độ tải trang web của bạn.</p><h3><strong>Thêm vào .htaccess đối với server là apache</strong></h3><p>&lt;ifModule mod_gzip.c&gt;\n &nbsp; &nbsp;mod_gzip_on Yes\n &nbsp; &nbsp;mod_gzip_dechunk Yes\n &nbsp; &nbsp;mod_gzip_item_include file .(html?|txt|css|js|php|pl)$\n &nbsp; &nbsp;mod_gzip_item_include handler ^cgi-script$\n &nbsp; &nbsp;mod_gzip_item_include mime ^text/.*\n &nbsp; &nbsp;mod_gzip_item_include mime ^application/x-javascript.*\n &nbsp; &nbsp;mod_gzip_item_exclude mime ^image/.*\n &nbsp; &nbsp;mod_gzip_item_exclude rspheader ^Content-Encoding:.*gzip.*\n&lt;/ifModule&gt;\n</p><h3><strong>Với Apache webservers</strong></h3><p>Thêm vào .htaccess</p><p>AddOutputFilterByType DEFLATE text/plain\nAddOutputFilterByType DEFLATE text/html\nAddOutputFilterByType DEFLATE text/xml\nAddOutputFilterByType DEFLATE text/css\nAddOutputFilterByType DEFLATE application/xml\nAddOutputFilterByType DEFLATE application/xhtml+xml\nAddOutputFilterByType DEFLATE application/rss+xml\nAddOutputFilterByType DEFLATE application/javascript\nAddOutputFilterByType DEFLATE application/x-javascript\n</p><h3><strong>NGINX webservers</strong></h3><p>Thêm vào file config</p><p>gzip on;\ngzip_comp_level 2;\ngzip_http_version 1.0;\ngzip_proxied any;\ngzip_min_length 1100;\ngzip_buffers 16 8k;\ngzip_types text/plain text/html text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript;\n\n# Disable for IE &lt; 6 because there are some known problems\ngzip_disable \"MSIE [1-6].(?!.*SV1)\";\n\n# Add a vary header for downstream proxies to avoid sending cached gzipped files to IE6\ngzip_vary on;\n</p><h2><strong>6. Lazy loading images</strong></h2><p>Đối với những website có nhiều hình ảnh thì phần này sẽ rất quan trọng đối với tốc độ load trong web của bạn, lazy loading có thể hiểu là hình ảnh chỉ được tải khi người dùng kéo đến nó. Kéo đến đâu ảnh được load độc lập đến đó.</p><p>Trước tiên tải file jquery.lazyload.js tại đây <a href=\"https://github.com/tuupola/jquery_lazyload\">https://github.com/tuupola/jquery_lazyload</a>, chú ý chỉ lấy file jquery.lazyload.js mà thôi.</p><p>Nhúng vào website của bạn:</p><p>&lt;script src=\"jquery.js\" type=\"text/javascript\"&gt;&lt;/script&gt;\n&lt;script src=\"jquery.lazyload.js\" type=\"text/javascript\"&gt;&lt;/script&gt;\n</p><p>Đối với trang php hình ảnh sẽ được load như sau:</p><p>&lt;img class=\"lazy\" src=\"data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=\" data-original=\"img/example.jpg\" width=\"640\" height=\"480\"&gt;\n</p><p>Bạn có thế thấy src lúc này không phải là hỉnh ảnh bạn muốn, mà nó chỉ là một ảnh base64 có kích thước 1px mà thôi, khi trang được load thì hình ảnh này sẽ không được tải về luôn mà nó sẽ đợi đến khi người dùng kéo đến nó thì nó mới được taỉ về. data-original chính là link đến hình ảnh mà chúng ta cần.</p><p>Trong file Js hoặc cuối trang php bạn đặt đoạn code sau:</p><p>$(\"img.lazy\").lazyload({\n &nbsp; &nbsp;effect : \"fadeIn\"\n});\n</p><p>Như vậy là chúng ta đã có một trang web có hình ảnh được load theo lazy rồi đó.</p><p>Trên đây là toàn bộ những gì mình muốn chia sẻ với bạn, ngoài ra các bạn cũng có thể tìm hiểu thêm về cách tối ưu server như Zend Opcache để website của bạn có hiệu năng cao nhất.</p><p>Hy vọng rằng bài viết có ích với bạn.Nếu có bất cứ thắc mắc nào xin vui lòng để lại comment ở phía dưới, tác giả rất vui lòng được giải đáp thắc mắc của bạn.</p><p>Thank you for reading!</p>', '2024-01-08 08:25:05.000000', b'0', 'Tối ưu performance website', 1, 8, 0, 48),
(3, '<p>Trong bài viết này mình sẽ chia sẻ cho bạn cách tối ưu tốc độ website, để có tốc độ load trang web nhanh hơn cũng như có điểm ranking cao hơn với google search engine.</p><p>Đầu tiên bạn vào trang web <a href=\"https://developers.google.com/speed/pagespeed/insights/\">https://developers.google.com/speed/pagespeed/insights/</a> và nhập địa chỉ website vào input và ấn Analyze thì google sẽ chấm điểm website của bạn xem nó được bao nhiêu điểm và sẽ đưa ra những recommend để web site của bạn chạy nhanh hơn dưới đây mình sẽ tổng hợp những yêu cầu chủ yếu của google đưa ra và cách fix những yêu cầu này.</p><h2><strong>1. Optimize images</strong></h2><p>Đây có lẽ là yêu cầu đầu tiên và cũng là hay gặp nhất với bất kì website nào. Như bạn thấy trong hình thì có nhiều ảnh được đưa ra là có thể giảm đến 90% dung lượng của ảnh xuống, kết quả thật đáng mơ ước phải không.</p><figure class=\"image\"><img style=\"aspect-ratio:1009/476;\" src=\"http://imgur.com/Ym6zBZp.png\" alt=\"alt\" width=\"1009\" height=\"476\"></figure><p>Vậy làm sao để fix được trường hợp này. Thật may là google đã làm hết cho bạn, bạn chỉ cần kéo xuống dưới cùng của site đó (tab destop nhé) và download ảnh về và thay vào website của mình mà thôi.</p><figure class=\"image\"><img style=\"aspect-ratio:596/134;\" src=\"http://imgur.com/TcGfIPR.png\" alt=\"optimize img.png\" width=\"596\" height=\"134\"></figure><p>Vậy cũng sẽ có nhiều bạn thắc mắc rằng nếu dung lượng của ảnh giảm đi nhiều như vậy thì chất lượng ảnh sẽ như thế nào. Tôi xin trả lời rằng chất lượng ảnh sẽ ko thay đổi nếu trong danh sách ảnh của bạn chỉ có từ là Losslessly compressing hoặc là compressing, còn nếu bạn nhìn thấy có từ resized tức là google đã thay đổi kích thước ảnh của bạn, nó sẽ thay đổi chất lượng với các kích thước màn hình khác nhau, nên tốt nhất bạn nên check kỹ trường hợp này.</p><p>Với những hình ảnh có thừa kích thước (Delivering scaled image assets):</p><figure class=\"image\"><img style=\"aspect-ratio:525/224;\" src=\"http://imgur.com/5VXaU7V.png\" alt=\"\" width=\"525\" height=\"224\"></figure><p>Nghĩa là chỗ đó bạn đã fix ảnh có width và heght là 400 x 400 chẳng hạn, thì tốt nhất bạn phải cắt ảnh có có kích thước như vậy nó sẽ giảm đáng kể dung lượng ảnh xuống.</p><figure class=\"image\"><img style=\"aspect-ratio:770/391;\" src=\"http://imgur.com/h2bAmiO.png\" alt=\"pixel\" width=\"770\" height=\"391\"></figure><p>Bạn có thể thấy lượng pixel thừa là rất nhiều với những hình ảnh lớn hơn kích thước bạn cần.</p><p>Một lưu ý cuối cùng với bạn là nên Download img ở tab desktop về thì chất lượng ảnh sẽ được giữ nguyên.</p><h2><strong>2. Minify Css/Js</strong></h2><p>Minify css tức là nén file css/js lại để có dung lượng file nhỏ hơn, nó sẽ xóa tất cả khoảng trống trong file css/js của bạn để giảm dung lượng của file xuống.</p><figure class=\"image\"><img style=\"aspect-ratio:1064/446;\" src=\"http://imgur.com/cmlVYU6.png\" alt=\"minify css js.png\" width=\"1064\" height=\"446\"></figure><p>Trước khi minify</p><p>&nbsp;body\n{\n &nbsp;background-color:#d0e4fe;\n}\nh1\n{\n &nbsp; color:orange;\n &nbsp; text-align:center;\n}\n</p><p>Sau khi minify:</p><p>&nbsp;body {background-color:#d0e4fe;} h1 {color:orange;text-align:center;}\n</p><p>Trường hợp này thì cách fix hoàn toàn tương tự như đối với phần đầu tiên optimize images thôi, bạn chỉ cần download về và thay các file css/js là xong.</p><p>Khi thay các file thì nó sẽ là 1 chuỗi css/js liền mạch sẽ rất khó khăn trong quá trình phát triển, vậy lời khuyên cho bạn là tốt nhất website đã chạy thực tế hoặc những file đó đã không sửa đến nữa thì thay. Hoặc nếu bạn có hiểu biết về lập trình thì bạn có thể sử dụng công cụ nén là gulp, bạn vui lòng search từ khóa minify css/js with gulp sẽ có rất nhiều bài hướng dẫn về trường hợp này.</p><p>Đối với css thì các bạn không nên dùng @import url(\"style.css\") trong file css vì nó sẽ làm chậm quá trình tải trang web.</p><h2><strong>3. Render blocking Css</strong></h2><p>Đây cũng là phần rất nhiều website hiện nay đang mắc phải và cách fix của nó cũng không hề đơn giản như hai phần trước. Vậy render là gì, Render chính là cách mà trình duyệt load trang web của bạn. Thông thường khi website được load nó sẽ download toàn bộ css về trước khi render html, vậy làm sao quá trình render được nhanh nhất:</p><ol><li>Như đã nói ở trên là không sử dụng @import trong file css, mà nếu thật sự cần thì load 1 file riêng &lt;link rel=\"stylesheet\" href=\"style.css\"&gt;</li><li>Gộp những file nhỏ thành một file css duy nhất, nếu các bạn load quá nhiều css thì trình duyệt sẽ phải tạo nhiều request tới server để download về những file có dung lượng rất nhỏ, vậy tốt nhất nên gộp thành một để tạo 1 request duy nhất.</li><li>Chỉ rõ label conditional css, nghĩa là file nào được sử dụng ở tất cả thiết bị thì chúng ta thêm vào media = \"all\", còn nếu chỉ sử dụng cho print thì thêm vào &lt;link href=\"print.css\" rel=\"stylesheet\" media=\"print\"&gt; hoặc &lt;link href=\"other.css\" rel=\"stylesheet\" media=\"(min-width: 40em)\"&gt;. Thuộc tính media báo cho trình duyệt biết rằng nó sẽ chỉ phải download file đó khi cần thiết mà thôi.</li><li>Không nên sử dụng một file css quá nhỏ, tốt nhất nên gộp nó vào hoặc inline nó trên cùng của trang.</li></ol><p>&lt;style&gt;\n.... your small css instructions here .....\n&lt;/style&gt;\n</p><ol><li>Không nên dùng style trực tiếp trong thẻ HTMl. &lt;p style=\"color:red\"&gt;Some text has red color&lt;/p&gt; mà nên dùng nó trong file css riêng.</li></ol><p>Ngoài ra bạn có thể tham khảo bài viết của <a href=\"https://viblo.asia/u/sonchedinh\">@sonchedinh</a> tại đây. <a href=\"https://viblo.asia/sonchedinh/posts/qm6RWq5zGeJE\">https://viblo.asia/sonchedinh/posts/qm6RWq5zGeJE</a></p><h2><strong>4. Render blocking javascripts</strong></h2><p>Render blocking javascripts tức là các file javascripts sẽ chặn hiển thị của trang web:</p><figure class=\"image\"><img style=\"aspect-ratio:1071/461;\" src=\"http://imgur.com/WUMgapp.png\" alt=\"render js.png\" width=\"1071\" height=\"461\"></figure><p>Render Javascripts có nghĩa là khi tải một trang web, nếu trình duyệt gặp một file hay một thuộc tính javascripts nó sẽ ngừng tải html để tải và thực thi mã javascript, khi nào thực thi xong javascripts thì html mới tiếp tục được tải. Điều này sẽ làm chậm quá trình tải trang web của bạn.</p><p>Lời khuyên của google đưa ra là defer or asynchronously vậy defer và asynchronously là gì, và làm sao để fix nó.</p><p>// nothing\n&lt;script src=\"scripts.js\"&gt;&lt;/script&gt;\n// async\n&lt;script src=\"scripts.js\" async&gt;&lt;/script&gt;\n\n// defer\n&lt;script src=\"scripts.js\" defer&gt;&lt;/script&gt;\n</p><p>Nhìn đoạn code trên ta thấy có 3 cách để load một file javascript. Vậy điển khác nhau giữa chúng là gì:</p><figure class=\"image\"><img style=\"aspect-ratio:600/335;\" src=\"http://imgur.com/caYWKQ0.jpg\" alt=\"defer async javascript.jpg\" width=\"600\" height=\"335\"></figure><p>Nhìn vào bức ảnh này bạn có thể thấy cách load trang:</p><ol><li>Dòng đầu tiên là cách load trang không có thuộc tính nào, html sẽ dừng tải đến khi mã javascript được tải và thực thi xong. Như vậy trang của bạn phải dừng lại để tải Javascript xong mới tiếp tục tải HTML, nó sẽ làm chậm quá trình load trang web của bạn.</li><li>Có thuộc tính async lúc này HTML và Javascript được tải song song, nhưng HTML sẽ dừng tải đến khi javascript được thực thi xong.</li><li>Có thuộc tính defer tức là HTML và Javascript sẽ cùng được tải, khi tải xong HTML thì Javascript mới được thực thi.</li></ol><p>Vậy nếu file Js của bạn chỉ cần thực hiện khi trang được load hoàn toàn thì có thể dùng thuộc tính defer còn nếu muốn nó được thực hiện cùng với HTML được load thì dùng async.</p><p>Do vậy tùy theo tác dụng của file js của bạn mà quyết định cho phù hợp dùng thuộc tính nào.</p><p>Chú ý: Nếu bạn dùng thư viện Jquery mà có file php nào đó bạn viết trực tiếp js vào thì thư viện cần được load theo cách thông thường.</p><p>Lưu ý nữa là với mã javascript bạn luôn để ở cuối trang web - trước thẻ &lt;/body&gt;, và css thì luôn để đầu trang - trước thẻ &lt;/head&gt;.</p><h2><strong>5. Leverage browser caching</strong></h2><p>Đây có lẽ là một phần rất quan trong đối với bất kỳ website nào. Chúng ta sẽ thông báo cho trình duyệt là phải remember những resources (images, js, css ...) đã được load, khi người dùng sang trang khác hoặc quay lại trang cũ thì những gì đã được load rồi sẽ không phải load lại lần nữa.</p><p>Bạn vui lòng tạo 1 file .htaccess hoặc edit nếu đã có và thêm vào đoạn mã sau:</p><p>## EXPIRES CACHING ##\n&lt;IfModule mod_expires.c&gt;\n &nbsp; &nbsp;ExpiresActive On\n &nbsp; &nbsp;ExpiresByType image/jpg \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/jpeg \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/gif \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType image/png \"access 1 year\"\n &nbsp; &nbsp;ExpiresByType text/css \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType text/html \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType application/pdf \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType text/x-javascript \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType application/x-shockwave-flash \"access 1 month\"\n &nbsp; &nbsp;ExpiresByType image/x-icon \"access 1 year\"\n &nbsp; &nbsp;ExpiresDefault \"access 1 month\"\n&lt;/IfModule&gt;\n\n# 1 Month for most static assets\n&lt;filesMatch \".(css|jpg|jpeg|png|gif|js|ico)$\"&gt;\n &nbsp; &nbsp;Header set Cache-Control \"max-age=2592000, public\"\n&lt;/filesMatch&gt;\n## EXPIRES CACHING ##\n</p><p>Bạn có thể thay đổi thời gian được cache ở trên cho phù hợp với website của mình.</p><p>Lưu ý .htaccess không có tác dụng với web server là NGINX</p><h2><strong>6. Enable gzip compression</strong></h2><p>Gzip là một giải pháp để nén file (js, css, html ...) trong quá trình truyền tải qua mạng. Nó sẽ giúp cho dung lượng của file giảm đi đáng kể để tăng tốc độ tải trang web của bạn.</p><h3><strong>Thêm vào .htaccess đối với server là apache</strong></h3><p>&lt;ifModule mod_gzip.c&gt;\n &nbsp; &nbsp;mod_gzip_on Yes\n &nbsp; &nbsp;mod_gzip_dechunk Yes\n &nbsp; &nbsp;mod_gzip_item_include file .(html?|txt|css|js|php|pl)$\n &nbsp; &nbsp;mod_gzip_item_include handler ^cgi-script$\n &nbsp; &nbsp;mod_gzip_item_include mime ^text/.*\n &nbsp; &nbsp;mod_gzip_item_include mime ^application/x-javascript.*\n &nbsp; &nbsp;mod_gzip_item_exclude mime ^image/.*\n &nbsp; &nbsp;mod_gzip_item_exclude rspheader ^Content-Encoding:.*gzip.*\n&lt;/ifModule&gt;\n</p><h3><strong>Với Apache webservers</strong></h3><p>Thêm vào .htaccess</p><p>AddOutputFilterByType DEFLATE text/plain\nAddOutputFilterByType DEFLATE text/html\nAddOutputFilterByType DEFLATE text/xml\nAddOutputFilterByType DEFLATE text/css\nAddOutputFilterByType DEFLATE application/xml\nAddOutputFilterByType DEFLATE application/xhtml+xml\nAddOutputFilterByType DEFLATE application/rss+xml\nAddOutputFilterByType DEFLATE application/javascript\nAddOutputFilterByType DEFLATE application/x-javascript\n</p><h3><strong>NGINX webservers</strong></h3><p>Thêm vào file config</p><p>gzip on;\ngzip_comp_level 2;\ngzip_http_version 1.0;\ngzip_proxied any;\ngzip_min_length 1100;\ngzip_buffers 16 8k;\ngzip_types text/plain text/html text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript;\n\n# Disable for IE &lt; 6 because there are some known problems\ngzip_disable \"MSIE [1-6].(?!.*SV1)\";\n\n# Add a vary header for downstream proxies to avoid sending cached gzipped files to IE6\ngzip_vary on;\n</p><h2><strong>6. Lazy loading images</strong></h2><p>Đối với những website có nhiều hình ảnh thì phần này sẽ rất quan trọng đối với tốc độ load trong web của bạn, lazy loading có thể hiểu là hình ảnh chỉ được tải khi người dùng kéo đến nó. Kéo đến đâu ảnh được load độc lập đến đó.</p><p>Trước tiên tải file jquery.lazyload.js tại đây <a href=\"https://github.com/tuupola/jquery_lazyload\">https://github.com/tuupola/jquery_lazyload</a>, chú ý chỉ lấy file jquery.lazyload.js mà thôi.</p><p>Nhúng vào website của bạn:</p><p>&lt;script src=\"jquery.js\" type=\"text/javascript\"&gt;&lt;/script&gt;\n&lt;script src=\"jquery.lazyload.js\" type=\"text/javascript\"&gt;&lt;/script&gt;\n</p><p>Đối với trang php hình ảnh sẽ được load như sau:</p><p>&lt;img class=\"lazy\" src=\"data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=\" data-original=\"img/example.jpg\" width=\"640\" height=\"480\"&gt;\n</p><p>Bạn có thế thấy src lúc này không phải là hỉnh ảnh bạn muốn, mà nó chỉ là một ảnh base64 có kích thước 1px mà thôi, khi trang được load thì hình ảnh này sẽ không được tải về luôn mà nó sẽ đợi đến khi người dùng kéo đến nó thì nó mới được taỉ về. data-original chính là link đến hình ảnh mà chúng ta cần.</p><p>Trong file Js hoặc cuối trang php bạn đặt đoạn code sau:</p><p>$(\"img.lazy\").lazyload({\n &nbsp; &nbsp;effect : \"fadeIn\"\n});\n</p><p>Như vậy là chúng ta đã có một trang web có hình ảnh được load theo lazy rồi đó.</p><p>Trên đây là toàn bộ những gì mình muốn chia sẻ với bạn, ngoài ra các bạn cũng có thể tìm hiểu thêm về cách tối ưu server như Zend Opcache để website của bạn có hiệu năng cao nhất.</p><p>Hy vọng rằng bài viết có ích với bạn.Nếu có bất cứ thắc mắc nào xin vui lòng để lại comment ở phía dưới, tác giả rất vui lòng được giải đáp thắc mắc của bạn.</p><p>Thank you for reading!</p>', '2024-01-08 08:55:54.000000', b'0', 'Tối ưu  performance website 2', 1, 29, 0, 91),
(4, '<p>Content of the editor.9 yếu tố cần thiết để có được một bài viết hấp dẫn</p><p>0 Lượt xem</p><p>Tin tức</p><p>Trong lĩnh vực marketing online, bạn sẽ thường xuyên được nghe, nhìn thấy cụm từ \"content marketing\" hay marketing nội dung, là một trong những yếu tố quan trọng để giới thiệu trang web và thiết lập vị trí của bạn như một chuyên gia trong lĩnh vực này. Tuy nhiên, marketing nội dung không giống với việc đều đặn đăng tải bài viết lên blog, website ngày qua ngày. Điều này cho thấy, muốn hấp dẫn được khách hàng bạn cần có những bài viết \"chất\" chứ không phải những dòng chữ cứng nhắc trên màn hình. Dưới đây là 9 yếu tố cần thiết bạn cần có thể có được một bài viết hấp dẫn nhất. Nếu bạn chỉ dừng lại ở viêc tập trung vào những dòng chữ ngày qua ngày thì hãy dừng lại, kiểm tra các yếu tố trên, bạn sẽ tìm thấy những điều mà bài viết của bạn cần cải thiện.</p><h2><strong>1. BÀI VIẾT CẦN CÓ ĐIỂM NHẤN</strong></h2><p>Có rất nhiều bài viết thực sự không có điểm nhất, nội dung không đúng trọng tâm, họ có rất nhiều thứ để viết nhưng không có một trọng tâm nào cả. Một bài viết cần liên kết thông tin, thống nhất và có trọng tâm nhất định. Một bài viết có nội dung hay, hấp dẫn thì người đọc sẽ chú ý, nhớ và đọc lại, có động lực chia sẻ, bình luận và gắn kết với nó. Một bài viết có trọng tâm là bài viết đã hoàn thành nhiệm vụ và thành công.</p><p><img src=\"https://zozo.vn/upload/public/news-images/2018/01/02/3-cach-de-mot-tieu-de-bai-viet-gay-anh-huong-toi-ket-qua-tim-kiem-3.jpg\" width=\"799\" height=\"320\"></p><p>Một lợi ích khác của việc tập trung vào trọng tâm bài viết là tận dụng được những từ khóa nhất định. Trong nỗ lực phát triển marketing nội dung, bạn thường xuyên tập trung vào phát triển các từ khóa thông qua các chiến dịch SEO và nội dung. Do đó, nếu bài viết hay và nội dung xuyên suốt thì sẽ bám sát từ khóa và nhu cầu khách hàng. Đây là một sự hỗ trợ rất lớn cho quảng cáo từ khóa.</p><h2><strong>2. HÌNH ẢNH</strong></h2><p>Hình ảnh là yếu tố quan trọng để thu hút sự chú ý của khách hàng. Mỗi bài viết nên có ít nhất 1 hình ảnh có liên quan đến nội dung bài viết. Mặc dù nội dung là điều quan trọng nhất cho các công cụ tìm kiếm nhưng những bài viết của bạn cần thêm những hình ảnh để bài viết sinh động và giảm bớt sự nhàm chán cho người đọc. Sử dụng hình ảnh cho bài viết tưởng chừng đơn giản, chỉ cần đăng ảnh lên là xong. Tuy nhiên, hình ảnh bạn đăng lên có thể ảnh hưởng tới tốc độ tải và thứ hạng của web. Bởi vậy, bạn cần tối ưu hình ảnh trước khi tải tên, lựa chọn ảnh có nội dung bám sát nội dung và đặt tên cho hình ảnh.</p><h2>3. CẤU TRÚC</h2><p><img src=\"https://zozo.vn/upload/public/news-images/2018/01/02/8-nguyen-lieu-can-co-cho-1-bai-blog2-433x650.jpg\" width=\"683\" height=\"1024\"></p><p>Cấu trúc bài viết cũng cần vững chắc và liên kết như chiếc bánh nhiều tầng</p><p>Đây là một trong những khía cạnh thường bị bỏ qua trong các bài viết. Để liên kết một ý tưởng, bạn cần tổ chức những suy nghĩ của mình để bài viết được đúng trọng tâm, các câu văn có sự kết nối và bám sát nội dung. Nó là yếu tố quan trọng để bạn xây dựng nội dung bài viết một cách hấp dẫn và thành công.</p><p>Cáu trúc ý tưởng sẽ được thể hiện qua bố cục bài viết. Một bài viết sẽ có những tiêu đề chính, tiêu đề phụ, các đoạn phát triển. Để làm được điều này, bạn cần thiết lập một dàn bài trong tưởng tượng giống như dàn bài trong các bài văn mà chúng ta đã học ở cấp 1. Tất cả những điều này sẽ đem đến sự mượt mà trong giọng văn, thu hút người đọc và rất dễ ghi nhớ khi họ muốn đọc lướt nội dung.</p><h2><strong>4. NỘI DUNG ĐỘC ĐÁO</strong></h2><p>Đầu tiên, bạn cần biết điều gì người đọc mà bạn đang hướng tới quan tâm để viết những nội dung xoay quanh vấn đề đó. Đồng thời, nội dung phải đưa tới những chủ đề liên quan đến website của bạn. Nói cách khác, bài viết để thành công không đơn giản là viết lại những gì người khác đã đưa ra mà bạn cần làm mới nó cả về nội dung và cách tiếp cận. Bạn có thể lấy ý tưởng trên các trang khác nhưng phải biến thành những câu chữ của mình. Như vậy, nội dung sẽ tập trung vào khách hàng. Những nội dung đặc sắc sẽ được chia sẻ và tạo thêm nhiều liên kết đến trang của bạn hơn.</p><h2><strong>5. ĐỘ DÀI LÍ TƯỞNG</strong></h2><p>Câu hỏi mà rất nhiều người viết conten marketing quan tâm là độ dài bài viết bao nhiêu là đủ: đủ dài, đủ hấp dẫn, đủ để được google chú ý đến?</p><p>Có rất nhiều thống kê đến độ dài các bài viết đã được nghiên cứu và chia sẻ. Theo đó, các bài viết dài từ 1000-2000 từ thường là lí tưởng nhất. Các bài viết có số lượng từ như vậy thường giải quyết được triệt để các vấn đề đặt ra và được google chú ý hơn là các bài viết ngắn. Nếu bài viết của bạn chỉ từ 300-400 từ thì bạn cần nỗ nực hơn để níu chân người đọc.</p><p>Tuy nhiên, bài viết dài cần phải có nội dung liên kết, không nên viết quá tràn lan mà phải viết để đủ hấp dẫn với người đọc. Đồng thời, bài viết dài cần chia các đoạn, tiêu đề phù hợp sao cho người đọc dễ hiểu.</p><h2><strong>6. LIÊN KẾT NỘI BỘ</strong></h2><p>Một chiến lược sử dụng liên kết nội bộ- là những liên kết bài viết liên quan đến nội dung bạn đang cung cấp từ chính website của bạn - có thể nâng cao giá trị cho website của bạn. Để thực hiện được điều này không khó, bạn chỉ cần nhớ những nguyên tắc cơ bản sau:</p><p>Tạo nội dung phong phú cho website, như vậy bạn sẽ có nhiều lựa chọn để liên kết các bài viết với nhau</p><p>Sử dụng liên kết là các bài viết được khách hàng yêu thích, người đọc sẽ thấy thích thú với nội dung và trang web của bạn.</p><p>Sử dụng vừa đủ các liên kết, nếu quá nhiều người tiêu dùng sẽ cả thấy khó nhìn và bị google đánh giá là spam. Số lượng ổn định là từ 3 đến 10 liên kết trong 1 bài viết</p><p>Sử dụng các archor text, các kí tự trong liên kết không nên chứa các từ khóa.</p><h2><strong>7. TIÊU ĐỀ GÂY CHÚ Ý</strong></h2><p><img src=\"https://zozo.vn/upload/public/news-images/2018/01/02/3-cach-de-mot-tieu-de-bai-viet-gay-anh-huong-toi-ket-qua-tim-kiem-1.jpg\" width=\"804\" height=\"536\"></p><p>Tiêu đề bài viết là yếu tố đầu tiên để gây chú ý với độc giả. Khi lướt qua bài viết có tiêu đề hay, \" giật gân\" hoặc chủ đề người đọc đang quan tâm thì khả năng tiếp cận của bài sẽ cao hơn. Nội dung bài có hay nhưng tiêu đề không tạo ra sự chú ý đến người đọc thì bài đó cũng không có ý nghĩa. Bởi vậy, đặt tiêu đề sao cho phù hợp là điều mà nhiều người viết bài rất quan tâm và chú ý.</p><p>Những tiêu đề hay thường gợi tới tình cảm, đặc biệt và sự sợ hãi.</p><h2><strong>8. CHÚ Ý ĐẾN LỖI CHÍNH TẢ</strong></h2><p>Một trong những điều gây khó chịu và làm giảm mức độ yêu thích của người đọc với một bài viết là các lỗi chính tả. Nếu bạn có nội dung hay, câu văn mạch lạc nhưng sai chính tả thì thật đáng tiếc. Vì vậy, để hạn chế lỗi này trước khi xuất bản bài viết, hãy giành thời gian gian đọc và soát lỗi cẩn thận.</p><p>Một trong những điều gây khó chịu và làm giảm mức độ yêu thích của người đọc với một bài viết là các lỗi chính tả. Nếu bạn có nội dung hay, câu văn mạch lạc nhưng sai chính tả thì thật đáng tiếc. Để hạn chế điều này, trước khi xuất bản các bài viết, hãy giành thời gian đọc lại và soát lỗi cẩn trọng. Dưới đây là một số phương pháp làm giảm tình trạng sai chính tả.</p><p>Bắt đầu viết ngay khi có ý tưởng. Không quan tâm đến lỗi chính tả, ngắt câu, ngắt đoạn. Chỉ đơn giản là bạn viết tất cả nội dung và ý tưởng xuống trong giấy.</p><p>&nbsp;</p><p><strong>9. KÊU GỌI HÀNH ĐỘNG</strong></p><p>Kêu gọi hành động là điều mà bất kì tác giả nào cũng muốn hướng tới bởi vì hành động của người đọc chính là sự kiểm chứng tốt nhất cho nội dung bài viết hấp dẫn và thành công.&nbsp;</p><p>Tất cả các bài viết đều cần kêu gọi hưởng ứng thông qua hành động. Người đọc sẵn sàng phản ứng, hành động, click và gắn kết với website thông qua lời kêu gọi: mua ngay, ghé thăm website, tải ngay... Để làm được điều đó, bạn cần khéo léo lồng ghép những hành động đó trong mọi bài viết, mọi thời điểm.</p><p>Kêu gọi hành động là chìa khóa của sự chuyển đổi từ nhận thức, thái độ sang hành động. Cho dù mục đích bài viết của bạn là gì, cuối cùng bạn vẫn muốn khách hàng mua hàng, sử dụng dịch vụ của mình. Do đó, ngay khi bắt đầu viết bài, hãy lồng ghép việc kêu gọi vào bài của bạn.</p><p>Nếu bạn có thể áp dụng những nguyên tắc này, bạn sẽ từng bước thu hút khách hàng và có chiến dịch marketing nội dung thành công.</p>', '2024-01-09 08:57:43.000000', b'0', '123123', 1, 43, 0, 119),
(5, '<p>Content of the qweqweqweditor.</p>', '2024-01-18 14:47:39.000000', b'0', 'qeqweqwe', 1, 84, 17, 336);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dateo_of_birth` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'https://mighty.tools/mockmind-api/content/human/65.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `address`, `dateo_of_birth`, `name`, `password`, `username`, `email`, `date_of_birth`, `img`) VALUES
(1, '123 Main St', '1990-01-01 00:00:00.000000', 'John Doe', 'password1', 'john_doe', 'john@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(2, '456 Oak St', '1985-07-15 00:00:00.000000', 'Jane Smith', 'password2', 'jane_smith', 'jane@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(3, '789 Maple St', '1992-03-10 00:00:00.000000', 'Alice Green', 'password3', 'alice_green', 'alice@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(4, '567 Pine St', '1988-11-22 00:00:00.000000', 'Bob Jones', 'password4', 'bob_jones', 'bob@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(5, '890 Cedar St', '1995-06-05 00:00:00.000000', 'Sara Wilson', 'password5', 'sara_wilson', 'sara@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(6, '234 Elm St', '1983-09-18 00:00:00.000000', 'Michael Brown', 'password6', 'michael_brown', 'michael@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(7, '876 Birch St', '1998-04-30 00:00:00.000000', 'Emily Taylor', 'password7', 'emily_taylor', 'emily@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(8, '543 Walnut St', '1980-08-12 00:00:00.000000', 'Ryan Miller', 'password8', 'ryan_miller', 'ryan@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(9, '678 Fir St', '1993-12-25 00:00:00.000000', 'Laura White', 'password9', 'laura_white', 'laura@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(10, '901 Oak St', '1987-07-08 00:00:00.000000', 'David Smith', 'password10', 'david_smith', 'david@example.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(11, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$A4Slsv6tS6bNJh5e068G1.mimEL5BFC2mR7cCRzQPvuoqzVEkf4o6', '', '123123@wqweqw', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(23, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$f.U749ADqFOkaJ5TfV7pBOpfjr6uqvt1FGgY2YUzuXqPjbyp9TMyW', '', 'nvtuyen101020302@gmail.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(30, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$cPSWMoATo.XgWaVi/xCmLuzunnkKcnkb8S504FlKPdScdBwSSL.Si', '', 'nvtuyen1021231231010021@gmail.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(31, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$pHQH2YIKUAKY89Gv1xXt2OaqTCsIMFfnbY6J4kmBL8PcsNHd7oEKC', '', 'nvtuyen10102002@gmail.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(33, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$Ou7i3Zv5AdN3FlhECUbFKeJF9jy0vgJBvSWKZfi9gRjHB9sL5Mjy.', '', 'nvtuyen101020024@gmail.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(34, '', NULL, 'Nguyễn Văn Tuyên', '$2a$10$MU96sV.v4RLdvdiVSxC/de2qkzElpbqOESZ9Q9Bz87325mjyF0sMm', '', '123@gmail.com', NULL, NULL),
(35, '', NULL, 'Nguyễn Văn Tuyên 2', '$2a$10$QC/ph3pHj4J3QP9umRg2sO2trJqzMbhMuRnqk4noIm6kLHlL5tBwu', '', 'user7@gmail.com', NULL, 'https://mighty.tools/mockmind-api/content/human/65.jpg'),
(36, '', NULL, 'Tan Tan Y', '$2a$10$5ekX3jMLOBJBYQTztR33G.co//ogtF86xfxAkkfkzyj/RMV2iXy6K', '', 'nvtuyen101010021@gmail.com', NULL, NULL),
(37, '', NULL, 'Nguyễn Văn Tuyên 2', '$2a$10$lSBVO0iZXOGKuoXULO86U./k7EtCiIzyL7LPwoXe0e8VaPOOsY8Yu', '', 'nvtuyen101010021@gmail.com11', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh4c7lvsc298whoyd4w9ta25cr` (`post_id`),
  ADD KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnvx9seeqqyy71bij291pwiwrg` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=473;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKh4c7lvsc298whoyd4w9ta25cr` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FKnvx9seeqqyy71bij291pwiwrg` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
