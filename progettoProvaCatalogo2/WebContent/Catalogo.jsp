<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"import="it.unisa.model.*" import="it.unisa.contol.*" %>

  

<!DOCTYPE html>
<html>
<head>
    <title>CatalogoOutletDream&Passion</title>
  <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
    <header>
    <img src="https://w7.pngwing.com/pngs/885/958/png-transparent-kynay-wear-s-l-factory-outlet-shop-clothing-discounts-and-allowances-sto-nino-logo-shopping-centre-sneakers.png" width="60" height="60">
        <h1>Outlet Dream&Passion</h1>
        <nav>
            <ul>
                <li><a href="product">Home</a></li>
                <li><a href="#">Offerte</a></li>
                <li><a href="#">Search</a></li>
               <align center=right> <li><a href="Cart.jsp" class = "cart">Il tuo carrello</a></li>
               <align center=right> <li><a href="Login.jsp" class = "login">Accedi</a></li></center>
               </align>
               </nav>
               </center>
            </ul>
            <br>
            <nav>
           <ul>
          <li><a href="Filtraggio?action=filtraggio&marca=Gucci"><img src="http://pluspng.com/img-png/gucci-logo-png-gucci-logo-png-transparent-background-download-1500.png" width="35" height="35"> </a></li>
<li><a href="Filtraggio?action=filtraggio&marca=Dior">Dior</a></li>

<li><a href="Filtraggio?action=filtraggio&marca=Nike">Nike</a></li>
			
       </ul> 
        
</nav>
</header>
<h2>Prodotti Presenti Nel Catalogo</h2>
    <table  align= "center">
     
        <thead>
            <tr>
                <th bgcolor="#21233d" style="color: white;">Immagine</th>
                <th bgcolor="#21233d" style="color: white;">descrizione</th>
                <th bgcolor="#21233d" style="color: white;">azioni</th>
             
            </tr>
        </thead>
        <tbody>
          
        <c:forEach var="product" items="${products}">
        
          <tr>
                    <td style="background-image: url('<c:out value="${product.img}" />'); background-size: cover; width: 100px; height: 100px;"></td>
                    <td><c:out value="${product.name}" /><br><c:out value="${product.marca}" /><br><c:out value="${product.description}" /><br>$<c:out value="${product.price}" /></td>
                    <td>
                        <a href="product?action=delete&id=<c:out value="${product.code}" />">Cancella Prodotto</a><br>
                        <a href="product?action=addC&id=<c:out value="${product.code}" />"><img src="https://tse2.mm.bing.net/th?id=OIP.sUo-4MlG7jLs7V6OJwGzFwHaCF&pid=Api&P=0&h=180" width="180" height="60"> </a>
                    </td>
                </tr>
          </c:forEach>
        </tbody>
    </table>
      

</body>
</html>