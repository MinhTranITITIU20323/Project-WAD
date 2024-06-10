<%-- 
    Document   : manageUsers
    Created on : Jun 8, 2024, 4:16:22 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<html>
<head>
    <title>All Users</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (username != null && isAdmin != null && isAdmin) {
%>
        <h2>All Users</h2>
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Action</th>
            </tr>
            <%
                String dbURL = "jdbc:mysql://localhost:3306/project";
                String dbUser = "root";
                String dbPassword = "password";
                Connection conn = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                    String sql = "SELECT * FROM users";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    ResultSet resultSet = statement.executeQuery();
                    while (resultSet.next()) {
                        boolean isAdminUser = resultSet.getBoolean("is_admin");
                        String user = resultSet.getString("usersName");
                        if (!user.equals(username) && !isAdminUser) {

            %>
                        <tr>
                            <td><%= user %></td>
                            <td>
                                <form action="deleteUser" method="post">
                                    <input type="hidden" name="username" value="<%= user %>">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>
                        </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (conn != null) {
                        conn.close();
                    }
                }
            %>
        </table>
        <a href="index.jsp">Back to Home</a>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
