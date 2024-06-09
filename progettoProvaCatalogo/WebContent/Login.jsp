<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Outlet Dream&Passion</title>
    <style>
        footer {
            background-color: #21233d;
            color: white;
            padding: 20px;
            bottom: 0;
            width: 100%;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        header {
            background-color: #21233d;
            padding: 20px;
            color: white;
            text-align: center;
        }

        nav ul {
            padding: 0;
            list-style: none;
            text-align: center;
            margin-top: 20px;
        }

        nav ul li {
            display: inline;
            margin-right: 10px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #555;
        }

        h2 {
            font-family: "Lucida Console", "Courier New", monospace;
            text-align: center;
            margin-top: 30px;
        }

        form {
            margin-top: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Outlet Dream&Passion</h1>
        <nav>
            <ul>
                <li><a href="product">Home</a></li>
                <li><a href="#">Offerte</a></li>
                <li><a href="#">Search</a></li>
                <align center=right> <li><a href="Login.jsp" class="login">Accedi</a></li></center>
                <align center=right> <li><a href="Cart.jsp" class="cart">Il tuo carrello</a></li></center>
            </ul>
          
        </nav>
    </header>

    <h2>Login</h2>
    <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="Login">
    </form>
	<center> <p> Non sei Registrato? Registrati <a href="Register.jsp" class = "register"> qui</a>.</p></center>
    <br><br>
    <footer>
        Sito sviluppato da: Dream Team (Michele Di Meo, Fabrizio Cozzolino, Antonio Rapa)
        <br><br>Immagini date in gentile concessione dai marchi in collaborazione quali: Gucci, Prada, Nike, Dior
    </footer>
</body>
</html>
