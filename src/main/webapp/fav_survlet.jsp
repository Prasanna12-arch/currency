<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%
String Name = request.getParameter("Name");
String Add_a_new_favorite_currency = request.getParameter("Add_a_new_favorite_currency");

System.out.println(Name);
System.out.println(Add_a_new_favorite_currency);

Connection con = null;
PreparedStatement st = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/currency", "root", "root");

    // Check if the connection is successful before proceeding
    if (con != null) {
        st = con.prepareStatement("insert into favourite values(?,?)");
        st.setString(1,Name);
        st.setString(2, Add_a_new_favorite_currency);
       

        int i = st.executeUpdate();

        if (i > 0) {
            System.out.println("saved successful");
            String confirmationMessage = "saved successfully!";
            request.setAttribute("confirmationMessage", confirmationMessage);

            // Forward to the dashboard.jsp page with the confirmation message as an attribute
            RequestDispatcher dispatcher = request.getRequestDispatcher("design.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("not saved");
        }
    } else {
        System.out.println("Connection to the database failed");
    }
} 
catch (Exception ex) {
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