<%@page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*" %> <!-- Corrected the import directive -->
<%
String mobilenumber = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    st.executeUpdate("delete from bloodrequest where mobilenumber='" + mobilenumber + "'"); // Corrected table name
    response.sendRedirect("requestForBlood.jsp");
} catch(Exception e) {
    e.printStackTrace(); // Properly handle the exception
    response.sendRedirect("requestForBlood.jsp");
}
%>
