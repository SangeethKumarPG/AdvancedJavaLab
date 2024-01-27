<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Respones</title>
</head>
<body>

	The student is confirmed : ${param.firstName } ${param.lastName }
	<br>
	<br>
		Favourite Programming Languages
		<ul>
			<% String[] langs = request.getParameterValues("favouriteLanguage");
				for(String tempLang : langs){
					out.println("<li>"+tempLang+"</li>");
				}
			%>
	
		</ul>
	
	
	
	
</body>
</html>