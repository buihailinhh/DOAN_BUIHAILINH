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
    <link rel="icon" href="${classpath}/user/img/logo-3.png" type="image/x-icon">
    
    <title>Trung tâm TBNH Hải Đăng</title>
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
    <link rel="stylesheet" href="${classpath }/user/css/lienhe.css">
   
</head>

<body>
    <div class="wrapper">
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <p class="header__top-title">
                        Welcome To our shop !
                    </p>
                </div>
            </div>
            <div class="header__bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-6">
                            <div class="header__bottom-logo">
                                <a href="#"><img src="${classpath}/user/img/logo-3.png" alt="Ảnh logo" class="logo"></a>
                            </div>
                        </div>
                        <div class="col-lg-6 block none">
                            <div class="header__bottom-menu">
                                <ul>
                                    <li class="header__bottom-menu-children"><a href="${roothpath}/home/1">Trang chủ</a></li>
                                    <li class="header__bottom-menu-children">
                                        <a href="${roothpath}/home/1">Thiết Bị</a>
                                        <ul class="mega__subnav">
                                            <li class="mega__subnav-menu">
                                                <h4 class="mega__menu-title">Máy Phát Hiện Tiền Gỉa, Tiền lẫn</h4>
                                                <ul class="mega__subnav-menu-2">
                                                    <li><a href="${classpath}/user/danhmuc.html">Máy đếm tiền Modul 8000</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Quạt cây BQP</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Tivi LG 139</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Tủ lạnh Shap</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Quạt để bàn</li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Điều hòa casper 123</a></li>
                                                </ul>
                                            </li>
                                            <li class="mega__subnav-menu">
                                                <h4 class="mega__menu-title">sản phẩm giảm giá</h4>
                                                <ul class="mega__subnav-menu-2">
                                                    <li><a href="${classpath}/user/danhmuc.html"> Quạt hơi mước</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Tủ lạnh LG</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html">Ti vi SONY 24 inch</a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html"></a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html"></a></li>
                                                    <li><a href="${classpath}/user/danhmuc.html"></a></li>
                                                </ul>
                                            </li>

                                            
                                        </ul>
                                    </li>
                                    <li class="header__bottom-menu-children"><a href="#">Phụ kiện</a></li>
                                    <li class="header__bottom-menu-children">
                                        <a href="#">Dịch vụ</a>
                                        <ul class="subnav">
                                            <li><a href="#">Lắp đặt</a></li>
                                            <li><a href="#">Bảo dưỡng</a></li>
                                            <li><a href="#">Đổi sản phẩm</a></li>

                                        </ul>
                                    </li>
                                    <li class="header__bottom-menu-children"><a href="${classpath}/user/lienhe.html">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-6">
                            <div class="header__bottom-actions">
                                <div class=" header__bottom-btn header__bottom-search">
                                    <a href="#"><i class='bx bx-search'></i></a>
                                    <div class="header__box">
                                        <div class="header__bottom-box-search">
                                            <input type="text" placeholder="Tìm kiếm..." class="header__search-input">
                                            <div class="header__search-btn">
                                                <i class='bx bx-search'></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class=" header__bottom-btn header__bottom-user">
                                    <a href="${classpath}/login"><i class='bx bx-user'></i></a>
                                </div>
                                <div class=" header__bottom-btn header__bottom-cart">
                                    <a href="/cart-view"><i class='bx bx-cart'></i></a>
                                    
                                    <span id="totalCartProductsId" class="header__bottom-num">${ totalCartProducts }</span>
                                    
                                    <div class="header__box-cart">
                                        <div class="header__bottom-box-cart">
                                            <div class="header__cart-products">
                                                <div class="cart-product-inner">
                                                    <div class="cart-product__main">
                                                        <div class="cart-product__thumb">
                                                            <img src="${classpath}/user/img/products/3.jpg" class="cart-product-img">
                                                        </div>
                                                        <div class="cart-product__content">
                                                            <a href="${classpath}/user/sanpham.html">
                                                                <p class="cart-product__content-title">Tủ lạnh SHAPE
                                                                </p>
                                                            </a>
                                                            <p class="cart-product__content-quantity">Số lượng: 1</p>
                                                        </div>
                                                    </div>
                                                    <div class="cart-product__close">
                                                        <i class='bx bx-x'></i>
                                                    </div>
                                                </div>
                                                <div class="cart-product-inner">
                                                    <div class="cart-product__main">
                                                        <div class="cart-product__thumb">
                                                            <img src="${classpath}/user/img/products/1.png" class="cart-product-img">
                                                        </div>
                                                        <div class="cart-product__content">
                                                            <a href="${classpath}/user/sanpham.html">
                                                                <p class="cart-product__content-title">Điều hòa Casper
                                                                </p>
                                                            </a>
                                                            <p class="cart-product__content-quantity">Số lượng: 1</p>
                                                        </div>
                                                    </div>
                                                    <div class="cart-product__close">
                                                        <i class='bx bx-x'></i>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="header__cart-product-buy">
                                                <a href="#" class="buy-product">Mua hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="header__bottom-btn header__bottom-mobilemenu">
                                    <i class='bx bx-menu'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__slider">
                <div class="swiper mySwiper ">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/user/img/slider-1.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/user/img/slider-2.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/user/img/slider-3.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/user/img/slider-4.png" alt="" class="header__slider-img">
                        </div>
                    </div>
                    <div class="swiper-button-next next"></div>
                    <div class="swiper-button-prev prev"></div>
                </div>
            </div>
        </header>
       <main class="main">
            <div class="main__breadcrumb">
                <div class="container">
                    <div class="bread-crumb">
                        <span><a href="./index.html">Trang chủ</a></span>
                        <span><a href="#">Liên hệ</a></span>
                    </div>
                </div>
            </div>
            <div class="main__contact">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="contact__title">
                                <h2 class="title">Liên lạc</h2>
                            </div>
                            <div class="contact__form">
                                <form class="form" action="/contact-sent" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="text" class="form-input" placeholder="Your name..." name="your-name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="email" class="form-input" placeholder="Email..." name="email">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="contact__form-input">
                                                <textarea cols="30" rows="5" class="form__textarea" name="message"
                                                    placeholder="Message"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="contact__btn">
                                            <button>
                                                Send
                                            </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="contact__title">
                                <h2 class="title">Liên hệ với chúng tôi</h2>
                            </div>
                            <p class="contact__description">Với phương châm khách hàng là thượng đế, chúng tôi luôn sẵn sàng
                            tư vấn nhiệt tình cho những thắc mắc hay tư vấn về sản phẩm cho quý khách. Vì mục tiêu đem đến một sự 
                            trải nghiệm tuyệt vời đến với mỗi quý khách hàng.</p>
                            <ul class="contact__address">
                                <li><i class='bx bx-phone'></i> 0946512323</li>
                                <li><i class='bx bx-envelope'></i> mail@gmail.com</li>
                                 <li><i class='bx bxl-facebook'></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main__map">
                <div class="row">
                    <div class="col-12">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1612.1966650274296!2d105.78817454726801!3d20.980166368165296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acce762c2bb9%3A0xbb64e14683ccd786!2zSOG7jWMgVmnhu4duIENOIELGsHUgQ2jDrW5oIFZp4buFbiBUaMO0bmcgLSBIw6AgxJDDtG5n!5e0!3m2!1svi!2s!4v1647935982673!5m2!1svi!2s"
                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
				quantity: quantity
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