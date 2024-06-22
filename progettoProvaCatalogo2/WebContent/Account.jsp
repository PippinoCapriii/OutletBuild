<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Account</title>
</head>
<body>

    <c:set var="us" value="${sessionScope.currentSessionUser}" />
    <c:set var="spedizione" value="${sessionScope.spedizione}" />
    <c:set var="pagamento" value="${sessionScope.pagamento}" />

    <jsp:include page="./fragments/header.jsp" />
    <jsp:include page="./fragments/menu.jsp" />
    
    <div id="main" class="clear">
        <div>
            <h2>Account</h2>
            <h3>Dati Personali</h3>
            <ul>
                <li>Nome: ${us.nome}</li>
                <li>Cognome: ${us.cognome}</li>
                <li>Email: ${us.email}</li>
            </ul>
        </div>
        
        <div class="account">
            <h3>Indirizzo di spedizione predefinito</h3>
            <c:choose>
                <c:when test="${spedizione == null}">
                    <form action="account" method="post" id="myform">
                        <input type="hidden" name="action" value="addS">
                        <input type="hidden" name="page" value="Account.jsp">
                        <div class="tableRow">
                            <p>Nome:</p>
                            <p><input type="text" name="nome" required/></p>
                        </div>
                        <div class="tableRow">
                            <p>Cognome:</p>
                            <p><input type="text" name="cognome" required/></p>
                        </div>
                        <div class="tableRow">
                            <p>telefono:</p>
                            <p><input type="text" name="tel" required/></p>
                        </div>
                        <div class="tableRow">
                            <p>Indirizzo:</p>
                            <p><input type="text" name="ind" required/></p>
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
                            <p><input type="text" name="città" required/></p>
                        </div>
                        <div class="tableRow">
                            <p></p>
                            <p><input type="submit" value="aggiungi"></p>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <ul>
                        <li>Nome: ${spedizione.nome}</li>
                        <li>Cognome: ${spedizione.cognome}</li>
                        <li>Telefono: ${spedizione.telefono}</li>
                        <li>Indirizzo: ${spedizione.indirizzo}</li>
                        <li>Cap: ${spedizione.cap}</li>
                        <li>Provincia: ${spedizione.provincia}</li>
                        <li>Città: ${spedizione.città}</li>
                        <li><a href="account?action=removeS"><button>Rimuovi</button></a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="account">
            <h3>Metodo di pagamento predefinito</h3>
            <c:choose>
                <c:when test="${pagamento == null}">
                    <form action="account" method="post" id="myform">
                        <input type="hidden" name="action" value="addP">
                        <input type="hidden" name="page" value="Account.jsp">
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
                            <p><input type="date" name="scad" required/></p>
                        </div>
                        <div class="tableRow">
                            <p></p>
                            <p><input type="submit" value="aggiungi"></p>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <ul>
                        <li>Titolare: ${pagamento.titolare}</li>
                        <li>Numero Carta: ${pagamento.numero}</li>
                        <li>Scadenza Carta: ${pagamento.scadenza}</li>
                        <li><a href="account?action=removeP"><button>Rimuovi</button></a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
        
    <jsp:include page="./fragments/footer.jsp" />
    
</body>
</html>
