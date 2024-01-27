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
	<form:form method="POST" action="findbyid" modelAttribute="book">
		<form:label path="id">Id:</form:label>
		<form:input path="id" type="number"/>
		
		<button>Submit</button>
	</form:form>

</body>
</html>