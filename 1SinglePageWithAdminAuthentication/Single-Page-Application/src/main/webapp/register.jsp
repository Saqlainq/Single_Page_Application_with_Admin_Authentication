<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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

        .form-container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="date"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: left;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var postalCode = document.getElementById("postalCode").value;
            var phoneNumber = document.getElementById("phoneNumber").value;

            var usernameRegex = /^[a-zA-Z0-9]+$/;
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/;
            var nameRegex = /^[a-zA-Z]+$/;
            var phoneNumberRegex = /^\d+$/;
            var postalCodeRegex = /^\d+$/;

            var isValid = true;

            // Reset error messages
            document.getElementById("username-error").textContent = "";
            document.getElementById("password-error").textContent = "";
            document.getElementById("firstName-error").textContent = "";
            document.getElementById("lastName-error").textContent = "";
            document.getElementById("postalCode-error").textContent = "";
            document.getElementById("phoneNumber-error").textContent = "";

            if (!usernameRegex.test(username)) {
                document.getElementById("username-error").textContent = "Username should only contain letters and numbers.";
                isValid = false;
            }

            if (!passwordRegex.test(password)) {
                document.getElementById("password-error").textContent = "Password must contain at least one letter and one number.";
                isValid = false;
            }

            if (!nameRegex.test(firstName)) {
                document.getElementById("firstName-error").textContent = "First name should only contain letters.";
                isValid = false;
            }

            if (!nameRegex.test(lastName)) {
                document.getElementById("lastName-error").textContent = "Last name should only contain letters.";
                isValid = false;
            }

            if (postalCode === "") {
                document.getElementById("postalCode-error").textContent = "Postal code is required.";
                isValid = false;
            } else if (!postalCodeRegex.test(postalCode)) {
                document.getElementById("postalCode-error").textContent = "Postal code should only contain numerical digits.";
                isValid = false;
            }

            if (!phoneNumberRegex.test(phoneNumber)) {
                document.getElementById("phoneNumber-error").textContent = "Phone number should only contain numerical digits.";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
    <h1>Register</h1>

    <div class="form-container">
        <form action="register_processing.jsp" method="post" onsubmit="return validateForm()">
            <input type="text" id="username" name="username" placeholder="Username" required><br>
            <span class="error-message" id="username-error"></span><br>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <span class="error-message" id="password-error"></span><br>
            <input type="text" id="firstName" name="firstName" placeholder="First Name" required><br>
            <span class="error-message" id="firstName-error"></span><br>
            <input type="text" id="lastName" name="lastName" placeholder="Last Name" required><br>
            <span class="error-message" id="lastName-error"></span><br>
            <input type="text" id="postalCode" name="postalCode" placeholder="Postal Code" required><br>
            <span class="error-message" id="postalCode-error"></span><br>
            <input type="date" name="dob" placeholder="Date of Birth" required><br>
            <textarea name="address" placeholder="Address" rows="3" required></textarea><br>
            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" required><br>
            <span class="error-message" id="phoneNumber-error"></span><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>


