<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="javax.servlet.*"%>   
 <%@page import="java.sql.*, java.util.*, java.io.*"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD operations</title>
</head>
<body>
	<button><a href="insertForm.jsp" style="text-decoration:none">Insert</a></button>
	<button><a href="viewData.jsp" style="text-decoration:none">View Data/Delete/Update</a></button>

</body>
</html>