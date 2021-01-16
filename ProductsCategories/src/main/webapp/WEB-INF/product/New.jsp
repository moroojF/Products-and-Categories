<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>New Product</title>
</head>
<body>
<div class="container">
		<h2>New Product</h2>
		<form:form action="/products" method="POST" modelAttribute="product">
			<div class="form-group">
		        <form:label path="name">Name</form:label>
		        <form:errors path="name"/>
		        <form:input class="form-control" path="name"/>
		    </div>
		    <div class="form-group">
		        <form:label path="description">Description</form:label>
		        <form:errors path="description"/>
		        <form:input class="form-control" path="description"/>
		    </div>
		    <div class="form-group">
		        <form:label path="price">Price</form:label>
		        <form:errors path="price"/>
		        <form:input class="form-control" path="price"/>
		    </div>
		    <button class="btn-dark">Add Product</button>
		</form:form>
	</div>
</body>
</html>