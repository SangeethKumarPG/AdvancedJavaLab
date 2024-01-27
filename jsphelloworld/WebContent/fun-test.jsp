<%@ page import= "com.sangeeth.jsp.FunUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calling java class</title>
</head>
<body>
	Hello there this is a test : <%= FunUtils.makeItLower("FUN FUN FUN") %>
</body>
</html>