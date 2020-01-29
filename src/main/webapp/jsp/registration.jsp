<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
	</head>

	<body>
		<div>Add new user</div>
		
		<c:if test="${message != null}">
			<div>${message}</div>
		</c:if>
		
		<form action="/registration" method="post">
            <div><label> Username : <input type="text" name="username"/> </label></div>
            <div><label> Age : <input type="number" name="age"/> </label></div>
            <div><label> Email : <input type="email" name="email"/> </label></div>
            <div><label> Password: <input type="password" name="password"/> </label></div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div><input type="submit" value="Registration"/></div>
        </form>
    </body>
</html>