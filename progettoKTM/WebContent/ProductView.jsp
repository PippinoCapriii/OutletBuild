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
	


header{
		background-color:#21233d;
		
		
	}
	
	#title{
		color:white;
	font-family: "Lucida Console", "Courier New", monospace;
	font-size: 30px;
	font-style: oblique;
		 text-shadow: 2px 2px black;
	}

.stage_animation {
overflow: hidden;
white-space: nowrap;
display: inline-block;
animation: stage_animation 5s linear infinite;
margin-top: 25px;
}

table {
	width: 500px;
}

table, th, td {
	
	border: 0px;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

label {
	font-weight: bold;
}



textarea {
	width: 500px;
	height: 60px;
	font-size: 1em;
}

nav {
		background-color: #21233d;
	}

#home{

	text-align:left;
}

#offerte{
	text-align:left;
}
html {
margin: 0 auto;
}
#search{}
	nav ul {
		padding: 0;
		list-style: none;
	}

	nav ul li {
		display: inline;
	}

	nav ul li a {
		display: inline-block;
		padding: 10px 20px;
		color: white;
		text-decoration: none;
	}

	nav ul li a:hover {
		background-color: #555;
	}
	</style>	
	
</head>

<body bgcolor="#f7f7f7">

	<header>
		<div class="animation">
			<p id = "title">Outlet Dream&Passion</p>
		</div>

	
	<nav>
		<ul>
			<li id = "home"><a href="product">Home</a></li>
			<li id = "offerte"><a href="#">Offerte</a></li>
			<li id = "search"><a href="#">Search</a></li>
		</ul>
	</nav>
	</header>	
	<h2>Prodotti Presenti Nel Catalogo</h2>
	<table border="1">
		
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
    <td style="background-image: url('<%=bean.getImg()%>'); background-size: cover; width: 100px; height: 100px;"></td>
    <td><%=bean.getName()%> <br> <br> Marca: <%=bean.getMarca()%><br> <br> Descrizione: 
    <%=bean.getDescription()%></td>
    <td><a href="product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
        <a href="product?action=addC&id=<%=bean.getCode()%>">Add to cart</a>
        </td>
</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="name">Name:</label><br> 
		<input name="name" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="marca">Marca:</label><br> 
		<input name="marca" type="text" maxlength="20" required placeholder="Metto sta cazzp e ,arca"><br> 
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="100" rows="3" required placeholder="enter description"></textarea><br>
		
		<label for="price">Price:</label><br> 
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantity:</label><br> 
		<input name="quantity" type="number" min="1" value="1" required><br>
		
		<label for="image">Image:</label><br> 
		<input name="image" type="text" maxlength="512" placeholder="percorso immagine"><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getName()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCode()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>