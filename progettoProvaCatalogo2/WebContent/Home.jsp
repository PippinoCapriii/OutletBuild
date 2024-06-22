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
            <h2>Cosa stai cercando?</h2>
            <br><br><br><br><br><br>
            <center>Scegli la tipologia dei prodotti che vuoi vedere.</center>
            <br><br>
            <h1>Seleziona un tipo di abbigliamento</h1>
    <form action="Tipologia" method="post">
        <label for="abbigliamento">Scegli:</label>
        <select id="abbigliamento" name="abbigliamento">
            <option value="t-shirt">T-shirt</option>
            <option value="felpa">Felpa</option>
            <option value="giacca">Giacca</option>
            <option value="pantalone">Pantalone</option>
            <option value="accessori">Accessori</option>
        </select>
        <br><br>
        <input type="submit" value="Invia">
    </form>
        </div>
        <img src="https://www.flashfashion.it/s/cc_images/teaserbox_70981162.gif?t=1582393046" width="400" height="450" alt="Descrizione immagine">
    </div>

    <%@ include file="./fragments/footer.jsp" %>
</body>
</html>
