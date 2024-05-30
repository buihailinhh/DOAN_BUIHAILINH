<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
 <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
 </head> 
<body>
	<h2 align="center">SIGN UP NOW</h2>
	<sf:form  class="container" action="/customer-edit-ajax-sf" method="post" modelAttribute="customer">
		<div class="mb-3 mt-3">
			<label for="Account" class="form-label">Account:</label>
			 <sf:input path="txtAccount"
				type="text" class="form-control" id="txtAccount"
				placeholder="Enter your account" name="txtAccount" />
		</div>
		<div class="mb-3">
			<label for="pwd" class="form-label">Password:</label>
			 <sf:input path="password"
				type="password" class="form-control" id="password"
				placeholder="Enter password" name="password" />
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">Name:</label>
			 <sf:input path="txtName"
				type="text" class="form-control" id="txtName"
				placeholder="Enter your account" name="txtName" />
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">Email:</label>
			 <sf:input path="txtEmail"
				type="email" class="form-control" id="txtEmail"
				placeholder="Enter email" name="txtEmail" />
		</div>
		<div class="form-check mb-3">
			<label class="form-check-label"> 
			<sf:checkbox path="remember"
				class="form-check-input"  name="remember" />
				Remember me
			</label>
		</div>
		<button type="button" class="btn btn-primary" onclick="saveCustomer()">SAVE DATA</button>
	</sf:form>
	
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
				url : "/customer-edit-ajax-sf",
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
    
    <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>