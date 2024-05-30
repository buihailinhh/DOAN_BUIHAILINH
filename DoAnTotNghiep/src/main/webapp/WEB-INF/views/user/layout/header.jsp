<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

<header class="header">
	<div class="header__top">
		<div class="container">
			<p class="header__top-title">Welcome To our shop !</p>
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
								href="${classpath}/user/danhmuc.html">Thiết Bị</a>
								<ul class="mega__subnav">
									<li class="mega__subnav-menu">
										<h4 class="mega__menu-title">Máy Phát Hiện Tiền Gỉa, Tiền
											lẫn</h4>
										<ul class="mega__subnav-menu-2">
											<li><a href="${classpath}/user/danhmuc.html">Máy đếm
													tiền Modul 8000</a></li>
											<li><a href="${classpath}/user/danhmuc.html">Quạt
													cây BQP</a></li>
											<li><a href="${classpath}/user/danhmuc.html">Tivi LG
													139</a></li>
											<li><a href="${classpath}/user/danhmuc.html">Tủ lạnh
													Shap</a></li>
											<li><a href="${classpath}/user/danhmuc.html">Quạt để
													bàn</li>
											<li><a href="${classpath}/user/danhmuc.html">Điều
													hòa casper 123</a></li>
										</ul>
									</li>
									<li class="mega__subnav-menu">
										<h4 class="mega__menu-title">sản phẩm giảm giá</h4>
										<ul class="mega__subnav-menu-2">
											<li><a href="${classpath}/user/danhmuc.html"> Quạt
													hơi mước</a></li>
											<li><a href="${classpath}/user/danhmuc.html">Tủ lạnh
													LG</a></li>
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
								href="${roothpath}/lienhe">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-8 col-6">
					<div class="header__bottom-actions">
						<div class=" header__bottom-btn header__bottom-search">
							<a href="#"><i class='bx bx-search'></i></a>
							<div class="header__box">
								<div class="header__bottom-box-search">
									<input type="text" placeholder="Tìm kiếm..."
										class="header__search-input">
									<div class="header__search-btn">
										<i class='bx bx-search'></i>
									</div>
								</div>
							</div>
						</div>
						<div class=" header__bottom-btn header__bottom-user">
									<c:choose>

										<c:when test="${isLogined }">
											<a href="${classpath}/logout"><i class='bx bx-user'></i></a>
										</c:when>
										<c:otherwise>

											<a href="${classpath}/login"></a>
										</c:otherwise>
									</c:choose>

								</div>
						<div class=" header__bottom-btn header__bottom-cart">
							<a href="/cart-view"><i class='bx bx-cart'></i></a> <span
								id="totalCartProductsId" class="header__bottom-num">${ totalCartProducts }</span>

							<div class="header__box-cart">
								<div class="header__bottom-box-cart">
									<div class="header__cart-products">
										<div class="cart-product-inner">
											<div class="cart-product__main">
												<div class="cart-product__thumb">
													<img src="${classpath}/user/img/products/3.jpg"
														class="cart-product-img">
												</div>
												<div class="cart-product__content">
													<a href="${classpath}/user/sanpham.html">
														<p class="cart-product__content-title">Tủ Lạnh Tosiba
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
													<img src="${classpath}/user/img/products/1.png"
														class="cart-product-img">
												</div>
												<div class="cart-product__content">
													<a href="${classpath}/user/sanpham.html">
														<p class="cart-product__content-title">Máy điều hòa
															Hòa Phát</p>
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
					<img src="${classpath}/user/img/slider-1.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${classpath}/user/img/slider-2.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${classpath}/user/img/slider-3.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${classpath}/user/img/slider-4.jpg" alt=""
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