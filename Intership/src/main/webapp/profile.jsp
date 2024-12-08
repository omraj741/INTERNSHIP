<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: rgb(0, 63, 114);
            color: white;
        }

        .profileWindow {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            color: #003366;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .profileDetails {
            font-size: 1.2rem;
            line-height: 1.8;
        }

        .profileDetails span {
            font-weight: bold;
            color: #006699;
        }

        .backBtn {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            font-size: 1rem;
            background-color: #0056b3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .backBtn:hover {
            background-color: #003366;
        }
    </style>
</head>
<body>
    <div class="profileWindow">
        <h1>User Profile</h1>
        <div class="profileDetails">
            <p><span>Name: Om</span> 
            <p><span>Email: rajom741@gmail.com</span> 
        </div>
        <a href="login.jsp" class="backBtn">Back to Login</a>
    </div>
</body>
</html>