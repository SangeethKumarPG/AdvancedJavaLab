<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scriplet test</title>
</head>
<body>
	<h3>Hello world of java</h3>
	<%
		for(int i=1; i<=5; i++){
			out.println("<br>I really love to code");
		}
	
	%>
	
	<br>
	<br>
	<%!
		String makeItLower(String data){
		
		return data.toLowerCase();
		}
	
	%>
	Lower case version of "Hey There": <%= makeItLower("Hey There") %>

</body>
</html>