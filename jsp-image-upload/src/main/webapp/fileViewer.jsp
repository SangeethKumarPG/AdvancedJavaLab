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
<title>Image Viewer</title>
</head>
<body>
		<%
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			List<String> imagePaths = new ArrayList<>();
			try{
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
				preparedStatement = connection.prepareStatement("SELECT * FROM images");
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()){
					String filePath = resultSet.getString("image");
					out.println("<img src=\""+filePath+"\"><br/>");	
					//imagePaths.add(filePath);
					}
			}catch(SQLException e){
				out.println(e);
			}finally{
				if(connection != null){
					connection.close();
				}
				if(preparedStatement != null){
					preparedStatement.close();
				}
			}
		%>

</body>
</html>