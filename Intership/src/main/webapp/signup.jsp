<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Intience</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #003366, #006699);
    }

    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: rgb(0, 63, 114);
        padding: 0.5em 1em;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        margin: 0 1em;
        font-size: 1em;
    }

    .navbar a:hover {
        color: #1AB79D;
    }

    .navbar .logo {
        font-size: 1.5em;
        font-weight: bold;
        color: white;
    }

    .loginWindow {
        max-width: 500px;
        margin: 2em auto;
        background: white;
        border-radius: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 40px;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    /* Zoom effect on hover */
    .loginWindow:hover {
        transform: scale(1.05); /* Slight zoom-in effect */
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Enhanced shadow effect */
    }

    .loginHeader {
        font-size: 2em;
        font-weight: bold;
        color: rgb(0, 63, 114);
        text-align: center;
        margin-bottom: 20px;
    }

    .innerLoginWindow {
        text-align: left;
    }

    .innerLoginWindow input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
        transition: border-color 0.3s;
    }

    .innerLoginWindow input:focus {
        border-color: #0056b3; /* Blue border on focus */
    }

    .innerLoginWindow button {
        background-color: #0056b3;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        width: 20%;
        transition: background-color 0.3s;
    }

    .innerLoginWindow button:hover {
        background-color: #17a589;
    }

    #ack {
        color: #666;
        font-size: 1em;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Intence</div>
    </div>

    <div class="loginWindow">
        <div class="loginHeader">SignUp</div>
        <div class="innerLoginWindow">
            <div style="padding:20px 0px 3px 0px">Username*</div>
            <input type="text" id="T1" />
            <div style="padding:10px 0px 3px 0px">Password*</div>
            <input type="password" id="T2" />
            <div style="padding:10px 0px 3px 0px">Confirm Password*</div>
            <input type="password" id="T3" />
            <div style="padding:10px 0px 3px 0px">First Name*</div>
            <input type="text" id="T4" />
            <div style="padding:10px 0px 3px 0px">Last Name*</div>
            <input type="text" id="T5" />
            <div style="padding:10px 0px 3px 0px">Mobile no.*</div>
            <input type="text" id="T6" />
            <div style="padding:10px 0px 3px 0px">Email*</div>
            <input type="text" id="T7" />
            <button class="signinBtn" onclick="save()">Save</button>
            <div style="width:100%;height:70px;line-height:70px">
                <label id="ack"></label>
            </div>
        </div>
    </div>

    <footer>© 2024 MyApp. All Rights Reserved.</footer>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function save() {
            var username = document.getElementById("T1").value;
            var password = document.getElementById("T2").value;
            var retypePassword = document.getElementById("T3").value; // Variable for re-type password
            var firstname = document.getElementById("T4").value;
            var lastname = document.getElementById("T5").value;
            var mobileno = document.getElementById("T6").value;
            var emailid = document.getElementById("T7").value;

            if (!username || !password || !retypePassword || !firstname || !lastname || !mobileno || !emailid) {
                alert("Please fill in all required fields.");
                return;
            }

            if (password !== retypePassword) {
                alert("Passwords do not match. Please try again.");
                document.getElementById("T3").classList.add('invalid');
                return;
            } else {
                document.getElementById("T3").classList.remove('invalid');
            }

            var data = JSON.stringify({
                username: username,
                password: password,
                firstname: firstname,
                lastname: lastname,
                mobileno: mobileno,
                emailid: emailid
            });

            var url = "http://localhost:8082/user/signup";

            callApi("POST", url, data, getResponse);
        }
    </script>
</body>
</html>
