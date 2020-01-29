<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>

	<body>
		<div>Login page</div>
        
        <form action="/login" method="post">
            <div><label> Username : <input type="text" name="username"/> </label></div>
            <div><label> Password: <input type="password" name="password"/> </label></div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div><input type="submit" value="Sign In"/></div>
        </form>
        <a href="/registration">Add new user</a>
    </body>
</html>