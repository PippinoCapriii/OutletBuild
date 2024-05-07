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
                        <a href="product?action=addC&id=<c:out value="${product.code}" />"><img src="carrello.png" width="180" height="60"> </a>
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