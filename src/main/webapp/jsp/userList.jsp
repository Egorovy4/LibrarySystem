<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>List of users</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>

<body>
	<div class="container mt-5">
		<table class="table">
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
		
		<form action="/main" method="get">
			<button class="btn btn-primary mt-2" type="submit">Main page</button>
		</form>
		
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	</div>
</body>

</html>