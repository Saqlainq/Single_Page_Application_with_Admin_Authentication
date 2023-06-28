<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-form {
            width: 300px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary,
        .btn-admin {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            margin-bottom: 10px;
        }

        .btn-admin {
            background-color: #6c757d;
            color: white;
        }

        .btn-admin:hover {
            background-color: #5a6268;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-form">
        <h2 class="form-title">Login</h2>
        <form action="login_process.jsp" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
        <div class="text-center">
            <a href="admin_login.jsp" class="btn btn-admin">Admin Login</a>
        </div>
    </div>
</body>
</html>



