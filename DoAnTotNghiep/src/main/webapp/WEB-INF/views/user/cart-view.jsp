<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>${projectTitle }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css -->
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

		<!-- content -->
		<main class="main">



			<form action="${classpath }/place-order" method="post">
				<!-- Danh mục sản phẩm -->
				<div class="main__products">
					<div class="container">
						<div class="main__products-title">
							<p>Sản Phẩm Trong giỏ hàng của bạn</p>
						</div>

						<div class="page-breadcrumb">
							<c:if test="${not empty message }">
								<div class="row">

									<div class="col-12">
										<h3 align="center"
											class="page-title text-truncate text-dark font-weight-medium mb-1">
											Đơn hàng của bạn ${message }</h3>

									</div>

								</div>

								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body">
												<div class="row">

													<div class="col-12">
														<table id="zero_config"
															class="table table-striped table-bordered no-wrap">
															<thead>
																<tr>
																	<th scope="col" class="text-center">STT.</th>
																	<th scope="col" class="text-center">Ảnh sản phẩm</th>
																	<th scope="col" class="text-center">Tên sản phẩm</th>
																	<th scope="col" class="text-center">Số lượng</th>
																	<th scope="col" class="text-center">Giá</th>
																	<th scope="col" class="text-center">Tổng tiền</th>
																	<th scope="col" class="text-center">Xóa mặt hàng</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="item" items="${cart.cartProducts }"
																	varStatus="loop">
																	<tr>
																		<th scope="row">${loop.index + 1 }</th>
																		<td><img width="60px" height="60px"
																			src="${classpath}/FileUpload/${item.avatar }"
																			class="light-logo"></td>
																		<td align="center">${item.name }</td>



																		<td align="center">
																			<button type="button"
																				onclick="updateProductQuantity(${item.productId},-1)">-</button>
																			<span id="productQuantity-${item.productId}">${item.quantity}</span>
																			<button type="button"
																				onclick="updateProductQuantity(${item.productId},1)">+</button>
																		</td>
																		<td align="center"><fmt:formatNumber
																				value="${item.priceDiscount() }" minFractionDigits="0" /></td>
																		<td align="center"><fmt:formatNumber
																				value="${item.totalPrice() }"
																				minFractionDigits="0" /></td>
																		<td align="center"><a
																			href="${rootpath }/delete-cart-item/${item.productId }"
																			role="button" class="btn btn-secondary">Delete</a></td>
																	</tr>
																</c:forEach>
															</tbody>
															<tfoot>

															</tfoot>
														</table>
													</div>

												</div>
												<div class="row">
													<div class="col-1"></div>
													<div class="col-2"></div>

													<div class="col-5">
														<%-- <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">${message }</h4> --%>
													</div>
													<div class="col-4">
														<h4
															class="page-title text-truncate text-dark font-weight-medium mb-1">
															Tổng tiền hóa đơn:
															<fmt:formatNumber value="${totalCartPrice}"
																minFractionDigits="0"></fmt:formatNumber>
															<sup>vnđ</sup>
														</h4>
													</div>
													<div class="col-1"></div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${not empty errorMessage }">
								<div class="col-12">
									<h3 align="center"
										class="page-title text-truncate text-dark font-weight-medium mb-1">
										Your cart: ${errorMessage }</h3>

								</div>
							</c:if>
						</div>
						<!-- Thong tin khach hang -->
						<div class="page-breadcrumb">
							<div class="row">
								<div class="col-12">
									<h3 align="center"
										class="page-title text-truncate text-dark font-weight-medium mb-1">
										Thông tin khách hàng</h3>

								</div>

							</div>
							<div class="row">
								<div class="col-1"></div>
								<div class="col-10">
									<div class="card">
										<div class="card-body">
											<div class="form-body">
												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="name">Tên khách hàng</label> <input
																type="text" class="form-control" id="txtName"
																name="txtName" placeholder="your name"
																value="${loginedUser.name }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="mobile">Số điện thoại khách hàng</label> <input
																type="text" class="form-control" id="txtMobile"
																name="txtMobile" placeholder="your phone number"
																value="${loginedUser.mobile }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="email">Email khách hàng</label> <input
																type="email" class="form-control" id="txtEmail"
																name="txtEmail" placeholder="your email"
																value="${loginedUser.email }" />
														</div>
													</div>
												</div>

												<div class="row">

													<div class="col-md-12">
														<div class="form-group mb-4">
															<label for="phone">Địa chỉ khách hàng</label> <input
																type="text" class="form-control" id="txtAddress"
																name="txtAddress" placeholder="your address"
																value="${loginedUser.address }" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<a href="${rootpath }/home/1"
																class="btn btn-primary active" role="button"
																aria-pressed="true">Quay lại </a>
															<button type="submit" class="btn btn-primary">
																Đặt Hàng</button>
														</div>
													</div>
												</div>
												 <div id="successMessage" style="display: none;" class="alert alert-success" role="alert">
        Đặt hàng thành công!
    </div>
											</div>
			</form>
	</div>
	</div>
	</div>
	<div class="col-1"></div>
	</div>
	</div>
	</div>
	</div>




	</form>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

	<div class="scroll__top">
		<i class='bx bx-up-arrow-alt'></i>
	</div>

	<!-- mobile menu -->

	</div>
	<!-- js -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
    updateProductQuantity = function(productId, quantity) {
			let data = {
				productId: productId, //lay theo id
				quantity: quantity
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					/* alert(jsonResult.code + ": " + jsonResult.message); */
					let totalProducts = jsonResult.totalCartProducts;
					// Viết lại số lueojng sau khi click nút +,-
				$("#productQuantity-"+ jsonResult.productId).html(jsonResult.newQuantity);
				},
				error : function(jqXhr, textStatus, errorMessage) {
					//alert(jsonResult.code + ': Luu thanh cong...!')
					alert("An oror occur ");
					
				}
			});
		}
	</script>

	<script type="text/javascript">
		addToCart = function(productId, quantity) {
			let data = {
				productId: productId, //lay theo id
				quantity: quantity: jQuery("#quantity").val(),
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					/* alert(jsonResult.code + ": " + jsonResult.message); */
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					//alert(jsonResult.code + ': Luu thanh cong...!')
				}
			});
		}
	</script>

</body>

</html>