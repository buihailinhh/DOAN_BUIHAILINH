<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
    <!-- Jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- ScrollReveal -->
    <script src="${classpath}/user/js/scrollreveal.min.js"></script>
    <!-- BoxIcon -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${classpath}/user/bootstrap/css/bootstrap.min.css">
    <!-- Reset CSS -->
    <link rel="stylesheet" href="${classpath}/user/css/reset.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="${classpath}/user/css/style.css">
     <!-- Reponsive -->
    <link rel="stylesheet" href="${classpath}/user/css/reponsive.css">
    
    <link rel="stylesheet" href="${classpath}/user/css/sanpham.css">


   
</head>

<body>
    <div class="wrapper">
       <!-- header -->
        <jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
         <main class="main">
            <div class="main__breadcrumb">
                <div class="container">
                    <div class="bread-crumb">
                        <span><a href="${roothpath}/home">Trang chủ</a></span>
                        <span><a href="./danhmuc.html">Danh mục sản phẩm</a></span>
                        <span><a href="${roothpath}/sanpham">Sản phẩm</a></span>
                    </div>
                </div>
            </div>
            <div class="main__section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 none block">
                            <div class="section__sidebar-widget">
                                <div class="widget__inner">
                                    <div class="widget__list">
                                        <h3 class="widget__title">Search</h3>
                                        <div class="widget__search-box">
                                            <input type="text" placeholder="Tìm kiếm..." class="widget__input">
                                            <button class="search-icon">
                                                <i class='bx bx-search'></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="widget__list">
                                        <h3 class="widget__title">Danh mục</h3>
                                        <div class="widget__list-body">
                                            <ul class="sidebar-list">
                                                <li><a href="#">Tất cả sảm phẩm</a></li>
                                                <li><a href="#">Điều hòa</a></li>
                                                <li><a href="#">Quạt hơi mước</a></li>
                                                <li><a href="#">Quatk để bàn</a></li>
                                                <li><a href="#">Tủ lạnh 4 cánh</a></li>
                                                <li><a href="#">Sản phẩm mới (8)</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- <div class="widget__list">
                                        <h3 class="widget__title">Tags</h3>
                                        <div class="widget__list-body">
                                            <ul class="tags">
                                                <li><a href="#">Dogs</a></li>
                                                <li><a href="#">Cats</a></li>
                                                <li><a href="#">Alaska</a></li>
                                                <li><a href="#">Thức ăn</a></li>
                                                <li><a href="#">Hubby</a></li>
                                                <li><a href="#">Animals</a></li>
                                            </ul>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-12">
                            <div class="section__product-detail">
                                <div class="row">
                                    <div class="col-12 col-lg-5">
                                        <div class="product__detail-img">
                                            <div class="swiper myProduct">
                                                <div class="swiper-wrapper">
                                                <c:forEach items="${productImages }" var="productImages">
                                                    <div class="swiper-slide">
                                                        <img src="${classpath}/FileUpload/${productImages.path}" alt=""
                                                            class="swiper__product-img">
                                                    </div>
                                                    </c:forEach>
                                                   
                                                </div>
                                                <!-- <div class="swiper-button-next"></div>
                                                <div class="swiper-button-prev"></div> -->
                                                <div class="swiper-pagination"></div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12 col-lg-7">
                                        <div class="product__detail-summery">
                                            <div class="product__header mb-10">
                                                <h2 class="product__header-title">${ product.name }</h2>
                                            </div>
                                            <div class="product__price mb-10">
                                                <span class="curr__price">${product.salePrice }đ</span>
                                                <span class="old__price">${product.price }đ</span>
                                            </div>
                                            
                                            <div class="product__code mb-10">
                                                <span>Mã đơn hàng: ABC123</span>
                                            </div>
                                            <div class="product__inventroy mb-10">
                                                <span class="inventroy-title">Tình trạng: </span>
                                                <span class="inventory__varient">Còn hàng</span>
                                            </div>
                                            <div class="product__quantity mb-10">
                                                <span>
                                                    Số lượng:
                                                </span>
                                                <div class="quantity__plus mb-10">
                                                    <input type="number" name="quantity" id="quantity" value="0">
                                                </div>
                                            </div>
                                            <div class="product__cart-button">
                                                <div class="add__to__cart">
                                                    <a href="#" onclick="addToCart(${product.id},1)" class="add-cart-link">Thêm vào giỏ hàng</a>
                                                </div>
                                                <a href="#" class="add-cart-heart">
                                                    <i class='bx bx-heart'></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    
                            
                                </div>
                            </div>
                            <!-- chi tiết sản phẩm -->
                            <div class="section__product-description">
                                <h2 class="detail__heading">
                                    Chi tiết sản phẩm
                                </h2>
                                <div class="detail__text">
                                    <p>Sản phẩm được bán tại đây. Chúng tôi xin cam đoan 100% hàng chất lượng, rõ nguồn gốc xuất sứ,
                                    được kiểm thử bởi chuyên gia và có giấy phép kinh doanh. Với phương châm khách hàng là thượng đế
                                     Chúng tôi rất hân hạnh được đón tiếp quý khách .
                                    
                                    </p>
                                </div>
                            </div>

                            <!-- sản phẩm tương tự -->
                            <div class="related__products">
                                <div class="main__products-title">
                                    <p>Sản phẩm tương tự</p>
                                </div>
                                <div class="row">
                                    <div class="swiper myRelated">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/3.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Tủ Lạnh Hàn Quốc</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/7.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Máy Giat</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/4.jpeg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">May rua bat</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/2.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Nồi cơm điện cooki</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/8.jpeg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Máy Rửa bát SunMe</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/6.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Máy Lọc nước</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/4.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Dàn điều hòa văn phòng</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/8.jpg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Tivi SAMSUNG</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="./sanpham.html" class="image">
                                                            <img src="./img/products/5.jpeg" class="fit-img zoom-img">
                                                        </a>
                                                        <span class="badges">
                                                            <span class="sale">-20%</span>
                                                        </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="./sanpham.html" class="content-link">
                                                            <h5 class="title">Quạt cây hơi nước</h5>
                                                        </a>
                                                        <span class="price">
                                                            <span class="old">20.000.000đ</span>
                                                            <span class="new">15.000.000đ</span>
                                                        </span>
                                                        <span class="symbol">
                                                            <a href="#"><i class='bx bx-heart'></i></a>
                                                            <a href="#"><i class='bx bx-cart'></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="swiper-button-next next"></div>
                                        <div class="swiper-button-prev prev"></div>
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="footer">
            <div class="footer__top">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-3 col-md-6">
                            <div class="footer-widget">
                                <div class="widget-header">
                                    <h1 class="title">Về chúng tôi</h1>
                                </div>
                                <div class="widget-content">
                                    <p>Với phương châm khách hàng là thượng đế, đề cao sự chính xác. Chúng tôi cam kết bán đúng giá, đúng chất lượng, tư vấn, bán hàng, bảo hành chu đáo đến với khách hàng</p>
                                </div>
                                <div class="widget-social">
                                    <i class='bx bxl-facebook'></i>
                                    <i class='bx bxl-instagram'></i>
                                    <i class='bx bxl-youtube'></i>
                                    <i class='bx bxl-github'></i>
  
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 col-md-6">
                            <div class="footer-widget">
                                <div class="widget-header">
                                    <h1 class="title">Hỗ trợ khách hàng</h1>
                                </div>
                                <div class="widget-list">
                                    <ul>
                                        <li><a href="#">Hướng dẫn mua hàng</a></li>
                                        <li><a href="#">Điều khoản và điều kiện</a></li>
                                        <li><a href="#">Chính sách bảo mật</a></li>
                                        <li><a href="#">Chính sách thanh toán</a></li>
                                        <li><a href="#">Chất lượng dịch vụ</a></li>
                                        <li><a href="#">Hướng dẫn gửi trả hàng</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="col-12 col-lg-3 col-md-6">
                            <div class="footer-widget">
                                <div class="widget-header">
                                    <h1 class="title">Địa chỉ liên hệ</h1>
                                </div>
                                <div class="widget-list">
                                    <ul>
                                        <li>Mr. Bùi Hải Đăng</li>
                                        <li>Ngõ 2,Đại lộ Thăng Long, Nam Từ Liêm, Hà Nội</li>
                                        <li>Email: <i>mail@gmail.com.vn</i></li>
                                        <li>Facebook: Bùi Hải Đăng</li>
                                        <li>Hotline: 0946512323</li>
                                        <li>buihaidang2904@gmail.com</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 col-md-6">
                            <div class="footer-widget">
                                <div class="widget-header">
                                    <h1 class="title">Đăng ký nhận tin:</h1>
                                </div>
                                <div class="widget-content">
                                    <p>Đăng ký nhận tin mới nhất và được giảm giá 10% khi mua hàng đầu tiên của
                                        bạn ..</p>
                                </div>
                                <div class="widget-subscribe">
                                    <form action="">
                                        <input type="email" id="subs-email" placeholder="mail@gmai.com">
                                        <button type="submit" class="widget-btn">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="scroll__top">
            <i class='bx bx-up-arrow-alt'></i>
        </div>

        <!-- mobile menu -->
        
    </div>
    <!-- Slider -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="${classpath}/user/js/app.js"></script>
    <script src="${classpath}/user/js/mobileMenu.js"></script>
    
    <script type="text/javascript">
    	function addToCart (productId, quantity) {
			//javascript object
			let data = {
				
				productId: productId,// lay theo id
				quantity: jQuery("#quantity").val(),
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					/* alert("An error occur"); */
				}
			});
		}
    </script>
</body>

</html>