<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	</head>

	<body>
		<div class="container mt-5">
			<div>Login page</div>

			<form action="/login" method="post">
				<div class="form-group row mt-3">
					<label class="col-sm-2 col-form-label">Username: </label>
					<div class="col-sm-5">
						<input type="text" name="username" class="form-control" placeholder="Username" />
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Password: </label>
					<div class="col-sm-5">
						<input type="password" name="password" class="form-control" placeholder="Password" />
					</div>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-primary mt-2" type="submit">Sign In</button>
			</form>

			<form action="/registration" method="get">
				<button class="btn btn-primary mt-2" type="submit">Add new user</button>
			</form>
	        
	        <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   		    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	    </div>
    </body>
</html>