<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Show Product</title>
</head>
<body>
<div class="container">
		<nav>
			<h3><a href="/products/new">Products</a> | <a href="/categories/new">Categories</a></h3>
		</nav>
		<h2>${ product.name }</h2>
		<p>${ product.description }</p>
		<h3>Categories</h3>
		<ul>
		<c:forEach items="${ product.categories }" var="cat">
			<li>${ cat.name }</li>			
		</c:forEach>
		</ul>
		<h3>Add Category</h3>
		<form action="/products/${product.id}/addCat" method="POST" modelAttribute="category">
			<div class="form-group">
		        <label path="name">Categories</label>
		        <select class="form-control" name="category">
		        <c:forEach items="${ notInCategories }" var="nonCat">
		        	<option value=${ nonCat.id }>${ nonCat.name }</option>
		        </c:forEach>
		        </select>
		    </div>
		    <button class="btn-dark">Add Category</button>
		</form>
	</div>
</body>
</html>