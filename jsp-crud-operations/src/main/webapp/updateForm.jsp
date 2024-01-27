<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="javax.servlet.*"%>   
 <%@page import="java.sql.*, java.util.*, java.io.*, java.net.*"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
</head>
<body>
	
		<%
			int id = Integer.parseInt(URLDecoder.decode(request.getParameter("id"),"UTF-8"));
			if(id >= 0){
				Connection connection = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
					Statement statement = connection.createStatement();
					ResultSet resultSet = statement.executeQuery("SELECT * FROM student where id = "+id);
					while(resultSet.next()){
						String firstName = resultSet.getString("firstName");
						String lastName = resultSet.getString("lastName");
						int age = resultSet.getInt("age");
		%>
			
		<form action="update.jsp" method="POST">
			<label for="fname">FirstName</label>
			<input type="text" name="fname" id="fname" value="<%=firstName%>">
			<label for="lname">LastName</label>
			<input type="text" name="lname" id="lname" value="<%=lastName%>">
			<label for="age">Age</label>
			<input type="number" name="age" id="age" value="<%=age%>">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="submit">
		
		</form>
		<%
	
		}
					
				}catch(SQLException e){
					out.println(e);
				}
			}
		
		%>
</body>
</html>