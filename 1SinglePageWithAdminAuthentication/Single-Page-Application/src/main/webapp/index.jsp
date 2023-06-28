<!DOCTYPE html>
<html>
<head>
    <title>My Single Page Application</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            margin-bottom: 30px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button-container form {
            margin: 0 10px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Welcome to My Application</h1>
    
    <div class="button-container">
        <form action="main_login.jsp" method="post">
            <input type="submit" value="Login">
        </form>
        
        <form action="register.jsp" method="post">
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>



