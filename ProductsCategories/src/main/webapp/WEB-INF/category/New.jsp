<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>New Category</title>
</head>
<body>
<div class="container">
		<h2>New Category</h2>
		<form:form action="/categories" method="POST" modelAttribute="category">
			<div class="form-group">
		        <form:label path="name">Name</form:label>
		        <form:errors path="name"/>
		        <form:input class="form-control" path="name"/>
		    </div>
		    <button class="btn-dark">Add Category</button>
		</form:form>
	</div>
</body>
</html>