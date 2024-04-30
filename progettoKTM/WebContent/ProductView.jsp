<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart" errorPage="error.jsp"%>

<head>
    <title>CatalogoOutletDream&Passion</title>
    <style>
        /* Reset CSS */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

/* Global Styles */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
      background-color: #f7f7f7;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

header {
background-color: #21233d;
            padding: 20px;
            color: white;
            text-align: center;
}

.logo {
    font-size: 24px;
}

nav ul {
    list-style: none;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
}


.products {
    padding: 50px 0;
    text-align: center;
}

.product {
    display: inline-block;
    margin: 0 20px;
}

.product img {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
}


/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

tbody tr:hover {
    background-color: #ddd;
}

/* Image Style */
td:first-child {
    width: 100px;
    height: 100px;
    background-size: cover;
    background-position: center;
}

/* Action Links */
td:last-child a {
    display: block;
    margin-bottom: 5px;
    color: blue;
    text-decoration: none;
}

td:last-child a:hover {
    text-decoration: underline;
}


.insert {
    padding: 50px 0;
    text-align: center;
}

.insert form {
    max-width: 600px;
    margin: 0 auto;
}

.insert label,
.insert input,
.insert textarea,
.insert button {
    display: block;
    width: 100%;
    margin-bottom: 20px;
}

.insert input,
.insert textarea {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.insert button {
    background-color: #333;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

footer {
    background-color: #21233d;
            color: white;

    text-align: center;
    padding: 20px 0;
}

    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1 class="logo">Outlet Dream&Passion</h1>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Offerte</a></li>
                    <li><a href="#">Cerca</a></li>
                  
                </ul>
            </nav>
        </div>
    </header>

    <section class="products">
        <div class="container">
            <h2>Prodotti in evidenza</h2>
            
            <table border="1">
    <thead>
        <tr>
            <th>Immagine</th>
            <th>Nome</th>
            <th>Marca</th>
            <th>Descrizione</th>
            <th>Azioni</th>
        </tr>
    </thead>
    <tbody>
        <% if (products != null && products.size() != 0) { %>
            <% Iterator<?> it = products.iterator(); %>
            <% while (it.hasNext()) { %>
                <% ProductBean bean = (ProductBean) it.next(); %>
                <tr>
                    <td style="background-image: url('<%=bean.getImg()%>'); background-size: cover; width: 100px; height: 100px;"></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getMarca()%></td>
                    <td><%=bean.getDescription()%></td>
                    <td>
                        <a href="product?action=delete&id=<%=bean.getCode()%>">Cancella Prodotto</a><br>
                        <a href="product?action=addC&id=<%=bean.getCode()%>">Aggiungi al carrello</a>
                    </td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="5">No products available</td>
            </tr>
        <% } %>
    </tbody>
</table>

        </div>
    </section>

    <section class="insert">
        <div class="container">
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

        <label for="quantity">Quantita':</label><br>
        <input name="quantity" type="number" min="1" value="1" required><br>

        <label for="image">Immagine:</label><br>
        <input name="image" type="file"  ><br>

        <input type="submit" value="Aggiungi il prodotto"><input type="reset" value="Resetta i campi">
    </form>

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
