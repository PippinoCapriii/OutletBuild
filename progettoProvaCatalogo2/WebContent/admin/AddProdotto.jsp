<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Aggiungi prodotto</title>
</head>
<body>

    <c:import url="../fragments/header.jsp" />
    <c:import url="../fragments/menu.jsp" />
    
    <div id="main" class="clear">
    
        <h2>AGGIUNGI PRODOTTO</h2>

    <form action="catalogo" method="post" id="myform">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="page" value="Home.jsp"><br><br>
        <div class="tableRow">
            <p>Nome:</p>
            <p><input type="text" name="nome" value="" required></p>
        </div>
        <div class="tableRow">
            <p>Descrizione:</p>
            <p><input type="text" name="descrizione" value="" required></p>
        </div>
        <div class="tableRow">
            <p>Iva:</p>
            <p><input type="number" step="0.01" name="iva" value="" required></p>
        </div>
        <div class="tableRow">
            <p>Prezzo:</p>
            <p><input type="number" step="0.01" name="prezzo" value="" required></p>
        </div>        
        <div class="tableRow">
            <p>Data:</p>
            <p><input type="date" name="dataUscita" value="" required></p>
        </div>
        <div class="tableRow">
            <p>Quantità:</p>
            <p><input type="number" name="quantita" value="" required></p>
        </div>
        <div class="tableRow">
            <p>Immagine:</p>
            <p><input type="text" name="img" required></p>
        </div>
        <div class="tableRow">
            <p>Marca:</p>
            <p><input type="text" name="marca" value="" required></p>
        </div>    
        <div class="tableRow">
            <p>Descrizione dettagliata:</p>
            <p><input type="text" name="descDett" value=""></p>
        </div>
        <div class="tableRow">
            <p></p>
            <p><input type="submit" value="aggiungi"></p>
        </div>
     </form>
     </div>    

    <c:import url="../fragments/footer.jsp" />

</body>
</html>
