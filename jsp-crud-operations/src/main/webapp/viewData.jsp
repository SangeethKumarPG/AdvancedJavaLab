<%@page import="java.net.URLEncoder"%>
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
<title>View and Delete</title>
</head>
<body>
		<table border=1>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
			<%
				Connection connection = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
					Statement statement = connection.createStatement();
					ResultSet resultSet = statement.executeQuery("SELECT * FROM student");
					while(resultSet.next()){
						out.println("<tr>");
						out.println("<td>");
							out.println(resultSet.getString("firstName"));
						out.println("</td>");
						
						out.println("<td>");
							out.println(resultSet.getString("lastName"));
						out.println("</td>");
						out.println("<td>");
							out.println(resultSet.getInt("age"));
						out.println("</td>");
						out.println("<td>");
							out.println("<a href=\"delete.jsp?id="+URLEncoder.encode(String.valueOf(resultSet.getInt("id")),"UTF-8")+"\">Delete</a>");
						out.println("</td>");
						out.println("<td>");
							out.println("<a href=\"updateForm.jsp?id="+URLEncoder.encode(String.valueOf(resultSet.getInt("id")),"UTF-8")+"\">Update</a>");
						out.println("</td>");
						out.println("</tr>");

					}
					
					
				}catch(SQLException e){
					out.println(e);
				}
			
			
			%>
		
		
		</table>
		<c:if test="${not empty param.update }">
			<script>window.alert("Record updated");</script>
		
		</c:if>
		<c:if test="${not empty param.updateError }">
			<script>window.alert("Cannot be updated");</script>
		
		</c:if>
</body>
</html>