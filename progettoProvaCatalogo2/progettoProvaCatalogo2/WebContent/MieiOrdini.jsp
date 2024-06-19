<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.OrdineBean, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <title>I miei ordini</title>
</head>
<body>

    <%@ include file="../fragments/header.jsp" %>
    <%@ include file="./fragments/menu.jsp" %>
    
    <div id="main" class="clear">
    
    <h2>I Miei Ordini</h2>
    
    <c:if test="${not empty sessionScope.ordini && sessionScope.ordini.size() > 0}">
        <table class="ordini">
            <tr>
                <th>Id</th>
                <th>Importo totale</th>
                <th></th>
            </tr>
            
            <c:forEach var="bean" items="${sessionScope.ordini}">
                <tr>
                    <td>${bean.idOrdine}</td>
                    <td>&euro;${String.format('%.2f', bean.importoTotale)}</td>
                    <td><a href="Ordine?action=dettagliOrdine&id=${bean.idOrdine}">dettagli</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
    <c:if test="${empty sessionScope.ordini || sessionScope.ordini.size() == 0}">
        <h2>Non ci sono ordini</h2>
    </c:if>
    
    </div>
    
    <%@ include file="./fragments/footer.jsp" %>

</body>
</html>
