<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"  import="it.unisa.model.*, it.unisa.model.ProductBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<% System.out.print("CIAONECIAONE"); %>

<!DOCTYPE html>
<html>
<head>
    <title>Prodotti Filtrati</title>
</head>
<body>
            <h1>Prodotti Gucci</h1>
    <c:choose>
        <c:when test="${not empty products}">
            <c:forEach var="product" items="${products}">
                <div class="product">
                   <img src="<c:out value='${product.img}' />" alt="<c:out value='${product.name}' />" />
                    <h2><c:out value="${product.name}" /></h2>
                    <p>Marca: <c:out value="${product.marca}" /></p>
                    <p>Prezzo: €<c:out value="${product.price}" /></p>
                    <p>Descrizione: <c:out value="${product.description}" /></p>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>Nessun prodotto trovato per questa marca.</p>
        </c:otherwise>
    </c:choose>
        
</body>
</html>