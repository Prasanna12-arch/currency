
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%
String Name = request.getParameter("Name");
String Email = request.getParameter("Email");
String Contact = request.getParameter("Contact");
String Password = request.getParameter("Password");
System.out.println(Name);
System.out.println(Email);
System.out.println(Contact);
System.out.println(Password);

Connection con = null;
PreparedStatement st = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/currency", "root", "root");

    // Check if the connection is successful before proceeding
    if (con != null) {
        st = con.prepareStatement("insert into register values(?,?,?,?)");
        st.setString(1, Name);
        st.setString(2, Email);
        st.setString(3, Contact);
        st.setString(4, Password);

        int i = st.executeUpdate();

        if (i > 0) {
            System.out.println("Register successful");
            response.sendRedirect("login.jsp");
        } else {
            System.out.println("Register failed");
        }
    } else {
        System.out.println("Connection to the database failed");
    }
} catch (Exception ex) {
    out.println("Error: " + ex.getMessage());
} finally {
    // Close resources in a finally block to ensure they are always closed
    try {
        if (st != null) {
            st.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>