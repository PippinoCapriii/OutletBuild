<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.negre.mannaggiaaquellanegrabastarda.ProductBean" %>
<%@ page import="com.negre.mannaggiaaquellanegrabastarda.ProductModel" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reggia Outlet - Prodotti di Vestiti</title>
    <style>
        /* Stile CSS */
        .header {
            background-color: #131921;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar {
            background-color: #232f3e;
            padding: 10px 0;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-left {
            display: flex;
            align-items: center;
        }

        .navbar-right {
            display: flex;
            align-items: center;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
        }

        .search-bar {
            max-width: 300px;
            margin: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
        }

        .search-bar input[type="text"] {
            width: 80%;
            padding: 8px;
            margin-right: 5px;
            border: none;
            border-radius: 5px;
        }

        .search-bar input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Stile prodotti */
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .product-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 20px;
        }

        .product-card {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-details {
            padding: 20px;
        }

        .product-details h2 {
            margin: 0;
            margin-bottom: 10px;
            font-size: 18px;
            color: #333;
        }

        .product-details p {
            margin: 0;
            margin-bottom: 5px;
            font-size: 14px;
            color: #666;
        }

        .product-details button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
        }

        .product-details button:hover {
            background-color: #0056b3;
        }

        .product-details-container {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eaeaea;
        }

        .product-details-container img {
            max-width: 100%;
            margin-bottom: 20px;
        }

        .product-details-container p {
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
        }

        .back-link {
            display: inline-block;
            color: #007bff;
            text-decoration: none;
            margin-top: 10px;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        /* Footer CSS */
        .footer {
            background-color: #232f3e;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Reggia Outlet</h1>
    <div class="navbar">
        <div class="navbar-left">
            <a href="/">Home</a>
            <div class="search-bar">
                <form action="/ricerca" method="get">
                    <input type="text" name="query" placeholder="Cerca prodotti...">
                    <input type="submit" value="Cerca">
                </form>
            </div>
        </div>
        <div class="navbar-right">
            <a href="/carrello">Carrello</a>
            <a href="/login">Accedi</a>
        </div>
    </div>
</div>
<div class="container">
    <h1>Prodotti di Vestiti</h1>

    <div class="product-list">
        <%-- Recupera i prodotti dal database --%>
        <%
            ProductModel productModel = new ProductModel();
            List<ProductBean> products = productModel.getAllProducts();
            for (ProductBean product : products) {
        %>
        <div class="product-card">
            <img class="product-image" src="<%= product.getImg() %>" alt="<%= product.getName() %>">
            <div class="product-details">
                <h2><%= product.getName() %></h2>
                <p>Marca: <%= product.getMarca() %></p>
                <p>Prezzo: <%= product.getPrice() %> Euro</p>
                <p>Quantità disponibile: <%= product.getQuantity() %></p>
                <p>Descrizione: <%= product.getDescription() %></p>
                <form action="" method="get">
                    <input type="hidden" name="product" value="<%= product.getCode() %>">
                    <button type="submit">Dettagli</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>

    <div class="product-details-container">
        <%-- Mostra i dettagli del prodotto selezionato --%>
        <% String selectedProductCode = request.getParameter("product");
            if (selectedProductCode != null) {
                int code = Integer.parseInt(selectedProductCode);
                ProductBean selectedProduct = null;
                for (ProductBean product : products) {
                    if (product.getCode() == code) {
                        selectedProduct = product;
                        break;
                    }
                }
                if (selectedProduct != null) {
        %>
        <h2><%= selectedProduct.getName() %></h2>
        <p>Marca: <%= selectedProduct.getMarca() %></p>
        <img src="<%= selectedProduct.getImg() %>" alt="<%= selectedProduct.getName() %>">
        <p>Descrizione: <%= selectedProduct.getDescription() %></p>
        <p>Prezzo: <%= selectedProduct.getPrice() %> Euro</p>
        <a class="back-link" href="/">Torna alla lista dei prodotti</a>
        <%      }
        } %>
    </div>
</div>
<div class="footer">
    <p>Creato da: Tuo Nome</p>
    <p>Marchi dei prodotti sono di proprietà dei rispettivi titolari.</p>
</div>
</body>
</html>
