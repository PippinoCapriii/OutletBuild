<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="it.unisa.model.Cart, it.unisa.model.ProductBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Il tuo carrello</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <div class="container">
            <h1 class="logo">Outlet Dream&Passion</h1>
            <nav>
                 <ul>
                    <li><a href="ProductView.jsp">Home</a></li>
                    <li><a href="#">Offerte</a></li>
                    <li><a href="#">Cerca</a></li>
                   
                    <li><a href="Cart.jsp" class = "cart">Il tuo carrello</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="cart">
        <div class="container">
            <h2>Il tuo carrello</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Nome prodotto</th>
                        <th>Prezzo</th>
                        <th>quantità</th>
                        <th>azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                   	
                        Cart cart = (Cart) session.getAttribute("cart");
                        if (cart != null && !cart.getProducts().isEmpty()) {
                            for (ProductBean product : cart.getProducts()) {
                    %>
                    <tr>
                        <td><%= product.getName() %></td>
                        <td>€<%= product.getPrice() %></td>
                        <td>ciao </td>
                        <td><a href="product?action=deleteC&id=<%= product.getCode() %>">Rimuovi dal carrello</a></td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="5">Il carrello è vuoto</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; Sito sviluppato da:Dream Team (Michele Di Meo, Fabrizio Cozzolino, Antonio Rapa)
		<br><br>Immagini date in gentile concessioni dai marchi in collaborazione quali:
		Gucci, Prada, Nike, Dior
</p>
        </div>
    </footer>
</body>
</html>
