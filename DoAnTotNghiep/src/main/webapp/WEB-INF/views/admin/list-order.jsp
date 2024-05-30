<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${classpath}/admin/assets/images/favicon.png">
<title>${projectTittle }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Custome css resource file -->
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<c:set var="currenPage" value="${currenPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set>


	<!-- End test -->
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="/WEB-INF/views/admin/layout/menuleft.jsp"></jsp:include>
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Sale
							Order</h4>
						<div class="d-flex align-items-center"></div>
					</div>
					<div class="col-5 align-self-center">
						<div class="customize-input float-right">
							<select
								class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
								<option selected>Aug 19</option>
								<option value="1">July 19</option>
								<option value="2">Jun 19</option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<%-- <div class="col-md-6">
					<div class="form-group mb-4">
						<label for="">From date</label>
						<sf:select path="fromDate" class="form-control" id="fromDate">
							<sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
						</sf:select>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group mb-4">
						<label for="category">To date</label>
						<sf:select path="toDate" class="form-control" id="toDate">
							<sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
						</sf:select>
					</div>
				</div>

				<div class="col-md-6">

					<div class="form-group mb-4">
						<label for="updatedate">Keyword:</label> <input type="text"
							class="form-control" id="keyword" name="keyword"
							placeholder="search keyword" />


					</div>
				</div>


				<div class="col-md-6">

					<div class="form-group mb-4">
						<label for="updatedate">Status:</label> <select
							class="form-control">
							<option selected>Tất cả</option>
							<option value="1">Chưa giao hàng</option>
							<option value="2">Đã giao hàng</option>
						</select>


					</div>
 
					 <div class="col-md-1">

						<div class="form-group mb-4">
							<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
						</div>
					</div>
					<input id="page" name="page"
						class="form-control" value="${saleOrderSearch.currentPage }">
						
						
						
 --%>

                <div class="col-12">
						<div class="card">
							<div class="card-body">
							
								 <div class="row">
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 bg-primary text-center">
												<h1 class="font-light text-white">${total }</h1>
												<h6 class="text-white">Total Order</h6>
											</div>
										</div>
									</div>

				</div>
				</div>
				</div>
				</div>
				
				<div class="container-fluid">
					<!-- ============================================================== -->
					<!-- Start Page Content -->
					<!-- ============================================================== -->
					<!-- basic table -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="row"></div>
									<form action="${classpath }/list-product/${currenPage}"
										method="get">
										<div class="table-responsive">





											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Code</th>
														<th scope="col">Customer</th>
														<th scope="col">Mobile</th>
														<th scope="col">Address</th>
														<th scope="col">Payment</th>
														<th scope="col">Create by</th>
														<th scope="col">Create date</th>
														<th scope="col">Delivery date</th>
														<th scope="col">Status</th>
														<th scope="col">Edit</th>
														<th scope="col">Delete</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="saleOrder" items="${orders }"
													varStatus="loop">
													<tr>
														<th scope="row">${loop.index + 1 }</th>

														<td align="center">${saleOrder.code }</td>
														<td>${saleOrder.customerName }</td>
														<td align="center">${saleOrder.customerMobile }</td>
														<td>${saleOrder.customerAddress }</td>
														<td align="right"><fmt:formatNumber
																value="${saleOrder.total }" minFractionDigits="0"></fmt:formatNumber>
														</td>
														<td>${saleOrder.createBy }</td>
														<%-- <td>${saleOrder.updateBy }</td> --%>
														<td><fmt:formatDate pattern="dd-MM-yyyy"
																value="${saleOrder.createDate}" /></td>
														<td><fmt:formatDate pattern="dd-MM-yyyy"
																value="${saleOrder.updateDate}" /></td>

														<td><c:choose>
																<c:when test="${saleOrder.status }">
																	Đã giao hàng
																</c:when>
																<c:otherwise>Chưa giao hàng</c:otherwise>
															</c:choose></td>

														<td><a
															href="${rootpath }/edit-Order/${saleOrder.id }"
															role="button" class="btn btn-primary">Edit</a>
														<td><a
															href="${rootpath }/manager/delete-Order/${saleOrder.id }"
															role="button" class="btn btn-secondary">Delete</a>
													</tr>
												</c:forEach>
													
												</tbody>
												<tfoot>
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Code</th>
														<th scope="col">Customer</th>
														<th scope="col">Mobile</th>
														<th scope="col">Address</th>
														<th scope="col">Payment</th>
														<th scope="col">Create by</th>
														<th scope="col">Create date</th>
														<th scope="col">Delivery date</th>
														<th scope="col">Status</th>
														<th scope="col">Edit</th>
														<th scope="col">Delete</th>
													</tr>
												</tfoot>
											</table>

											<%-- <div class="row">

												<div class="col-md-6">
													<h4
														class="page-title text-truncate text-dark font-weight-medium mb-1">
														Total Sales:
														<fmt:formatNumber value="${totalSales}"
															minFractionDigits="0"></fmt:formatNumber>
														đ
													</h4>
												</div>

												<div class="col-md-6">
													<div class="pagination float-right">
														<div id="paging"></div>
													</div>
												</div>
											</div> --%>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End Container fluid  -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
				<!-- ============================================================== -->
				<!-- End footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Page wrapper  -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->

		<!-- Slider js: All Jquery-->
		<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>
		
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${saleOrderSearch.status});
			
			$("#paging").pagination({
				currentPage: ${saleOrderSearch.currentPage}, //Trang hien tai
				items: ${saleOrderSearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${saleOrderSearch.sizeOfPage},  //So dong tren 1 trang
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>