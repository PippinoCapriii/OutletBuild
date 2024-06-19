<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="it.unisa.model.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Home</title>
</head>

<body>
    <%@ include file="./fragments/header.jsp" %>
	<%@ include file="./fragments/menu.jsp" %>

    <div class="classe1">
        <img src="http://24.media.tumblr.com/ab8b710685a997d419eeb15d35d36b63/tumblr_mfqospIom61qbptbuo1_1280.gif" width="400" height="450" alt="Descrizione immagine">
        <div class="text">
            <h2>Scopri i nostri prodotti</h2>
            <br><br><br><br><br><br>
            <center>Outlet DreamPassion ci mette il cuore per portare nelle vostre case i migliori marchi ai migliori prezzi.</center>
            <br><br>
            <center><a href="catalogo?action=read">dai un occhiata al nostro catalogo</a></center>

        </div>
    </div>
    <br><br>

    <div class="classe1">
        <div class="text">
            <h2>Prodotti sotto i 50$</h2>
            <br><br><br><br><br><br>
            <center>Dai un'occhiata alla nostra collezione di articoli sotto i 50$, risparmia sui soldi, ma non sullo stile.</center>
            <br><br>
            <center><a href="catalogo?action=read">dai un occhiata al nostro catalogo</a></center>
        </div>
        <img src="https://www.flashfashion.it/s/cc_images/teaserbox_70981162.gif?t=1582393046" width="400" height="450" alt="Descrizione immagine">
    </div>

    <%@ include file="./fragments/footer.jsp" %>
</body>
</html>
