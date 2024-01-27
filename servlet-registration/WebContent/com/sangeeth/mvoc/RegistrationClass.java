package com.sangeeth.mvoc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class RegistrationClass
 */
@WebServlet("/RegistrationClass")
public class RegistrationClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<html><body>Hello</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String country = request.getParameter("country");
		String email = request.getParameter("email");
		
		Connection connection = null;
		int affectedRows=0;
		PreparedStatement preparedStatement = null;
		if((name!= null && !name.isEmpty()) && (password!=null && !password.isEmpty()) && 
				(!country.isEmpty() && country!=null) && (!email.isEmpty() && email!=null)) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
				preparedStatement = connection.prepareStatement("INSERT INTO Registration(name,password,country,email) VALUES(?,?,?,?)");
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, password);
				preparedStatement.setString(3, country);
				preparedStatement.setString(4, email);
				
				affectedRows = preparedStatement.executeUpdate();
				if(affectedRows > 0) {
					out.println("<b>Registration Success!!</b>");
				}
				
				
			}catch(Exception e) {
				System.out.println(e);
			}finally {
				if(connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			
			
		}else {
			out.println("<b>All fields are required</b>");
			out.println("<a href=\"register.html\">click here</a>");
			out.close();
		}
		out.println("<a href=\"register.html\">click here</a>");
		out.close();
		
	}

}
