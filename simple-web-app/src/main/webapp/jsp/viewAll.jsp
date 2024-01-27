<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All</title>
</head>
<style>
	table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
<body>
		<table>
			<tr>
				<td><b>Name</b></td>
				<td><b>Author</b></td>
				<td><b>Category</b></td>
				<td><b>Delete</b></td>
				<td><b>Update</b></td>
			</tr>
			<c:forEach items="${books}" var="book">
				<tr>
					<td>${book.name}</td>
					<td>${book.author}</td>
					<td>${book.category}</td>
					<td><a href="delete/${book.id}" style="text-decoration:none">delete</a></td>
					<td><a href="updatebook/find?id=${book.id}" style="text-decoration:none">update</a></td>
				</tr>	
			</c:forEach>
		</table>
</body>
</html>