<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Intience</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #003366, #006699); /* Matches the index page gradient */
            color: #fff;
        }

        h1 {
            text-align: center;
            color: #fff;
            margin-top: 20px;
            font-size: 2.8rem;
        }

        .loginWindow {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .loginHeader {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #003366; /* Dark blue for headings */
        }

        .innerLoginWindow {
            text-align: left;
        }

        /* Updated label color to blue */
        label {
            color: #006699; /* Blue color */
            font-size: 1.1rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        img#captchaImage {
            display: block;
            margin: 10px auto;
        }

        .signinBtn {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 20px 0;
            font-size: 1rem;
            color: #fff;
            background-color: #0056b3; /* Matches the button style from the index page */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
        }

        .signinBtn:hover {
            background-color: #003366;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        #ack {
            text-align: center;
            font-size: 1rem;
            margin-top: 10px;
        }

        .signUp {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1rem;
            text-decoration: none;
            color: #fff;
            background-color: #1e7e34; /* Green for the Sign Up button */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
        }

        .signUp:hover {
            background-color: #145a24;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        footer {
            text-align: center;
            margin-top: 50px;
            padding: 15px 0;
            background-color: #003366; /* Matches the footer from the index page */
            color: #fff; /* Footer text color */
            font-size: 0.9rem;
            animation: fadeInUp 1.5s ease;
        }

        footer a {
            color: #fff; /* White color for footer links */
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="loginWindow">
        <div class="loginHeader">Sign In</div>
        <div class="innerLoginWindow">
            <label>Username*</label>
            <input type="text" id="T1" />
            
            <label>Password*</label>
            <input type="password" id="T2" />

            <!-- CAPTCHA Section -->
            <label>Enter CAPTCHA*</label>
            <img id="captchaImage" src="data:image/png;base64," alt="CAPTCHA" />
            <input type="text" id="captchaInput" placeholder="Enter CAPTCHA here" />

    

            <button class="signinBtn" onclick="signin()">Sign In</button>
            <div id="ack"></div>
            <div style="text-align: center; margin-top: 20px;">
                <span style="color: black;">Don't have an account?</span>
                <a href="/signup" class="signUp">SIGN UP NOW</a>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Intience. All rights reserved. | <a href="contact.jsp">Contact Us</a></p>
    </footer>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to fetch CAPTCHA from the server and display it
        function loadCaptcha() {
            fetch("/captcha")
                .then(response => response.json())
                .then(data => {
                    document.getElementById("captchaImage").src = "data:image/png;base64," + data.captcha;
                    sessionStorage.setItem("captchaText", data.captchaText); // Store correct CAPTCHA in session storage
                });
        }

        // Sign-in function with CAPTCHA validation
        function signin() {
            const enteredCaptcha = document.getElementById("captchaInput").value;
            const correctCaptcha = sessionStorage.getItem("captchaText");

            // Check CAPTCHA input
            if (enteredCaptcha !== correctCaptcha) {
                document.getElementById("ack").style.color = "red";
                document.getElementById("ack").innerHTML = "Incorrect CAPTCHA!";
                return;
            }

            // Prepare login data
            const data = JSON.stringify({
                username: T1.value,
                password: T2.value
            });
            
            const url = "http://localhost:8082/user/login";
            callApi("POST", url, data, signinHandler);
        }

        function signinHandler(res) {
            if (res == "401") {  // Expecting a string response for status code
                document.getElementById("ack").style.color = "red";
                document.getElementById("ack").innerHTML = "Invalid Credentials!";
            } else if (res === "200") {  // Check for successful login
                document.getElementById("ack").innerHTML = "";
                location.replace("/home");  // Redirect to home on success
            } else {
                // Handle unexpected response
                document.getElementById("ack").style.color = "red";
                document.getElementById("ack").innerHTML = "Unexpected response. Please try again.";
            }
        }

        // Load CAPTCHA when page loads
        document.addEventListener("DOMContentLoaded", function() {
            loadCaptcha();
        });
    </script>
</body>
</html>