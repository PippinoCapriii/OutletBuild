<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" import="it.unisa.model.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="products" value="${sessionScope.products}" />
<c:if test="${empty products}">
	<c:redirect url="../catalogo?action=admin" />
</c:if>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
	<title>Gestione catalogo</title>
</head>

<body>

	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	
	<h2>GESTIONE CATALOGO</h2>
	
	<c:if test="${not empty products && products.size() > 0}">
		<table class="ordini">
			<tr>
				<th>Nome</th>
				<th>Marca</th>
				<th>Quantità</th>
				<th>Azione</th>
			</tr>
			<c:forEach var="bean" items="${products}">
				<tr>
					<td>${bean.nome}</td>
					<td>${bean.marca}</td>
					<td>${bean.quantità}</td>
					<td><a href="ModificaProdotto.jsp?prodotto=${bean.idProdotto}"><button>Modifica</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${empty products || products.size() == 0}">
		<h2>No products available</h2>
	</c:if>
	
	<br><br>
	
	<div class="center">
		<a href="AddProdotto.jsp"><button>Aggiungi prodotto</button></a>
	</div>
	
	</div>
	
	<%@ include file="../fragments/footer.jsp" %>
	
</body>
</html>
