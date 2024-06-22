<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8" import="it.unisa.model.ProdottoBean, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Modifica prodotto</title>
</head>
<body>

<c:import url="../fragments/header.jsp" />
<c:import url="../fragments/menu.jsp" />

<div id="main" class="clear">
    <h2>MODIFICA PRODOTTO</h2>

   <c:set var="bean" value="${requestScope.products}" />
		

    <form action="catalogo" method="post" id="myform">
        <input type="hidden" name="action" value="modifica">
        <input type="hidden" name="page" value="Home.jsp">
        <div class="tableRow">
            <p>ID:</p>
            <p><input type="number" name="id" value="${bean.idProdotto}" required></p>
        </div>
        <div class="tableRow">
            <p>Nome:</p>
            <p><input type="text" name="nome" value="${bean.nome}" required></p>
        </div>
        <div class="tableRow">
            <p>Descrizione:</p>
            <p><input type="text" name="descrizione" value="${bean.descrizione}" required></p>
        </div>
        <div class="tableRow">
            <p>Iva:</p>
            <p><input type="text" step="0.01" name="iva" value="${bean.iva}" required></p>
        </div>
        <div class="tableRow">
            <p>Prezzo:</p>
            <p><input type="text" step="0.01" name="prezzo" value="${bean.prezzo}" required></p>
        </div>      
        <div class="tableRow">
            <p>Data:</p>
            <p><input type="date" name="dataUscita" value="${bean.dataUscita}" required></p>
        </div>
        <div class="tableRow">
            <p>Quantità:</p>
            <p><input type="number" name="quantita" value="${bean.quantità}" required></p>
        </div>
        <div class="tableRow">
            <p>Immagine:</p>
            <p><input type="text" name="img" value="${bean.immagine}" required></p>
        </div>
        <div class="tableRow">
            <p>Marca:</p>
            <p><input type="text" name="marca" value="${bean.marca}" required></p>
        </div>
        <div class="tableRow">	
		<p>Descrizione dettagliata:</p>
		<p><input type="text" name="descDett" value="${bean.descrizioneDettagliata}"></p>
	</div>
        <div class="tableRow">
            <p></p>
            <p><input type="submit" value="modifica"></p>
        </div>
    </form>
</div>

<c:import url="../fragments/footer.jsp" />
</body>
</html>