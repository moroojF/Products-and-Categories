<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Show Category</title>
</head>
<body>
<div class="container">
		<nav>
			<h3><a href="/products/new">Products</a> | <a href="/categories/new">Categories</a></h3>
		</nav>
		<h2>${ category.name }</h2>
		<h3>Products</h3>
		<ul>
		<c:forEach items="${ category.products }" var="pro">
			<li>${ pro.name }</li>			
		</c:forEach>
		</ul>
		<h3>Add Product</h3>
		<form action="/categories/${category.id}/addPro" method="POST" modelAttribute="product">
			<div class="form-group">
		        <label path="name">Categories</label>
		        <select class="form-control" name="product">
		        <c:forEach items="${ notInProducts }" var="nonPro">
		        	<option value=${ nonPro.id }>${ nonPro.name }</option>
		        </c:forEach>
		        </select>
		    </div>
		    <button class="btn-dark">Add Product</button>
		</form>
	</div>
</body>
</html>