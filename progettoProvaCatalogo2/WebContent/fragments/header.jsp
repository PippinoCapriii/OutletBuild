<%@ page language="java" pageEncoding="ISO-8859-1" import="it.unisa.model.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" charset="text/html; ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
</head>

<body>
    <header>
              
            <h1>Outlet DreamPassion</h1>
            
            <nav>
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="catalogo?action=read">Catalogo</a></li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.currentSessionUser}">
                            
                                <a href="${pageContext.request.contextPath}/Account.jsp">ACCOUNT</a>
                                
                                    <a href="${pageContext.request.contextPath}/Ordine?action=mieiOrdini">I MIEI ORDINI</a>
                                    <c:if test="${sessionScope.currentSessionUser.amministratore}">
                                        <a href="${pageContext.request.contextPath}/catalogo?action=gestione">GESTIONE CATALOGO</a>
                                        <a href="${pageContext.request.contextPath}/ordiniAdmin?action=ordini2">ORDINI</a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/Logout">LOGOUT</a>
                               
                           
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/Login.jsp"><img src="https://icon-library.com/images/login-icon-png/login-icon-png-19.jpg" width="35" height="35"></a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="${pageContext.request.contextPath}/Carrello.jsp"><img src="https://webstockreview.net/images/shopping-cart-icon-png-8.png" width="35" height="35"></a></li>
                </ul>
            </nav>
        
    </header>
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#searchbar").keyup(function(){
                var x = $("#searchbar").val();
                if(x != ""){
                    $.get("./RicercaProdotto", {"query": x}, function(data){
                        if(data != ""){
                            $(".risultati").empty();
                            $(".risultati").css({"display" : "block"});
                            $.each(data, function(i, item){
                                $(".risultati").append("<div id='item-r' class='item"+i+"'><img id='pic' width='65' height='65' src='" + item.immagine + "'/><p id='name'>" + item.nome + "</p></div>");
                                $(".item"+i).click(function(){
                                    $.get("./dettagli", {"id" : item.idProdotto}, function(){
                                        window.location = "./Dettagli.jsp";
                                    });
                                });
                            });
                        }
                    });
                } else {
                    $(".risultati").css({"display" : "none"});
                }
            });
        });
    </script>
</body>
</html>
