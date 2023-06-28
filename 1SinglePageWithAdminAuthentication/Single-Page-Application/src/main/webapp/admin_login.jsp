<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-pzjw8N+ua6cl6c0pDp6F4QiskXKw9oBSfou6K7c5R3+EraPPO3O5G2sf9xW0p5wP"
        crossorigin="anonymous">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .admin-button {
            background-color: blue;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Admin Login</h1>
        <form action="admin_page.jsp" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="text-center">
                <input type="submit" class="btn admin-button" value="Login">
            </div>
        </form>
    </div>
</body>
</html>






