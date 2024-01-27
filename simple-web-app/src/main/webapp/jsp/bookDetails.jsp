<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book By Id</title>
</head>
<body>
	<c:if test="${!errorMessage}">
		<h1>${book.name}</h1>
		<p>Author   : ${book.author}</p>
		<p>Category : ${book.category}</p>
	</c:if>
	
</body>

</html>