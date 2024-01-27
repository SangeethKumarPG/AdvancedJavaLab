<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*, java.util.*, java.io.*, javax.servlet.*" %>
<%@page import="org.apache.commons.io.*, org.apache.commons.fileupload.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload image</title>
</head>
<body>
	<form action="fileUploadDriver.jsp" method="POST" enctype="multipart/form-data">
		<label for="image">ImageFile</label>
		<input type="file" name="image" id="image">
		<button type="submit">Upload</button>
	
	</form>

</body>
</html>