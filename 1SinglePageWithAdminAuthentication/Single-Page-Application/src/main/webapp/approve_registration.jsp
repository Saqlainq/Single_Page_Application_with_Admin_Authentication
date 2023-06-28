<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Approve Registration</title>
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
    <h2>Approve Registration</h2>

    <% 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String postalCode = request.getParameter("postalCode");
    String phoneNumber = request.getParameter("phoneNumber");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet generatedKeys = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/singlepage", "root", "root");
        String sql = "INSERT INTO users (id, username, password, first_name, last_name, dob, address, postal_code, phone_number) " +
                     "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, firstName);
        stmt.setString(4, lastName);
        stmt.setString(5, dob);
        stmt.setString(6, address);
        stmt.setString(7, postalCode);
        stmt.setString(8, phoneNumber);
        int rowsAffected = stmt.executeUpdate();

        generatedKeys = stmt.getGeneratedKeys();
        if (generatedKeys.next()) {
            int id = generatedKeys.getInt(1);
            // Store the id or other relevant information in session if needed
            session.setAttribute("userId", id);
            // Delete the registration request
            String deleteSql = "DELETE FROM registration_requests WHERE username = ?";
            stmt = conn.prepareStatement(deleteSql);
            stmt.setString(1, username);
            stmt.executeUpdate();
            // Redirect to the request status page
            response.sendRedirect("request_status.jsp");
        } else {
    %>
            <p>Registration failed. Failed to save data to the database.</p>
    <%  }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (generatedKeys != null) {
            try {
                generatedKeys.close();
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
    %>
</body>
</html>
