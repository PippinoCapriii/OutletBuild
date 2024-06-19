<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Carrello</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="./fragments/header.jsp" %>
    <%@ include file="./fragments/menu.jsp" %>
    
    <div id="main" class="clear">
    
    <c:if test="${not empty sessionScope.cart}">
        <h2>CARRELLO</h2>
        <table>
            <tr>
                <th></th>
                <th>Nome</th>
                <th>Quantità</th>
                <th>Prezzo totale</th>
                <th></th>
            </tr>
            <c:forEach var="itemcart" items="${sessionScope.cart.prodotti}">
                <tr>
                    <td><img src="${itemcart.prodotto.immagine}" height="100" width="100"></td>
                    <td>${itemcart.prodotto.nome}</td>
                    <td>
                        <form action="carrello">
                            <input type="hidden" name="Id" value="${itemcart.id}">
                            <input type="hidden" name="page" value="Carrello.jsp">
                            <select name="qnt" id="qnt">
                                <c:forEach begin="1" end="${itemcart.prodotto.quantità}" varStatus="loop">
                                    <option value="${loop.index}" ${loop.index == itemcart.quantitàCarrello ? 'selected' : ''}>${loop.index}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="update">
                        </form>
                    </td>
                    <td><fmt:formatNumber value="${itemcart.totalPrice}" type="currency" currencySymbol="&euro;" /></td>
                    <td><a href="carrello?action=deleteC&id=${itemcart.id}&page=Carrello.jsp"><button>X</button></a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <span class="price">Totale provvisorio: <fmt:formatNumber value="${sessionScope.cart.calcolaCosto()}" type="currency" currencySymbol="&euro;" /></span>
        
        <div class="center">
            <c:choose>
                <c:when test="${not empty sessionScope.currentSessionUser}">
                    <a href="account?page=Checkout.jsp"><button>Acquista</button></a>
                </c:when>
                <c:otherwise>
                    <a href="Login.jsp?action=checkout"><button>Acquista</button></a>
                </c:otherwise>
            </c:choose>
        </div>
    
    </c:if>
    
    <c:if test="${empty sessionScope.cart}">
        <h2>Carrello vuoto</h2>
    </c:if>
    
    <br><br>
    </div>
    
    <%@ include file="./fragments/footer.jsp" %>
    
</body>
</html>
