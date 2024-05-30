<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
 <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
 <!--  JSTL directive-->
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 </head> 
<body>
	<h2 align="center">UPDATE CUSTOMER</h2>
	
	 <c:if test="${not empty message }">
   		<div class="alert alert-primary" role="alert">
   			${message}
   		</div>
   	</c:if> 
   	
	<form  class="container" action="/customer-edit" method="post">
		<div class="mb-3 mt-3">
			<label for="Account" class="form-label">Account:</label> <input
				type="text" class="form-control" id="txtAccount"
			value="${customer.txtAccount }"	 name="txtAccount">
		</div>
		<div class="mb-3">
			<label for="pwd" class="form-label">Password:</label> <input
				type="password" class="form-control" id="password"
				value="${customer.password }" name="password">
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">Name:</label> <input
				type="text" class="form-control" id="txtName"
				value="${customer.txtName }"  name="txtName">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">Email:</label> <input
				type="email" class="form-control" id="txtEmail"
				value="${customer.txtEmail }"  name="txtEmail">
		</div>
		<div class="form-check mb-3">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember"
				checked="${customer.remember }">
				
				Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">SAVE</button>
	</form>
</body>
</html>