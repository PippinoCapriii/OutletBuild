<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="it.unisa.model.OrdineBean, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">

<title>Ordini</title>
</head>
<body>
	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	
	<div id="main" class="clear">
	
		<h2>ORDINI</h2>
		
	<div class="account">
		<form action="ordiniAdmin">
		
			<div class="tableRow">
				<p></p>
				<p class="heading">Cerca per data</p>
			</div>
				<input type = "hidden" name="action" value="data">
				<div class="tableRow">
					<p>Dal:</p>
					<p> <input type = "date" name="dal" required></p>
				</div>
				<div class="tableRow">
					<p>Al:</p>
					<p><input type="date" name="al" required></p>
				</div>
				<div class="tableRow">
					<p></p>
					<p><input type="submit" value="cerca"></p>
				</div>
				
			</form>
		</div>
			
		<div class="account">
			<form action="../ordiniAdmin">
			
			<div class="tableRow">
				<p></p>
				<p class="heading">Cerca per nominativo</p>
			</div>
				<input type = "hidden" name="action" value="nominativo">
				<div class="tableRow">
					<p>Nome:</p>
					<p><input type = "text" name="nome" required></p>
				</div>
				<div class="tableRow">
				<p>Cognome:</p>
				<p><input type = "text" name="cognome" required></p>
				</div>
				<div class="tableRow">	
					<p></p>
					<p><input type="submit" value="cerca"></p>
				</div>
		
			
		</form>
		</div>
			
		<c:choose>
			<c:when test="${not empty sessionScope.adminOrdini}">
				<table class="ordini">
					<tr>
						<th>Id</th>
						<th>Data</th>
						<th>Importo totale</th>
						<th></th>
					</tr>
					<c:forEach var="ordine" items="${sessionScope.adminOrdini}">
						<tr>
							<td>${ordine.idOrdine}</td>
							<td>${ordine.data}</td>
							<td>&euro;${ordine.importoTotale}</td>
							<td><a href="../Ordine?action=dettagliOrdine&id=${ordine.idOrdine}">dettagli</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h2>Non ci sono ordini</h2>
			</c:otherwise>
		</c:choose>
	
	</div>
	
	<%@ include file="../fragments/footer.jsp" %>
	
	
</body>
</html>
