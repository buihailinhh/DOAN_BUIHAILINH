<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
 <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
 </head> 
<body>
	<h2 align="center">SIGN UP NOW</h2>
	<form  class="container" action="/customer-list" method="post">
		<div class="mb-3 mt-3">
			<label for="Account" class="form-label">Account:</label> <input
				type="text" class="form-control" id="txtAccount"
				placeholder="Enter your account" name="txtAccount">
		</div>
		<div class="mb-3">
			<label for="pwd" class="form-label">Password:</label> <input
				type="password" class="form-control" id="password"
				placeholder="Enter password" name="password">
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">Name:</label> <input
				type="text" class="form-control" id="txtName"
				placeholder="Enter your account" name="txtName">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">Email:</label> <input
				type="email" class="form-control" id="txtEmail"
				placeholder="Enter email" name="txtEmail">
		</div>
		<div class="form-check mb-3">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember">
				Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>