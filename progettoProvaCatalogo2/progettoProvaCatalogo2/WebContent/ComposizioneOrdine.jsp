<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="it.unisa.model.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="prodotti" value="${sessionScope.products}" />
<c:if test="${empty prodotti}">
	<c:redirect url="./catalogo?page=ComposizioneOrdine.jsp" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<title>Dettagli ordine</title>
</head>
<body>
	<%@ include file="./fragments/header.jsp" %>
	<%@ include file="./fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	
		<c:if test="${not empty sessionScope.composizione}">
			<h2> ORDINE #${sessionScope.composizione[0].idOrdine}</h2>
			<table class="ordini">
				<tr>
					<th>Prodotto</th>
					<th>Quantità</th>
					<th>Prezzo Unitario</th>
					<th>Prezzo totale</th>
					<th>Iva</th>
				</tr>
				<c:forEach var="comp" items="${sessionScope.composizione}">
					<c:set var="nomeP" value="" />
					<c:set var="prezzoUnitario" value="0" />
					<c:forEach var="p" items="${prodotti}">
						<c:if test="${p.idProdotto eq comp.idProdotto}">
							<c:set var="nomeP" value="${p.nome}" />
							<c:set var="prezzoUnitario" value="${p.prezzo}" />
						</c:if>
					</c:forEach>
					<tr>
						<td>${nomeP}</td>
						<td>${comp.quantità}</td>
						<td>&euro;${prezzoUnitario}</td>
						<td>&euro;${String.format('%.2f', comp.prezzoTotale)}</td>
						<td>${comp.iva}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
	</div>
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>
