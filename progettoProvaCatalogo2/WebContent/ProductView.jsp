<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, it.unisa.model.ProductBean, it.unisa.model.Cart" %>

<!DOCTYPE html>
<html>
<head>
    <title>CatalogoOutletDream&Passion</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            border: 0;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: calc(100% - 22px);
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
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

        input[type="submit"]:hover,
        input[type="reset"]:hover {
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
                <align center=right> <li><a href="Register.jsp" class = "register">Register</a></li></center>
                <align center=right> <li><a href="Login.jsp" class = "login">Login</a></li></center>
               <align center=right> <li><a href="Cart.jsp" class = "cart">Il tuo carrello</a></li></center>
            </ul>
            <br>
            <ul>
                <li><a href="product?action=filtra&marca=Gucci">Gucci</a></li>
                <li><a href="product?action=filtra&marca=Nike">Nike</a></li>
                <li><a href="product?action=filtra&marca=Dior">Dior</a></li>
            </ul>
        </nav>
    </header>

    <h2>Prodotti Presenti Nel Catalogo</h2>
    <table border ="7" border color="grey">
     
        <thead>
            <tr>
                <th bgcolor="#21233d" style="color: white;">Immagine</th>
                <th bgcolor="#21233d" style="color: white;">descrizione</th>
                <th bgcolor="#21233d" style="color: white;">azioni</th>
             
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td style="background-image: url('<c:out value="${product.img}" />'); background-size: cover; width: 100px; height: 100px;"></td>
                    <td><c:out value="${product.name}" /><br><c:out value="${product.marca}" /><br><c:out value="${product.description}" /><br>$<c:out value="${product.price}" /></td>
                    <td>
                        <a href="product?action=delete&id=<c:out value="${product.code}" />">Cancella Prodotto</a><br>
                        <a href="product?action=addC&id=<c:out value="${product.code}" />"><img src="data:image/jpeg;base64,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" width="180" height="60"> </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Inserisci i dati di un nuovo prodotto</h2>
    <form action="product" method="post">
        <input type="hidden" name="action" value="insert">

        <label for="name">Nome:</label><br>
        <input name="name" type="text" maxlength="20" required placeholder="Inserisci Nome"><br>

        <label for="marca">Marca:</label><br>
        <input name="marca" type="text" maxlength="20" required placeholder="Inserisci marca"><br>

        <label for="description">Descrizione:</label><br>
        <textarea name="description" maxlength="100" rows="3" required placeholder="Inserisci descrizione"></textarea><br>

        <label for="price">Prezzo:</label><br>
        <input name="price" type="number" min="0" value="0" required><br>

        <label for="quantity">Quantità:</label><br>
        <input name="quantity" type="number" min="1" value="1" required><br>

        <label for="image">Immagine:</label><br>
        <input name="image" type="text" maxlength="512" placeholder="percorso immagine"><br>

        <input type="submit" value="Aggiungi il prodotto"><input type="reset" value="Resetta i campi">
    </form>

    <br><br>
    <footer>Sito sviluppato da: Dream Team (Michele Di Meo, Fabrizio Cozzolino, Antonio Rapa)
        <br><br>Immagini date in gentile concessioni dai marchi in collaborazione quali: Gucci, Prada, Nike, Dior
    </footer>
</body>
</html>