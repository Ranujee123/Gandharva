<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/homeNew.css">
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        /* Header Styles */
        header {
            background-color: #ffffff;
            padding: 20px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .logo img {
            width: 100px;
            height: 100px;
            border: none;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar {
            list-style-type: none;
            display: flex;
        }

        .navbar li {
            margin: 0 20px;
        }

        .navbar a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 18px;
        }

        /* Hero Section Styles */
        .hero {
            position: relative;
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/bg1.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #ffffff;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .hero .find-match {
            background-color: #ff5e7d;
            color: #ffffff;
            padding: 15px 30px;
            border-radius: 30px;
            font-size: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .hero .find-match:hover {
            background-color: #ff3b5b;
        }

        /* Vision & Mission Styles */
        .vision-mission {
            background-color: #f9f9f9;
            padding: 80px 0;
            text-align: center;
        }

        .vision-mission h2 {
            font-size: 36px;
            margin-bottom: 40px;
        }

        .vision-mission p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        /* Contact Section Styles */
        .contact {
            background-color: #ffffff;
            padding: 80px 0;
            text-align: center;
        }

        .contact h2 {
            font-size: 36px;
            margin-bottom: 40px;
        }

        .contact form {
            max-width: 600px;
            margin: 0 auto;
        }

        .input-field {
            width: 100%;
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-field:focus {
            outline: none;
            border-color: #ff5e7d;
        }

        .input-field::placeholder {
            color: #999;
        }

        .textarea-field {
            resize: none;
            height: 150px;
        }

        .submit-btn {
            background-color: #ff5e7d;
            color: #ffffff;
            padding: 15px 30px;
            border: none;
            border-radius: 30px;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #ff3b5b;
        }

        /* Footer Styles */
        /* Footer Styles */
        footer {
            background-color: #333333;
            color: #ffffff;
            padding: 40px 0;
            text-align: center;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-section {
            flex: 1;
            margin-bottom: 20px;
        }

        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .footer-section ul {
            list-style-type: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: #fff;
            text-decoration: none;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 20px;
        }

        .social-icons a {
            color: #fff;
            margin-right: 10px;
            font-size: 20px;
            text-decoration: none;
        }


        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            .hero h1 {
                font-size: 36px;
            }
            .hero p {
                font-size: 20px;
            }
        }

        @media screen and (max-width: 576px) {
            .navbar {
                flex-direction: column;
            }
            .navbar li {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <ul class="navbar-menu">
            <li><a href="#">About Us</a></li>
            <li>
                <a href="#">Our Services</a>
                <ul class="submenu">
                    <li><a href="ourServices-Astrologer.jsp">Astrologer</a></li>
                    <li><a href="#">Event Planner</a></li>
                </ul>
            </li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Help</a></li>
        </ul>
        <div class="buttons">
            <a href="Astrologer_Login.jsp"><button class="signin">Sign In</button></a>
            <button class="divider">|</button>
            <a href="registration"><button class="signup">Sign Up</button></a>
        </div>
        <div class="hamburger-menu">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
    </nav>
</header>

<section class="hero">
    <h1>Welcome to Gandharva</h1>
    <p>Your journey to finding lifelong companionship begins here.</p>
    <a href="login" class="find-match">Find Your Match</a>
</section>

<section class="vision-mission">
    <h2>Our Vision & Mission</h2>
    <div class="vision-mission-content">
        <div class="vision-card">
            <h3>Our Vision</h3>
            <p>To create a harmonious and fulfilling journey for individuals seeking lifelong companionship by providing a comprehensive platform that integrates astrology, personalized matchmaking, and event planning services.</p>
        </div>
        <div class="mission-card">
            <h3>Our Mission</h3>
            <p>To create a harmonious and fulfilling journey for individuals seeking lifelong companionship by providing a comprehensive platform that integrates astrology, personalized matchmaking, and event planning services.</p>
        </div>
    </div>
</section>

<section class="contact">
    <h2>Get in Touch</h2>
    <div class="contact-form">
        <form enctype="multipart/form-data" id="#">
            <label for="name">Name in Full: *</label>
            <input type="text" id="name" class="input-field" placeholder="John Doe" required>
            <label for="email">Email address: *</label>
            <input type="email" id="email" class="input-field" placeholder="johndoe@email.com" required>
            <label for="inquire">How can we help? *</label>
            <textarea id="inquire" class="input-field textarea-field" placeholder="Type your message here" required></textarea>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
</section>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>About Us</h3>
            <p>TEXT</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#--1">Home</a></li>
                <li><a href="#--2">About</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#--3">Help</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <ul>
                <li>Email: info@gandarva.com</li>
                <li>Phone: +94 77 1234 567</li>
            </ul>
        </div>
        <hr class="divider">
        <div class="footer-section">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Gandharva. All rights reserved.</p>
    </div>
</footer>


</body>
</html>
