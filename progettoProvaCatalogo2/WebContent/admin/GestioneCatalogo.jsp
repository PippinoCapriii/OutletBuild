<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="it.unisa.model.ProdottoBean, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Gestione Catalogo</title>
</head>
<body>

    <%-- Include dei frammenti comuni --%>
    <%@ include file="../fragments/header.jsp" %>
    <%@ include file="../fragments/menu.jsp" %>

    <h2>Prodotti Presenti Nel Catalogo</h2>
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
                    <td><a href="catalogo?action=modifica5&id=<c:out value="${product.idProdotto}" />"><button>Modifica</button></a>
                        <a href="catalogo?action=delete&id=<c:out value="${product.idProdotto}" />"><button>Rimuovi</button></a> </td>
                </tr>
          </c:forEach>
        </tbody>
    </table>
    <a href="catalogo?action=aggiungi"><button>Aggiungi prodotto</button></a>
    </c:when>
        <c:otherwise>
            <p>Nessun prodotto trovato nel catalogo</p>
        </c:otherwise>
    </c:choose>
   
    <%-- Include del footer --%>
    <%@ include file="../fragments/footer.jsp" %>

</body>
</html>
