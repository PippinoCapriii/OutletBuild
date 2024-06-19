<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Checkout</title>
</head>
<body>

    <%@ include file="./fragments/header.jsp" %>
    <%@ include file="./fragments/menu.jsp" %>
    
    <div id="main" class="clear">
        <h2>Checkout</h2>
        <form action="Checkout" method="post" id="myform">
            
            <c:choose>
                <c:when test="${not empty sessionScope.spedizione}">
                    <div class="tableRow">
                        <p class="heading">Dati spedizione:</p>
                    </div>
                    <div class="tableRow">
                        <p>Nome:</p>
                        <p><input type="text" name="nome" value="${sessionScope.spedizione.nome}" required/></p>
                    </div>    
                    <div class="tableRow">
                        <p>Cognome:</p>
                        <p><input type="text" name="cognome" value="${sessionScope.spedizione.cognome}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Telefono:</p>
                        <p><input type="text" name="tel" value="${sessionScope.spedizione.telefono}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Indirizzo:</p>
                        <p><input type="text"  name="ind" value="${sessionScope.spedizione.indirizzo}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Cap:</p>
                        <p><input type="text" name="cap" value="${sessionScope.spedizione.cap}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Provincia:</p>
                        <p><input type="text" name="prov" value="${sessionScope.spedizione.provincia}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Città:</p>
                        <p><input type="text" name="citta" value="${sessionScope.spedizione.citta}" required/></p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="tableRow">
                        <p class="heading">Dati spedizione:</p>
                    </div>
                    <div class="tableRow">
                        <p>Nome:</p>
                        <p><input type="text" name="nome" required/></p>
                    </div>    
                    <div class="tableRow">
                        <p>Cognome:</p>
                        <p><input type="text" name="cognome" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Telefono:</p>
                        <p><input type="text" name="tel" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Indirizzo:</p>
                        <p><input type="text"  name="ind" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Cap:</p>
                        <p><input type="text" name="cap" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Provincia:</p>
                        <p><input type="text" name="prov" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Città:</p>
                        <p><input type="text" name="citta" required/></p>
                    </div>
                </c:otherwise>
            </c:choose>
        
            <c:choose>
                <c:when test="${not empty sessionScope.pagamento}">
                    <div class="tableRow">
                        <p class="heading">Dati pagamento:</p>
                    </div>
                    <div class="tableRow">
                        <p>Titolare carta:</p>
                        <p><input type="text" name="tit" value="${sessionScope.pagamento.titolare}" required/></p>
                    </div>    
                    <div class="tableRow">
                        <p>Numero:</p>
                        <p><input type="text" name="numC" value="${sessionScope.pagamento.numero}" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Scadenza:</p>
                        <p><input type="date"  name="scad" value="${sessionScope.pagamento.scadenza}" required/></p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="tableRow">
                        <p class="heading">Dati pagamento:</p>
                    </div>
                    <div class="tableRow">
                        <p>Titolare carta:</p>
                        <p><input type="text" name="tit" required/></p>
                    </div>    
                    <div class="tableRow">
                        <p>Numero:</p>
                        <p><input type="text" name="numC" required/></p>
                    </div>
                    <div class="tableRow">
                        <p>Scadenza:</p>
                        <p><input type="date"  name="scad" required/></p>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <div class="tableRow">
                <p></p>
                <p><input type="submit" value="checkout"></p>
            </div>
        
        </form>
    </div>
    
    <%@ include file="./fragments/footer.jsp" %>
    
</body>
</html>
