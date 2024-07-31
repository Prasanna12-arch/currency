<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String Email=request.getParameter("Email");
String Password=request.getParameter("Password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/currency","root","root");
	PreparedStatement  stm=con.prepareStatement
			("select * from register where Email=? AND Password=?");
	stm.setString(1, Email);
	stm.setString(2, Password);
	ResultSet rs=stm.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("dashboard.jsp");
		System.out.println("Login Succesful");
	}
	else
	{
		response.sendRedirect("login.jsp");
		System.out.println("Enter correct details");
		}
}

	catch(ClassNotFoundException e){
		//todo auto-generation catch block
		e.printStackTrace();
	}
	catch(SQLException e)
{
		e.printStackTrace();
		
}

	
	

%>
</body>
</html>