<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="it.unisa.model.ProdottoBean, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <title>Catalogo</title>
</head>
<body>

    <%-- Include dei frammenti comuni --%>
    <%@ include file="../fragments/header.jsp" %>
    <%@ include file="../fragments/menu.jsp" %>

    <div id="main" class="clear">
        <h2>CATALOGO</h2>

        <c:if test="${empty products}">
            <h2>No products available</h2>
        </c:if>
        <c:forEach var="bean" items="${products}">
            <div class="item">
                <ul>
                    <li><a href="dettagli?id=${bean.idProdotto}"><img src="${bean.immagine}" height="130" width="130"></a></li>
                    <li>${bean.nome}</li>
                    <li>prezzo: &euro;${bean.prezzo}</li>
                    <a href="carrello?action=addC&id=<c:out value="${product.idProdotto}" />"><img src="https://tse2.mm.bing.net/th?id=OIP.sUo-4MlG7jLs7V6OJwGzFwHaCF&pid=Api&P=0&h=180" width="180" height="60"> </a>
                </ul>
            </div>
        </c:forEach>

    </div>
    
    <h2>Prodotti Presenti Nel Catalogo</h2>
    <table >
     
        <thead>
            <tr>
                <th bgcolor="#21233d" style="color: white;">Immagine</th>
                <th bgcolor="#21233d" style="color: white;">descrizione</th>
                <th bgcolor="#21233d" style="color: white;">azioni</th>
             
            </tr>
        </thead>
        <tbody>
          
        <c:forEach var="product" items="${product}">
        
          <tr>
                    <td style="background-image: url('<c:out value="${product.immagine}" />'); background-size: cover; width: 100px; height: 100px;"></td>
                    <td><c:out value="${product.nome}" /><br><c:out value="${product.marca}" /><br><c:out value="${product.descrizione}" /><br>$<c:out value="${product.prezzo}" /></td>
                    <td>
                        <a href="carrello?action=addC&id=<c:out value="${product.idProdotto}" />"><img src="https://tse2.mm.bing.net/th?id=OIP.sUo-4MlG7jLs7V6OJwGzFwHaCF&pid=Api&P=0&h=180" width="180" height="60"> </a>
                    </td>
                </tr>
          </c:forEach>
        </tbody>
    </table>
    

    <%-- Include del footer --%>
    <%@ include file="./fragments/footer.jsp" %>

</body>
</html>
