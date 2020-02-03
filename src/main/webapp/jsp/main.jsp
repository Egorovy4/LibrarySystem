<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Main</title>
	</head>

	<body>
		<form action="/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	<input type="submit" value="Sign Out"/>
        </form>
		
		<div>Main page!</div>
		
		<form action="/addNote" method="post">
            <div><label> Header : <input type="text" name="header"/> </label></div>
            <div><label> Text : <input type="text" name="text"/> </label></div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div><input type="submit" value="To note"/></div>
        </form>

		<form method="get" action="main">
			<input type="text" name="filter" value="${filter}">
			<button type="submit">Find</button>
		</form>

		<div>List of Notes</div>
		<c:forEach items="${allNotes}" var="currentNote">
        	<div>${currentNote.header} ${currentNote.text} ${currentNote.author.username}</div>
        </c:forEach>
	</body>
</html>
