<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User editor</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	</head>

	<body>
		<div class="container mt-5">
			<div class="md-3">Editor</div>
			
			<form:form action="/user" method="post" modelAttribute="user">
				<form:input type="hidden" path="id" class="form-control" placeholder="Id" value="${userForUpdate.id}" />
	            
	            <div class="form-group row mt-3">
					<label class="col-sm-2 col-form-label">Username: </label>
					<div class="col-sm-5">
						<form:input type="text" path="username" class="form-control" placeholder="Username" value="${userForUpdate.username}" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Age: </label>
					<div class="col-sm-5">
						<form:input type="number" path="age" class="form-control" placeholder="Age" value="${userForUpdate.age}" />
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Email: </label>
					<div class="col-sm-5">
						<form:input type="email" path="email" class="form-control" placeholder="Email" value="${userForUpdate.email}" />
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Password: </label>
					<div class="col-sm-5">
						<form:input type="password" path="password" class="form-control" placeholder="Password" value="${userForUpdate.password}" />
					</div>
				</div>
				
				<div>
					<c:forEach items="${roles}" var="currentRole">
						<form:checkbox path="roles" value="${currentRole}" />${currentRole}<br>
					</c:forEach>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-primary mt-3" type="submit">Save updates</button>
	        </form:form>
	        
		    <form action="/user" method="get">
				<button class="btn btn-primary mt-2" type="submit">Cancel</button>
			</form>

			<!-- Optional JavaScript -->
			<!-- jQuery first, then Popper.js, then Bootstrap JS -->
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
			<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
			<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		</div>
	</body>
</html>