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
	<h2 align="center">CUSTOMER - LIST</h2>
	<div class="container mt-3">
   
  <table class="table">
    <thead>
      <tr>
        <th>Account</th>
        <th>pasword</th>
        <th>Name</th>
       <th>Email</th>
       <th>Remember</th>
      </tr>
    </thead>
   
    <tbody>
      <tr>
        <td>${customer.txtAccount }</td>
        <td>${customer.password }</td>
        <td>${customer.txtName }</td>
        <td>${customer.txtEmail }</td>
        <td>${customer.remember }</td>
      </tr>
      
    </tbody>
  </table>
  <a href="${classpath }/customer-edit" class="btn btn-info" role="button">Link Button</a>
</div>
</body>
</html>