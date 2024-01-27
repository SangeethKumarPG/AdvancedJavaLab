<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*, java.util.*, java.io.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 

	
		if(request.getParameter("username") !=null 
		&& !request.getParameter("username").isEmpty()
		&& request.getParameter("password") !=null 
		&& !request.getParameter("password").isEmpty()
				){
			
			System.out.println("Inside");
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			try{
				boolean loginSuccess = false;
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
				preparedStatement = connection.prepareStatement("SELECT * FROM login_table WHERE username=? and password=?");
				preparedStatement.setString(1, request.getParameter("username"));
				preparedStatement.setString(2, request.getParameter("password"));
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()){
					if(resultSet.getString("username").equals(request.getParameter("username"))
						&& resultSet.getString("password").equals(request.getParameter("password"))	
						){
						loginSuccess=true;
					}else{
						loginSuccess = false;
					}
				}
				if(loginSuccess){
					if(session.getAttribute("userid") == null || session.getAttribute("userid").equals("")){
						response.sendRedirect("index.jsp");
					}	
				%>
				<jsp:include page="logout.html"/>
				<% 
				HttpSession activeSession = request.getSession();
				out.println("<center><h1>Welcome!!</h1></center>");
				session.setAttribute("userid", request.getParameter("username"));
				
				}else{
					out.println("<b>Unauthorised</b>");
				}
				
			}catch(SQLException e){
				out.println(e);
			}finally{
				if(connection!=null){
					connection.close();
				}
				if(preparedStatement!=null){
					preparedStatement.close();
				}
			}
			
			
			
		}
	
	
	%>
</body>
</html>