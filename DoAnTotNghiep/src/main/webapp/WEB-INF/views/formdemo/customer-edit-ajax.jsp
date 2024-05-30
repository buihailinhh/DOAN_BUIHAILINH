<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
 <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
  <!-- Jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <!--  JSTL directive-->
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 </head> 
<body>
	<h2 align="center">UPDATE CUSTOMER</h2>
	
   	
	<form  class="container" action="/customer-edit-ajax" method="post">
		<div class="mb-3 mt-3">
			<label for="Account" class="form-label">Account:</label> <input
				type="text" class="form-control" id="txtAccount"
			value="${customer.txtAccount }"	 placeholder="Enter your account" name="txtAccount">
		</div>
		<div class="mb-3">
			<label for="pwd" class="form-label">Password:</label> <input
				type="password" class="form-control" id="password"
				value="${customer.password }" placeholder="Enter password" name="password">
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">Name:</label> <input
				type="text" class="form-control" id="txtName"
				value="${customer.txtName }" placeholder="Enter your account" name="txtName">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">Email:</label> <input
				type="email" class="form-control" id="txtEmail"
				value="${customer.txtEmail }" placeholder="Enter email" name="txtEmail">
		</div>
		<div class="form-check mb-3">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember"
				checked="${customer.remember }">
				
				Remember me
			</label>
		</div>
		<button type="button" class="btn btn-primary " onclick="saveCustomer()">SAVE</button>
	</form>
	
	<!-- custom javascript form processing -->
    <script type="text/javascript">
    	function saveCustomer() {
			//javascript object
			let data = {
				
				txtAccount : jQuery("#txtAccount").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtName : jQuery("#txtName").val(),
				
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/customer-edit-ajax",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
    </script>
</body>
</html>