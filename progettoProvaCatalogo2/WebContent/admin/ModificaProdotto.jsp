<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.ProductBean, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<title>Modifica prodotto</title>
</head>
<body>

	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	
	<div id="main" class="clear">
	
		<h2>MODIFICA PRODOTTO</h2>
		
	<% int id = Integer.parseInt(request.getParameter("prodotto"));
		ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) request.getSession().getAttribute("products");
		ProductBean bean = null;
	for(ProductBean prodotto : prodotti){
		if(prodotto.getIdProdotto() == id){
			bean = prodotto;} 
			}%>
	
	<form action="../catalogo" method="post" id="myform">
		<input type="hidden" name="action" value="modifica">
		<input type="hidden" name="page" value="admin/GestioneCatalogo.jsp">
		<div class="tableRow">
			<p>ID:</p>
			<p><input type="text" name="id" value="<%=bean.getIdProdotto() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Nome:</p>
			<p><input type="text" name="nome" value="<%=bean.getNome() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Descrizione:</p>
			<p><input type="text" name="descrizione" value="<%=bean.getDescrizione() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Iva:</p>
			<p><input type="text" name="iva" value="<%=bean.getIva() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Prezzo:</p>
			<p><input type="text" name="prezzo" value="<%=bean.getPrezzo() %>" required></p>
		</div>		
		<div class="tableRow">
			<p>Quantità:</p>
			<p><input type="number" name="quantità" value="<%=bean.getQuantità() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Immagine:</p>
			<p><input type="text" name="img" value="<%=bean.getImmagine() %>" required></p>
		</div>
		<div class="tableRow">
			<p>Marca:</p>
			<p><input type="text" name="marca" value="<%=bean.getMarca() %>" required></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p><input type="submit" value="modifica"></p>
		</div>
	</form>
	
		</div>
	

	<%@ include file="../fragments/footer.jsp" %>

</body>
</html>