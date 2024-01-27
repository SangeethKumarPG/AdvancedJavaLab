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
<title>Insert</title>
</head>
<body>

	<%-- <c:if test="not empty param.fname and not empty param.age and not empty param.lname">
		<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/java" user="root" password=""/>
		<sql:update dataSource="${student}" var="insert">
			INSERT INTO student(firstName,lastName,age) VALUES(?,?,?) <sql:param value="${param.fname}"/>
			<sql:param value="${param.lname}"/>
			<sql:param value="${param.age}"/>
		</sql:update>
		<c:if test="${insert >=0}">
			<p>Data inserted</p>
		</c:if>
	</c:if> --%>
	
		<%
		String fname = request.getParameter("fname");
	    String lname = request.getParameter("lname");
	    String age = request.getParameter("age");

	    if (fname != null && !fname.isEmpty() && lname != null && !lname.isEmpty() && age != null && !age.isEmpty()) {
			System.out.println("Test");
			Connection connection=null;
			PreparedStatement preparedStatement = null;
			int rowsAffected=0;
			String url="jdbc:mysql://localhost/java";
			String driver="com.mysql.jdbc.Driver";
			String userName = "root";
			String password="";
			try{
				Class.forName(driver);
				connection = DriverManager.getConnection(url, userName, password);
				connection.setAutoCommit(true);
				preparedStatement = connection.prepareStatement("INSERT INTO student(firstName,lastName,age) VALUES(?,?,?)");
				preparedStatement.setString(1, request.getParameter("fname"));
				preparedStatement.setString(2, request.getParameter("lname"));
				preparedStatement.setInt(3, Integer.parseInt(request.getParameter("age")));
				rowsAffected = preparedStatement.executeUpdate();
				if(rowsAffected >0){
					response.sendRedirect("insertForm.jsp?success=true");
				}
			}catch(SQLException e){
				out.println(e);
			}finally{
				try{
					if(connection != null){
						connection.close();
					}
					if(preparedStatement != null){
						preparedStatement.close();
					}
				}catch(SQLException e){
					out.println(e);
				}
			}
	    }
		
		%>

	


</body>
</html>