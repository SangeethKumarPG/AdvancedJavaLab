<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
</head>
<body>
	<form:form modelAttribute="book" action="/book/update" method="POST">
		<form:hidden path="id" value="${book.id}"/>
		<form:label path="name">Name:</form:label>
		<form:input path="name" type="text" value="${book.name}"/>
		
		<form:label path="author">Author:</form:label>
		<form:input path="author" type="text" value="${book.author}"/>
		
		<form:label path="category">Category:</form:label>
		<form:input path="category" type="text" value="${book.category}"/>
		
		<button>Submit</button>
	
	</form:form>
	<c:if test="${updateSuccess}">
		<h4>Book updated!!!</h4>
	</c:if>
</body>
</html>