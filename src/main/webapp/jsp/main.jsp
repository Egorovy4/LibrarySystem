<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Main</title>
		<link rel="stylesheet" href="/static/style.css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	</head>

	<body>
		<jsp:include page="navbar.jsp"></jsp:include>
		
		<div class="container mt-5">
			<div class="form-row">
				<div class="form-group col-md-6">
					<form method="get" action="main" class="form-inline">
						<input type="text" name="filter" class="form-control" value="${filter}" placeholder="Search by header">
						<button type="submit" class="btn btn-primary ml-3">Search Note</button>
					</form>
				</div>
			</div>
			
			<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    			Add new Note
		    </a>
			
			<div class="collapse" id="collapseExample">
				<div class="form-group mt-3">
					<form action="/addNote" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control" name="header" placeholder="Header" />
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" name="text" placeholder="Text" />
						</div>

						<div class="form-group">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile" name="file">
								<label class="custom-file-label" for="customFile">Choose file</label>
							</div>
						</div>
			            
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						
						<div class="form-group">
							<button type="submit" class="btn btn-primary">To note</button>
						</div>
			        </form>
		        </div>
	        </div>

			<div class="card-columns">
				<c:forEach items="${allNotes}" var="currentNote">
		        	<div class="card my-3" style="width: 18rem;">
			        	<div>
							<c:if test="${currentNote.filename != null}">
								<img src="/img/${currentNote.filename}" class="card-img-top">
							</c:if>
						</div>
						
						<div class="m-2">
				        	<i>${currentNote.header}</i>
				        	<span>${currentNote.text}</span>
			        	</div>
			        	
			        	<div class="card-footer text-muted">
			        		${currentNote.author.username}
			        	</div>
		        	</div>
		        </c:forEach>
	        </div>
	        
	        <!-- Optional JavaScript -->
		    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	    </div>
	</body>
</html>
