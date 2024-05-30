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
							class="page-title text-truncate text-dark font-weight-medium mb-1">List Category
			</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Apps</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Ticket List</li>
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
												<h6 class="text-white">Total Category</h6>
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

									<table id="zero_config"
										class="table table-striped table-bordered no-wrap">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col">Description</th>
												<th scope="col">Create by</th>
												<th scope="col">Update by</th>
												<th scope="col">Create date</th>
												<th scope="col">Update date</th>
												<th scope="col">Status</th>
												 <th scope="col">Edit</th>
	                                            <th scope="col">Delete</th>
											</tr>
										</thead>
										
										<div>${users }</div>
										<tbody>
										
											<c:forEach var="category" items="${categories }"
												varStatus="loop">
												<tr>
													<td>${loop.index + 1 }</td>
													<td>${category.id }</td>
													<td>${category.name }</td>
													<td>${category.description }</td>
													<td>${category.createBy }</td>
													<td>${category.updateBy }</td>
													<td>${category.createDate }</td>
													<td>${category.updateDate }</td>
													<td>${category.status }</td>
													
												<td><a href="${classpath }/manager/edit-category/${category.id }" role="button" class="btn btn-secondary">Edit</a>
	                                                
	                                                <td><a href="${classpath }/manager/delete-category/${category.id }" role="button" class="btn btn-secondary">Delete</a>
	                                            </tr>

												
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col">Description</th>
												<th scope="col">Create by</th>
												<th scope="col">Update by</th>
												<th scope="col">Create date</th>
												<th scope="col">Update date</th>
												<th scope="col">Status</th>
												<th scope="col">Delete</th>
												
											</tr>
										</tfoot>
									</table>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group mb-4">
												<a href="${classpath }/manager/add-category" role="button"
													class="btn btn-primary">Add Category</a>
											</div>
										</div>

										<div class="col-md-6">
			                                    <ul class="pagination float-right">
			                                    <c:choose>
				                                    <c:when test="${currentPage <= 1 }">
				                                        <li class="page-item disabled">
				                                            <a class="page-link" href="#">Previous</a>
				                                        </li>
				                                    </c:when>  
				                                    <c:otherwise>
				                                    	<li class="page-item">
				                                            <a class="page-link" href="${classpath }/manager/list-category/${currentPage-1}" tabindex="-1">Previous</a>
				                                        </li>
				                                       
				                                    </c:otherwise>
			                                    
			                                    </c:choose>
			                                    
			                                    <c:forEach var="index" begin="1" end="${totalPage }">
			                                    <c:if test="${index<=totalPage }">
			                                    <c:choose>
			                                    	
			                                    	<c:when test="${index==currentPage }">
			                                        <li class="page-item active"><a class="page-link" href="${classpath }/manager/list-category/${currentPage}">${currentPage }</a></li>
			                                        </c:when>
			                                        <c:otherwise>
			                                        <li class="page-item"><a class="page-link" href="${classpath }/manager/list-category/${index }">${index }</a></li>
			                                        </c:otherwise>
			                                        
			                                    </c:choose>
			                                    </c:if>
			                                    
			                                    </c:forEach>
			                                    
			                                      
			                                    <c:choose>
			                                    	<c:when test="${currentPage >= totalPage }">
			                                        <li class="page-item disabled">
			                                            <a class="page-link" href="#">Next</a>
			                                        </li>
			                                        </c:when>
			                                        <c:otherwise>
				                                    	<li class="page-item">
				                                            <a class="page-link" href="${classpath }/manager/list-category/${currentPage+1}" tabindex="1">Next</a>
				                                        </li>
				                                        
				                                    </c:otherwise>
			                                    </c:choose>    
			                                    </ul>
		                                    </div>
									</div>

								
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