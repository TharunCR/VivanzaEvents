<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In - Vivánzá</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --black: #121212;
            --dark-gray: #2d2d2d;
            --medium-gray: #5a5a5a;
            --light-gray: #e0e0e0;
            --white: #ffffff;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.1);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--black);
            background-color: #f9f9f9;
            line-height: 1.6;
        }

        .background-container {
            display: flex;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        .background-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('${pageContext.request.contextPath}/assets/images/FlowerOnTable.jpg');
            background-size: cover;
            background-position: center;
            filter: brightness(0.4);
            z-index: -1;
        }

        .back-button {
            position: absolute;
            top: 40px;
            left: 40px;
            color: var(--white);
            background: rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            padding: 10px 20px;
            border-radius: 30px;
            z-index: 100;
            transition: var(--transition);
            text-decoration: none;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .back-button:hover {
            background: rgba(0,0,0,0.5);
            transform: translateX(-5px);
        }

        .login-container {
            width: 100%;
            max-width: 1400px; /* Increased from 1200px */
            margin: 0 auto;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .page-header {
            text-align: center;
            margin-bottom: 60px;
            color: var(--white);
        }

        .page-header h1 {
            font-weight: 500;
            font-size: 2.8rem;
            margin-bottom: 15px;
            letter-spacing: -0.5px;
        }

        .page-header p {
            font-weight: 300;
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 700px; /* Increased from 600px */
            margin: 0 auto;
        }

        .login-card {
            background: var(--white);
            border-radius: 16px;
            box-shadow: var(--shadow-lg);
            padding: 60px; /* Increased from 50px */
            max-width: 600px; /* Increased from 500px */
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            width: 100%;
        }

        .login-card::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, var(--black), var(--medium-gray));
        }

        .login-title {
            text-align: center;
            font-weight: 500;
            margin-bottom: 40px;
            color: var(--black);
            font-size: 1.8rem;
            position: relative;
        }

        .login-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: var(--black);
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--medium-gray);
            z-index: 10;
            transition: var(--transition);
        }

        .form-control {
            width: 100%;
            padding: 15px 20px 15px 50px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 1rem;
            transition: var(--transition);
            background-color: rgba(255,255,255,0.9);
            color: var(--dark-gray);
        }

        .form-control:focus {
            border-color: var(--medium-gray);
            box-shadow: 0 0 0 2px rgba(45,45,45,0.1);
            outline: none;
        }

        .form-control:focus + .input-icon {
            color: var(--black);
        }

        .submit-btn {
            width: 100%;
            padding: 16px;
            background: var(--black);
            color: var(--white);
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: var(--dark-gray);
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .forgot-password {
            text-align: center;
            margin-top: 20px;
        }

        .forgot-password a {
            color: var(--medium-gray);
            text-decoration: none;
            transition: var(--transition);
            font-size: 0.9rem;
        }

        .forgot-password a:hover {
            color: var(--black);
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 40px 0;
        }

        .divider-line {
            flex-grow: 1;
            height: 1px;
            background: var(--light-gray);
        }

        .divider-text {
            padding: 0 15px;
            color: var(--medium-gray);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            font-size: 0.9rem;
            border: 1px solid transparent;
        }

        .social-btn i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

        .social-btn.facebook {
            background: var(--dark-gray);
            border-color: var(--medium-gray);
        }

        .social-btn.google {
            background: var(--white);
            color: var(--dark-gray);
            border: 1px solid var(--light-gray);
        }

        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-sm);
        }

        .social-btn.facebook:hover {
            background: var(--black);
        }

        .social-btn.google:hover {
            background: var(--light-gray);
        }

        .signup-link {
            text-align: center;
            margin-top: 30px;
            color: var(--medium-gray);
            font-size: 0.95rem;
        }

        .signup-link a {
            color: var(--black);
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            margin-left: 5px;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* Floating animation for the card */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .login-card {
            animation: float 6s ease-in-out infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .login-card {
                max-width: 80%;
            }
        }

        @media (max-width: 768px) {
            .login-container {
                padding: 40px 20px;
            }

            .login-card {
                padding: 50px 40px;
                max-width: 90%;
            }

            .page-header h1 {
                font-size: 2.2rem;
            }

            .page-header p {
                font-size: 1rem;
            }

            .back-button {
                top: 20px;
                left: 20px;
                padding: 8px 15px;
            }
        }

        @media (max-width: 576px) {
            .social-login {
                flex-direction: column;
            }

            .login-title {
                font-size: 1.5rem;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .login-card {
                padding: 40px 30px;
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
            <h1>Login to Vivánzá</h1>
            <p>Access your account to book our elegant venues and services</p>
        </div>

        <div class="login-card">
            <h2 class="login-title">Sign In</h2>

            <form action="/login-validation" method="POST">
                <!-- Email -->
                <div class="form-group">
                    <div class="input-group">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control" name="email" placeholder="Email address" required>
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
                <button type="submit" name="user_login" class="submit-btn">Continue</button>

                <!-- Forgot Password -->
                <div class="forgot-password">
                    <a href="/forgot_password">Forgot your password?</a>
                </div>

                <!-- Divider -->
                <div class="divider">
                    <div class="divider-line"></div>
                    <span class="divider-text">or continue with</span>
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
                Don't have an account?<a href="signup">Sign up</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>