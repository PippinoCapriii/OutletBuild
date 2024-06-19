<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <title>Login</title>
</head>
<body>

    <%@ include file="./fragments/header.jsp" %>
    <%@ include file="./fragments/menu.jsp" %>
    
    <div id="main" class="clear">
        <h2>Login</h2>

        <form action="Login" method="post" id="myform">
            <c:if test="${param.action == 'error'}">
                <div class="tableRow">
                    <p></p>
                    <p class="error">Username o password errati!</p> 
                </div>
            </c:if>
            
            <c:if test="${param.action == 'checkout'}">
                <input type="hidden" name="checkout"/><br><br>
            </c:if>
                
            <div class="tableRow">
                <p>Username:</p>    
                <p><input type="text" name="un" required placeholder="inserisci username"/></p>        
            </div>
            <div class="tableRow">
                <p>Password:</p>
                <p><input type="password" name="pw" required placeholder="inserisci password"/></p>
            </div>
            <div class="tableRow">
                <p></p>
                <p><input type="submit" value="login"> &nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/Registrazione.jsp">non sei registrato?</a></p>        
            </div>
        </form>
    </div>
    
    <%@ include file="./fragments/footer.jsp" %>
    
</body>
</html>
