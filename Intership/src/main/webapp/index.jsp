<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Intience</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #003366, #006699); /* Adjusted to logo's color scheme */
            color: #fff;
        }

        h1 {
            text-align: center;
            color: #006699;
            margin-top: 20px;
            font-size: 2.8rem;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .container img {
            width: 150px; /* Keep the logo in its natural proportions */
            height: auto;
            margin: 20px 0;
            animation: fadeIn 1.5s ease-in-out;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #333;
        }

        .btn {
            display: inline-block;
            margin: 20px;
            padding: 15px 25px;
            font-size: 1rem;
            text-decoration: none;
            color: #fff;
            border-radius: 8px;
            background-color: #0056b3; /* Matches logo */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            background-color: #003366;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            width: 300%;
            height: 300%;
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transition: transform 0.5s ease-out;
            z-index: 0;
        }

        .btn:hover::after {
            transform: translate(-50%, -50%) scale(1);
        }

        .btn span {
            position: relative;
            z-index: 1;
        }

        .admin-btn {
            background-color: #1e7e34;
        }

        .admin-btn:hover {
            background-color: #145a24;
        }

        footer {
            text-align: center;
            margin-top: 140px;
            padding: 15px 0;
            background-color: #003366; /* Matches logo */
            color: #fff; /* Ensures both the text and links are white */
            font-size: 0.9rem;
            animation: fadeInUp 1.5s ease;
        }

        footer a {
            color: #fff; /* White color for Contact Us link */
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
    <div class="container">
        <h1>Welcome to Intience</h1>
        <img src="image/intience2.png" alt="Intience Logo"> <!-- Logo retains original dimensions -->
        <p>Navigate to the appropriate section:</p>
        <!-- Links for Intern and Admin -->
        <a href="login.jsp" class="btn"><span>Intern</span></a>
        <a href="http://localhost:8081" class="btn admin-btn"><span>Admin</span></a>
    </div>

    <footer>
        <p>&copy; 2024 Intience. All rights reserved. | <a href="contact.jsp">Contact Us</a></p>
    </footer>
</body>
</html>