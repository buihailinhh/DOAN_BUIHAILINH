<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="icon" href="${classpath}/user/img/logo-3.png"
	type="image/x-icon">
<title>Trung tâm TBNH Hải Đăng</title>
<!-- <title>${title }</title>
 -->
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap"
	rel="stylesheet">
<!-- Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- ScrollReveal -->
<script src="${classpath}/user/js/scrollreveal.min.js"></script>


<!-- BoxIcon -->
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${classpath}/user/bootstrap/css/bootstrap.min.css">
<!-- Reset CSS -->
<link rel="stylesheet" href="${classpath}/user/css/reset.css">
<!-- Style CSS -->
<link rel="stylesheet" href="${classpath}/user/css/style.css">
<!-- Reponsive -->
<link rel="stylesheet" href="${classpath}/user/css/reponsive.css">


</head>

<body>

	<c:set var="currenPage" value="${currenPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set>


	<div class="wrapper">
		<header class="header">
			<div class="header__top">
				<div class="container">
					<p class="header__top-title">Chào mừng bạn đến với cửa hàng của
						chúng tôi !</p>
				</div>
			</div>
			<div class="header__bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-6">
							<div class="header__bottom-logo">
								<a href="#"><img src="${classpath}/user/img/logo-3.png"
									alt="Ảnh logo" class="logo"></a>
							</div>
						</div>
						<div class="col-lg-6 block none">
							<div class="header__bottom-menu">
								<ul>
									<li class="header__bottom-menu-children"><a
										href="${roothpath}/home/1">Trang chủ</a></li>
									<li class="header__bottom-menu-children"><a
										href="${roothpath}/home/1">Thiết Bị</a>
										<ul class="mega__subnav">
											<li class="mega__subnav-menu">
												<h4 class="mega__menu-title">Máy Phát Hiện Tiền Gỉa,
													Tiền lẫn</h4>
												<ul class="mega__subnav-menu-2">
													<li><a href="${classpath}/user/danhmuc.html">Máy
															đếm tiền Modul 8000</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Quạt
															cây BQP</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Tivi
															LG 139</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Tủ
															lạnh Shap</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Quạt
															để bàn</li>
													<li><a href="${classpath}/user/danhmuc.html">Điều
															hòa casper 123</a></li>
												</ul>
											</li>
											<li class="mega__subnav-menu">
												<h4 class="mega__menu-title">sản phẩm giảm giá</h4>
												<ul class="mega__subnav-menu-2">
													<li><a href="${classpath}/user/danhmuc.html"> Quạt
															hơi mước</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Tủ
															lạnh LG</a></li>
													<li><a href="${classpath}/user/danhmuc.html">Ti vi
															SONY 24 inch</a></li>
													<li><a href="${classpath}/user/danhmuc.html"></a></li>
													<li><a href="${classpath}/user/danhmuc.html"></a></li>
													<li><a href="${classpath}/user/danhmuc.html"></a></li>
												</ul>
											</li>


										</ul></li>
									<li class="header__bottom-menu-children"><a href="#">Phụ
											kiện</a></li>
									<li class="header__bottom-menu-children"><a href="#">Dịch
											vụ</a>
										<ul class="subnav">
											<li><a href="#">Lắp đặt</a></li>
											<li><a href="#">Bảo dưỡng</a></li>
											<li><a href="#">Đổi sản phẩm</a></li>

										</ul></li>
									<li class="header__bottom-menu-children"><a
										href="${rootpath}/lienhe">Liên hệ</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-md-8 col-6">
							<div class="header__bottom-actions">
								<div class=" header__bottom-btn header__bottom-search">
									<a href="#"><i class='bx bx-search'></i></a>
									<div class="header__box">
										<div class="header__bottom-box-search">
											<form action="/home" method="GET">
												<input type="text" id="keyword" name="keyword"
													placeholder="Tìm kiếm sản phẩm..."
													class="header__search-input">
												<div class="header__search-btn">
													<button type="submit" style="border: none;">
														<i class='bx bx-search'></i>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class=" header__bottom-btn header__bottom-user">
									<c:choose>

										<c:when test="${isLogined }">
											<a href="${classpath}/logout"><i class='bx bx-user'></i></a>
										</c:when>
										<c:otherwise>

											<a href="${classpath}/login"><i class='bx bx-user'></i></a>
										</c:otherwise>
									</c:choose>

								</div>
								<div class=" header__bottom-btn header__bottom-cart">
									<a href="/cart-view"><i class='bx bx-cart'></i></a> <span
										id="totalCartProductsId" class="header__bottom-num">${ totalCartProducts }</span>


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
							<img src="${classpath}/user/img/slider-1.jpg" alt=""
								class="header__slider-img">
						</div>
						<div class="swiper-slide .header__slider-imgs">
							<img src="${classpath}/user/img/slider-2.jpg" alt=""
								class="header__slider-img">
						</div>
						<div class="swiper-slide .header__slider-imgs">
							<img src="${classpath}/user/img/sLider-3.jpg" alt=""
								class="header__slider-img">
						</div>
						<div class="swiper-slide .header__slider-imgs">
							<img src="${classpath}/user/img/slider-4.png" alt=""
								class="header__slider-img">
						</div>
						<div class="swiper-slide .header__slider-imgs">
							<img src="${classpath}/user/img/slider-5.jpg" alt=""
								class="header__slider-img">
						</div>
						<div class="swiper-slide .header__slider-imgs">
							<img src="${classpath}/user/img/slider-6.jpg" alt=""
								class="header__slider-img">
						</div>
					</div>
					<div class="swiper-button-next next"></div>
					<div class="swiper-button-prev prev"></div>
				</div>
			</div>
		</header>
		<main class="main">
			<div class="main__products-hot">
				<div class="container">
					<div class="main__products-title">
						<p>Mặt hàng hiện có</p>
					</div>
					<form class="home" id="searchForm" method="GET"
						action="javascript:submitForm()">
						<%
						// Lấy giá trị của các tham số từ URL
						String keyword = request.getParameter("keyword");
						String categoryId = request.getParameter("categoryId");
						String maxPrice = request.getParameter("price");
						%>
						<input type="text" name="keyword" id="keyword"
							placeholder="Tên sản phẩm"
							value="<%=keyword == null ? "" : keyword%>"> <select
							class="form-control ml-2" id="categoryId" name="categoryId">
							<option value="0">Lựa chọn theo loại hàng</option>
							<c:forEach items="${categories}" var="category">
								<option value="${category.id}"
									${category.id == param.categoryId ? 'selected' : ''}>${category.name}</option>
							</c:forEach>
						</select> <select name="price" id="price">
							<option value="null" ${param.price == '' ? 'selected' : ''}>Chọn
								mức giá</option>
							<option value="0-1" ${param.price == '0-1' ? 'selected' : ''}>Dưới
								1 triệu</option>
							<option value="1-5" ${param.price == '1-5' ? 'selected' : ''}>Từ
								1 đến 5 triệu</option>
							<option value="5-10" ${param.price == '5-10' ? 'selected' : ''}>Từ
								5 đến 10 triệu</option>
							<option value="10-20" ${param.price == '10-20' ? 'selected' : ''}>Từ
								10 đến 20 triệu</option>
							<option value="20-9999"
								${param.price == '20-9999' ? 'selected' : ''}>Trên 20
								triệu</option>
						</select> <input type="hidden" id="pageInput" name="page" value="1">
						<!-- Giá trị mặc định cho page là 1 -->

						<button type="submit">Tìm kiếm</button>
					</form>

					<div class="main__products-content">
						<div class="row">
							<c:forEach var="product" items="${products}">
								<div class="col-12 col-lg-3 col-md-6">
									<div class="product" data-price="${product.price}"
										data-discount="${product.discount}">
										<div class="thumb">
											<a href="${rootpath}/sanpham/${product.id}" class="image">
												<img src="${classpath}/FileUpload/${product.avatar}"
												class="fit-img zoom-img">
											</a> <span class="badges"> <span class="sale">-${product.discount}%</span>
											</span>
										</div>
										<div class="content">
											<a href="${classpath}/user/sanpham.html" class="content-link">
												<h5 class="title">${product.name}</h5>
											</a> <span class="price"> <span class="old">${product.price}</span>
												<span class="new-price"></span> <sup>vnđ</sup>
											</span> <span class="symbol"> <a href="#"><i
													class='bx bx-heart'></i></a> <a href="#"
												onclick="addToCart(${product.id}, 1)"><i
													class='bx bx-cart'></i></a>
											</span>
										</div>
									</div>

								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-12 d-flex justify-content-center">
					<ul class="pagination">
						<c:choose>
							<c:when test="${currentPage <= 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${classpath }/home/${currentPage-1}" tabindex="-1">Previous</a>
								</li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${totalPage }">
							<c:if test="${index<=totalPage }">
								<c:choose>
									<c:when test="${index==currentPage }">
										<li class="page-item active"><a class="page-link"
											href="${classpath }/home/${currentPage}">${currentPage }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${classpath }/home/${index }">${index }</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>

						<c:choose>
							<c:when test="${currentPage >= totalPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${classpath }/home/${currentPage+1}" tabindex="1">Next</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
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
									<p>Với phương châm khách hàng là thượng đế, đề cao sự chính
										xác. Chúng tôi cam kết bán đúng giá, đúng chất lượng, tư vấn,
										bán hàng, bảo hành chu đáo đến với khách hàng</p>
								</div>
								<div class="widget-social">
									<i class='bx bxl-facebook'></i> <i class='bx bxl-instagram'></i>
									<i class='bx bxl-youtube'></i> <i class='bx bxl-github'></i>

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
									<p>Đăng ký nhận tin mới nhất và được giảm giá 10% khi mua
										hàng đầu tiên của bạn ..</p>
								</div>
								<div class="widget-subscribe">
									<form action="">
										<input type="email" id="subs-email"
											placeholder="mail@gmai.com">
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
					alert(jsonResult.code + ":" + jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
					 
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					/* alert("An error occur"); */
				}
			});
		}
    </script>

	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', (event) => {
	    // Lấy tất cả các sản phẩm
	    const products = document.querySelectorAll('.product');

	    products.forEach(product => {
	        // Lấy giá gốc và phần trăm giảm giá từ thuộc tính dữ liệu
	        const price = parseFloat(product.getAttribute('data-price'));
	        const discount = parseFloat(product.getAttribute('data-discount'));

	        // Tính toán giá sau khi giảm
	        const discountedPrice = price - (price * (discount / 100));

	        // Cập nhật giá mới trong HTML
	        const newPriceElement = product.querySelector('.new-price');
	        if (newPriceElement) {
	            newPriceElement.textContent = discountedPrice.toLocaleString('vi-VN');
	        }
	    });
	});

    </script>

	<script>
    function submitForm() {
        var page = document.getElementById('pageInput').value || 1;
        var keyword = document.getElementById('keyword').value;
        var categoryId = document.getElementById('categoryId').value;
        var price = document.getElementById('price').value;

        var actionUrl = '/home/' + page + '?keyword=' + encodeURIComponent(keyword) +
                        '&categoryId=' + encodeURIComponent(categoryId) +
                        '&price=' + encodeURIComponent(price);
        
        var form = document.getElementById('searchForm');
        form.action = actionUrl;
        form.submit();
    }
</script>
</body>

</html>