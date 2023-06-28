<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Processing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding-top: 50px;
        }

        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h2>Login - Processing</h2>

    <% String username = request.getParameter("username");
       String password = request.getParameter("password");
    %>

    <% if (username.isEmpty() || password.isEmpty()) { %>
        <h2>Login failed. Invalid credentials.</h2>
        <p><a href="login.jsp">Go back to the login page</a></p>
    <% } else {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isAuthenticated = false;
        String firstName = null; 

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/singlepage", "root", "root");
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
         
                isAuthenticated = true;
                firstName = rs.getString("first_name"); 
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        
        	
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        if (!isAuthenticated) {
    %>
        <h2>Login failed. Invalid credentials.</h2>
        <p><a href="login.jsp">Go back to the login page</a></p>
    <% } else { %>
        <h2>Login successful!</h2>
        <p>Welcome, <%= firstName %>!</p>
    <% } } %>
</body>
</html>



