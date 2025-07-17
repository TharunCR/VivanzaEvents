<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In - Exquisite</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --black: #121212;
            --dark-gray: #2d2d2d;
            --medium-gray: #5a5a5a;
            --light-gray: #e0e0e0;
            --white: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--black);
            margin: 0;
            padding: 0;
        }

        .background-container {
            background-image: url('${pageContext.request.contextPath}/assets/images/FlowerOnTable.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .back-button {
            position: absolute;
            top: 30px;
            left: 30px;
            color: var(--white);
            background: rgba(0,0,0,0.5);
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            z-index: 100;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: rgba(0,0,0,0.7);
            transform: translateX(-3px);
        }

        .login-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
            color: var(--white);
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .page-header h1 {
            font-weight: 500;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .page-header p {
            font-weight: 300;
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .login-card {
            background: rgba(255,255,255,0.95);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            padding: 40px;
            max-width: 500px;
            margin: 0 auto;
        }

        .login-title {
            text-align: center;
            font-weight: 500;
            margin-bottom: 30px;
            color: var(--black);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--medium-gray);
            z-index: 10;
        }

        .form-control {
            width: 100%;
            padding: 12px 20px 12px 45px;
            border: 1px solid var(--light-gray);
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--medium-gray);
            box-shadow: 0 0 0 2px rgba(0,0,0,0.05);
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background: var(--black);
            color: var(--white);
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background: var(--dark-gray);
            transform: translateY(-2px);
        }

        .forgot-password {
            text-align: center;
            margin-top: 15px;
        }

        .forgot-password a {
            color: var(--medium-gray);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: var(--black);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
        }

        .divider-line {
            flex-grow: 1;
            height: 1px;
            background: var(--light-gray);
        }

        .divider-text {
            padding: 0 15px;
            color: var(--medium-gray);
            font-size: 0.9rem;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .social-btn i {
            margin-right: 8px;
        }

        .social-btn.facebook {
            background: #3b5998;
        }

        .social-btn.twitter {
            background: #1da1f2;
        }

        .social-btn.google {
            background: #db4437;
        }

        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .signup-link a {
            color: var(--black);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .login-card {
                padding: 30px 20px;
            }

            .page-header h1 {
                font-size: 2rem;
            }

            .back-button {
                top: 20px;
                left: 20px;
            }
        }
    </style>
</head>
<body>

<div class="background-container">
    <a href="/" class="back-button">
        <i class="fas fa-arrow-left"></i> Back
    </a>

    <div class="login-container">
        <div class="page-header">
            <h1>Login and Book Your Halls</h1>
            <p>Access our elegant services with your account</p>
        </div>

        <div class="login-card">
            <h2 class="login-title">Sign In</h2>

            <form action="/login-validation" method="POST">
                <!-- Email -->
                <div class="form-group">
                    <div class="input-group">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control" name="email" placeholder="Email" required>
                    </div>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <div class="input-group">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                </div>

                <!-- Submit -->
                <button type="submit" name="user_login" class="submit-btn">Sign In</button>

                <!-- Forgot Password -->
                <div class="forgot-password">
                    <a href="/forgot_password">Forgot Password?</a>
                </div>

                <!-- Divider -->
                <div class="divider">
                    <div class="divider-line"></div>
                    <span class="divider-text">OR</span>
                    <div class="divider-line"></div>
                </div>

                <!-- Social Login -->
                <div class="social-login">
                    <a href="#" class="social-btn facebook">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </a>
                    <a href="#" class="social-btn google">
                        <i class="fab fa-google"></i> Google
                    </a>
                </div>
            </form>

            <!-- Sign up Link -->
            <div class="signup-link">
                Don't have an account? <a href="signup">Sign up here!</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>