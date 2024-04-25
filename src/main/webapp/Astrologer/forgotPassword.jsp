<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
        }

        .form-container h1 {
            margin-bottom: 30px;
            color: #333;
        }

        .input-field {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .input-field:focus {
            border-color: #007bff;
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-to-login {
            margin-top: 40px;
            font-size: 14px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-to-login:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Forgot Password</h1>
    <form action="#" method="POST" id="forgot-password-form">
        <input type="text" id="email" name="email" class="input-field" placeholder="Enter your email" required><br>

        <input type="submit" class="btn" id="submitBtn" name="submit" value="Reset Password">
    </form>
    <a href="Astrologer_Login.jsp" class="back-to-login">Back to Login</a>
</div>

</body>
</html>
