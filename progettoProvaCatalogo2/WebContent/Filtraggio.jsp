<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="it.unisa.model.*, it.unisa.model.ProdottoBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<!DOCTYPE html>
<html>
<head>
    <title>Prodotti Filtrati</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="./fragments/header.jsp" %>
    <%@ include file="./fragments/menu.jsp" %>
    
    <c:choose>
        <c:when test="${not empty products}">
             <table  align= "center">
     
        <thead>
            <tr>
                <th bgcolor="#21233d" style="color: white;">Immagine</th>
                <th bgcolor="#21233d" style="color: white;">descrizione</th>
                <th bgcolor="#21233d" style="color: white;"></th>
             
            </tr>
        </thead>
        <tbody>
          
        <c:forEach var="product" items="${products}">
        
          <tr>
                    <td style="background-image: url('<c:out value="${product.immagine}" />'); background-size: cover; width: 100px; height: 100px;"></td>
                    <td><c:out value="${product.nome}" /><br><c:out value="${product.marca}" /><br><c:out value="${product.descrizione}" /><br>$<c:out value="${product.prezzo}" /><br><c:out value="${product.dataUscita}" /><br><c:out value="${product.descrizioneDettagliata}" /></td>
                    <td>
                        <a href="carrello?action=addC&id=<c:out value="${product.idProdotto}" />"><img src="https://tse2.mm.bing.net/th?id=OIP.sUo-4MlG7jLs7V6OJwGzFwHaCF&pid=Api&P=0&h=180" width="180" height="60"> </a>
                    </td>
                </tr>
          </c:forEach>
        </tbody>
    </table>
      
        </c:when>
        <c:otherwise>
            <p>Nessun prodotto trovato.</p>
        </c:otherwise>
    </c:choose>
   <br><br>
     <%@ include file="./fragments/footer.jsp" %>      
</body>
</html>