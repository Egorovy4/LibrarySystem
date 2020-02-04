<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>List of users</title>
</head>

<body>
	List of users
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Role</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${users}" var="currentUser">
		        <tr>
		        	<td>${currentUser.username}</td>
		        	<td>
		        		<c:forEach items="${currentUser.roles}" var="currentRole" varStatus="loopStatus">
		        			<c:out value="${currentRole}"/>
    						<c:if test="${!loopStatus.last}">, </c:if>
		        		</c:forEach>
		        	</td>
		        	<td><a href="/user/${currentUser.id}">Edit</a></td>
		        </tr>
    		</c:forEach>		
		</tbody>
	</table>
</body>

</html>