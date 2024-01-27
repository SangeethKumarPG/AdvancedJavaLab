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
<title>Delete</title>
</head>
<body>
	<%
		if(request.getParameter("id")!=null){
			String idParam = request.getParameter("id");
			int id = Integer.parseInt(URLDecoder.decode(idParam,"UTF-8"));
			int rowsAffected = 0;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
	
			try{
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost/java", "root", "");
				preparedStatement = connection.prepareStatement("DELETE FROM student where id=?");
				preparedStatement.setInt(1, id);
				rowsAffected = preparedStatement.executeUpdate();
				if(rowsAffected > 0){
					response.sendRedirect("viewData.jsp?deleted=true");
				}
			}catch(SQLException e){
				out.println(e);
			}
			finally{
				if(connection != null){
					connection.close();
				}
				if(preparedStatement != null){
					preparedStatement.close();
				}
			}
		}
	
	
	%>
</body>
</html>