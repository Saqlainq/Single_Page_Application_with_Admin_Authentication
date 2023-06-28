<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Processing</title>
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

        /* Logout button styles */
        .logout-button {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Register - Processing</h2>

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
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/singlepage", "root", "root");

        String sql = "INSERT INTO registration_requests (username, password, first_name, last_name, dob, address, postal_code, phone_number) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, firstName);
        stmt.setString(4, lastName);
        stmt.setString(5, dob);
        stmt.setString(6, address);
        
        if (postalCode != null && !postalCode.isEmpty()) {
            stmt.setString(7, postalCode);
        } else {
            throw new IllegalArgumentException("Postal code is required.");
        }
        
        stmt.setString(8, phoneNumber);

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            // Registration request saved successfully
            %>
            <p>Your registration request has been sent to the admin for validation. You will be allowed to login once it has been approved.</p>
            <%
        } else {
            throw new SQLException("Failed to save data to the database.");
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

    <!-- Logout button -->
    <form action="main_login.jsp">
        <button class="logout-button">Logout</button>
    </form>
</body>
</html>










