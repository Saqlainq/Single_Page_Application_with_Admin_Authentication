<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Registration</title>
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
    <h2>Processing Registration</h2>

    <% 
    String requestIdStr = request.getParameter("requestId");
    int requestId = Integer.parseInt(requestIdStr);
    String action = request.getParameter("action");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/singlepage", "root", "root");

        if (action.equals("approve")) {
            // Retrieve registration request details
            String retrieveSql = "SELECT * FROM registration_requests WHERE id = ?";
            stmt = conn.prepareStatement(retrieveSql);
            stmt.setInt(1, requestId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String dob = rs.getString("dob");
                String address = rs.getString("address");
                String postalCode = rs.getString("postal_code");
                String phoneNumber = rs.getString("phone_number");

                // Insert user details into the users table
                String insertSql = "INSERT INTO users (id, username, password, first_name, last_name, dob, address, postal_code, phone_number) " +
                                   "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSql);
                stmt.setInt(1, requestId);
                stmt.setString(2, username);
                stmt.setString(3, password);
                stmt.setString(4, firstName);
                stmt.setString(5, lastName);
                stmt.setString(6, dob);
                stmt.setString(7, address);
                stmt.setString(8, postalCode);
                stmt.setString(9, phoneNumber);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // User inserted successfully
                    // Delete registration request from registration_requests table
                    String deleteSql = "DELETE FROM registration_requests WHERE id = ?";
                    stmt = conn.prepareStatement(deleteSql);
                    stmt.setInt(1, requestId);
                    stmt.executeUpdate();

                    response.sendRedirect("admin.jsp");
                } else {
                    throw new SQLException("Failed to insert user details into the database.");
                }
            } else {
                throw new SQLException("Registration request not found.");
            }
        } else if (action.equals("reject")) {
            // Delete registration request from registration_requests table
            String deleteSql = "DELETE FROM registration_requests WHERE id = ?";
            stmt = conn.prepareStatement(deleteSql);
            stmt.setInt(1, requestId);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Registration request deleted successfully
                response.sendRedirect("admin.jsp");
            } else {
                throw new SQLException("Failed to delete registration request.");
            }
        } else {
            throw new IllegalArgumentException("Invalid action.");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        throw new ServletException(e);
    } catch (SQLException e) {
        e.printStackTrace();
        throw new ServletException(e);
    } finally {
        // Close resources in the reverse order of their creation
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

