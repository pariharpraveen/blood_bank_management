<%@page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*" %>
<%
String mobilenumber = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("update bloodrequest set status='completed' where mobilenumber=?"); // Removed extra quotes and fixed table name
    ps.setString(1, mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForBlood.jsp");
} catch (Exception e) {
    e.printStackTrace(); // Properly handle the exception
    response.sendRedirect("requestForBlood.jsp");
}
%>