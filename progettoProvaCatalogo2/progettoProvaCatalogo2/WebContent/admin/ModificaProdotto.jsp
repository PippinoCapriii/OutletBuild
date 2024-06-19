<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="id" value="${param.prodotto}" />
<c:set var="prodotti" value="${sessionScope.products}" />

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

        <c:forEach var="bean" items="${prodotti}" varStatus="loop">
            <c:if test="${bean.idProdotto eq id}">
                <form action="../catalogo" method="post" id="myform">
                    <input type="hidden" name="action" value="modifica">
                    <input type="hidden" name="page" value="admin/GestioneCatalogo.jsp">
                    <div class="tableRow">
                        <p>ID:</p>
                        <p><input type="text" name="id" value="${bean.idProdotto}" required></p>
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
                        <p><input type="text" name="iva" value="${bean.iva}" required></p>
                    </div>
                    <div class="tableRow">
                        <p>Prezzo:</p>
                        <p><input type="text" name="prezzo" value="${bean.prezzo}" required></p>
                    </div>
                    <div class="tableRow">
                        <p>Quantità:</p>
                        <p><input type="number" name="quantità" value="${bean.quantità}" required></p>
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
                        <p></p>
                        <p><input type="submit" value="modifica"></p>
                    </div>
                </form>
            </c:if>
        </c:forEach>

    </div>

    <%@ include file="../fragments/footer.jsp" %>

</body>
</html>
