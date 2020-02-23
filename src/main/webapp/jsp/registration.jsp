<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<link rel="stylesheet" href="/static/style.css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	</head>

	<body>
		<div class="container mt-5">
			<div>Add new user</div>
			
			<c:if test="${message != null}">
				<div>${message}</div>
			</c:if>
			
			<form action="/registration" method="post">
	            <div class="form-group row mt-3">
					<label class="col-sm-2 col-form-label">Username: </label>
					<div class="col-sm-5">
						<input type="text" name="username" class="form-control" placeholder="Username" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Age: </label>
					<div class="col-sm-5">
						<input type="number" name="age" class="form-control"
							placeholder="Age" />
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Email: </label>
					<div class="col-sm-5">
						<input type="email" name="email" class="form-control" placeholder="Email" />
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Password: </label>
					<div class="col-sm-5">
						<input type="password" name="password" class="form-control" placeholder="Password" />
					</div>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-primary mt-2" type="submit">Register</button>
	        </form>
	        
	        <form action="/login" method="get">
				<button class="btn btn-primary mt-2" type="submit">I have account</button>
			</form>
	        
	        <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  		    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	    </div>
    </body>
</html>