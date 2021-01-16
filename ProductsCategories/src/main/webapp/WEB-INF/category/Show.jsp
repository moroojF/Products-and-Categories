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
			<h3><a href="/Products">Products</a> | <a href="/categories">Categories</a></h3>
		</nav>
		<h2>${ category.name }</h2>
		<p>${ category.description }</p>
		<h3>Products</h3>
		<ul>
		<c:forEach items="${ category.products }" var="pro">
			<li>${ pro.name }</li>			
		</c:forEach>
		</ul>
		<h3>Add Product</h3>
		<form:form action="/associations/category" method="POST" modelAttribute="association">
			<form:input type="hidden" path="product" value="${ product.id }"/>
			<div class="form-group">
		        <form:label path="category">Song Title</form:label>
		        <form:errors path="category"/>
		        <form:select class="form-control" path="category">
		        <c:forEach items="${ notInCategories }" var="nonCat">
		        	<option value=${ nonCat.id }>${ nonCat.name }</option>
		        </c:forEach>
		        </form:select>
		    </div>
		    <button class="btn-dark">Add Category</button>
		</form:form>
	</div>
</body>
</html>