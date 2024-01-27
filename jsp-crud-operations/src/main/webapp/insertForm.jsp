<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Form</title>
</head>
<body>
		<form action="insert.jsp" method="POST">
		<label for="fname">FirstName</label>
		<input type="text" id="fname" name="fname">
		<label for="lname">LastName</label>
		<input type="text" id="lname" name="lname">
		<label for="age">Age</label>
		<input type="number" name="age" id="age">
		<button type="submit">Ok</button>
	
	
	</form>
	 <c:if test="${not empty param.success}">
        <p>Data inserted successfully!</p>
    </c:if>
</body>
</html>