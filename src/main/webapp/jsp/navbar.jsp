<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/">library</a>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse"	data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="/main">Notes</a></li>

			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item"><a class="nav-link" href="/user">User List</a></li>
			</security:authorize>	
		</ul>
		
		<div class="navbar-text">${pageContext.request.userPrincipal.name}</div>
		
		<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<form action="/logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-primary ml-3" type="submit">Sign Out</button>
		    </form>
	    </security:authorize>
	</div>
</nav>
