<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User editor</title>
	</head>

	<body>
		
		<div>User editor</div>
		
		<form:form action="/user" method="post" modelAttribute="user">
			<div><form:input type="hidden" path="id" value="${userForUpdate.id}" /></div>
			<div><form:input type="text" path="username" value="${userForUpdate.username}" /></div>
			<div><form:input type="number" path="age" value="${userForUpdate.age}" /></div>
			<div><form:input type="email" path="email" value="${userForUpdate.email}" /></div>
			<div><form:input type="password" path="password" value="${userForUpdate.password}" /></div>
			
			<div>
				<c:forEach items="${roles}" var="currentRole">
					<form:checkbox path="roles" value="${currentRole}" />${currentRole}<br>
				</c:forEach>	
			</div>
			
			<div><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></div>

			<div><button type="submit">Save</button></div>
		</form:form>
    
    </body>
</html>