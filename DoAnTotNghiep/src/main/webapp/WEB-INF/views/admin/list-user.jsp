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
							class="page-title text-truncate text-dark font-weight-medium mb-1">
							List User</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Apps</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">LIST USER</li>
								</ol>
							</nav>
						</div>
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
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
							
								 <div class="row">
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 bg-primary text-center">
												<h1 class="font-light text-white">${total }</h1>
												<h6 class="text-white">Total User</h6>
											</div>
										</div>
									</div>
									<!--
									Column
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 bg-cyan text-center">
												<h1 class="font-light text-white">1,738</h1>
												<h6 class="text-white">Responded</h6>
											</div>
										</div>
									</div>
									Column
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 bg-success text-center">
												<h1 class="font-light text-white">1100</h1>
												<h6 class="text-white">Resolve</h6>
											</div>
										</div>
									</div>
									Column
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 bg-danger text-center">
												<h1 class="font-light text-white">964</h1>
												<h6 class="text-white">Pending</h6>
											</div>
										</div>
									</div>
									 -->
									
									<!-- Column -->
								</div>
								<div class="table-responsive">

									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<a href="${classpath }/manager/add-category" role="button"
													class="btn btn-primary">Add User</a>
											</div>
										</div>

										<!-- <div class="col-md-6">
											<ul class="pagination float-right">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1">Previous</a></li>
												<li class="page-item active"><a class="page-link"
													href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2
														<span class="sr-only">(current)</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">Next</a>
												</li>
											</ul>
										</div> -->
									</div>

									<table id="zero_config"
										class="table table-striped table-bordered no-wrap">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Username</th>
												<th scope="col">Password</th>
												<th scope="col">Email</th>
												 <th scope="col">Description</th>
												<th scope="col">Mobile</th>
												<th scope="col">CreateBy</th>
	                                            <th scope="col">UpdateBy</th>
												<th scope="col">CreateDate</th>
	                                            <th scope="col">UpdateDate</th>
	                                             <th scope="col">Status</th>
	                                             <th scope="col">Action</th>
											</tr>
										</thead>
										
										
										<tbody>
										
											<c:forEach var="user" items="${users }"
												varStatus="loop">
												<tr>
													<td>${loop.index + 1 }</td>
													<td>${user.id }</td>
													<td>${user.username }</td>
													<td>${user.password }</td>
													<td>${user.email }</td>
													<td>${user.description }</td>
													<td>${user.mobile }</td>
													<td>${user.createBy }</td>
													<td>${user.updateBy }</td>
													<td>${user.createDate }</td>
													<td>${user.updateDate }</td>
													<td>${user.status }</td>
											
	                                                <td><a href="${classpath }/manager/delete-user/${user.id }" role="button" class="btn btn-secondary">Delete</a>
	                                            </tr>

												
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Username</th>
												<th scope="col">Password</th>
												<th scope="col">Email</th>
												 <th scope="col">Description</th>
												<th scope="col">Mobile</th>
												<th scope="col">CreateBy</th>
	                                            <th scope="col">UpdateBy</th>
												<th scope="col">CreateDate</th>
	                                            <th scope="col">UpdateDate</th>
	                                             <th scope="col">Status</th>
	                                             <th scope="col">Action</th>
												
											</tr>
										</tfoot>
									</table>

								
								</div>
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
</body>

</html>