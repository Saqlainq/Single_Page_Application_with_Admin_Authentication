<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Registration Requests</title>
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

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .approve-button, .reject-button {
            padding: 5px 10px;
            border-radius: 3px;
            border: none;
            cursor: pointer;
        }

        .approve-button {
            background-color: #4CAF50;
            color: white;
        }

        .reject-button {
            background-color: #f44336;
            color: white;
        }

        .success-message {
            color: #4CAF50;
            font-weight: bold;
        }

        .error-message {
            color: #f44336;
            font-weight: bold;
        }

        .logout-button {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
            border-radius: 3px;
            border: none;
            background-color: #ddd;
            color: #333;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Admin - Registration Requests</h2>

    <table>
        <tr>
            <th>Request ID</th>
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>Postal Code</th>
            <th>Phone Number</th>
            <th>Action</th>
        </tr>

        <% 
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/singlepage", "root", "root");

            String sql = "SELECT * FROM registration_requests";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int requestId = rs.getInt("id");
                String username = rs.getString("username");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String dob = rs.getString("dob");
                String address = rs.getString("address");
                String postalCode = rs.getString("postal_code");
                String phoneNumber = rs.getString("phone_number");

                %>
                <tr>
                    <td><%= requestId %></td>
                    <td><%= username %></td>
                    <td><%= firstName %></td>
                    <td><%= lastName %></td>
                    <td><%= dob %></td>
                    <td><%= address %></td>
                    <td><%= postalCode %></td>
                    <td><%= phoneNumber %></td>
                    <td>
                        <form method="post" action="process_registration.jsp">
                            <input type="hidden" name="requestId" value="<%= requestId %>">
                            <button class="approve-button" name="action" value="approve">Approve</button>
                            <button class="reject-button" name="action" value="reject">Reject</button>
                        </form>
                    </td>
                </tr>
                <%
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException(e);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        } finally {
            // Close resources in the reverse order of their creation
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
        %>
    </table>

    <form method="post" action="main_login.jsp">
        <button class="logout-button" type="submit">Logout</button>
    </form>
</body>
</html>


