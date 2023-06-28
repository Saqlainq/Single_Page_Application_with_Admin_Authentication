<%
    // Check if the username and password are valid
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null && username.equals("admin123") && password.equals("12345")) {
        // Set the username in the session
        session.setAttribute("username", username);
        // Redirect to the admin page
        response.sendRedirect("admin.jsp");
    } else {
        // Invalid login, redirect back to the login page
        response.sendRedirect("admin_login.jsp");
    }
%>


