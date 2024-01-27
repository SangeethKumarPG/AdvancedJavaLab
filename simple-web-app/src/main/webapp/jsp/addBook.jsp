<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
 <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddBook</title>
</head>
<body>
	<c:if test="${addBookSuccess}">
		<b>Book Added!!</b>
	</c:if>
	<c:url var="add_book_url" value="/book/add"></c:url>
	<form:form action="${add_book_url}" method="POST" modelAttribute="book">
		<form:label path="name">Name:</form:label>
		<form:input type="text" path="name"/>	
		
		<form:label path="author">Author:</form:label>
		<form:input path="author" type="text"/>
		
		<form:label path="category">Category:</form:label>
		<form:input path="category" type="text"/>
		
		<input type="submit"/>
	</form:form>
</body>
</html>