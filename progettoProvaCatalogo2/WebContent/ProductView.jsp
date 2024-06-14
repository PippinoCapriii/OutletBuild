<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  

<!DOCTYPE html>
<html>
<head>
    <title>CatalogoOutletDream&Passion</title>
  <link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
    <header>
    
        <h1>Outlet Dream&Passion</h1>
        <nav>
            <ul>
                <li><a href="product">Home</a></li>
                <li><a href="#">Offerte</a></li>
                <li><a href="#">Search</a></li>
                <li><a href="Cart.jsp" class = "cart"><img src="https://webstockreview.net/images/shopping-cart-icon-png-8.png"  width="35" height="35"></a></li>
                <li><a href="Login.jsp" class = "login"><img src="https://icon-library.com/images/login-icon-png/login-icon-png-19.jpg"  width="35" height="35"></a></li>
                <li><a href="Register.jsp" class = "Register"><img src="https://icon-library.com/images/login-icon-png/login-icon-png-19.jpg"  width="35" height="35"></a></li>
               </align>
               </nav>
               </center>
            </ul>
            <br>
            <nav>
           <ul>
          <li><a href="Filtraggio?marca=Gucci"><img src="http://pluspng.com/img-png/gucci-logo-png-gucci-logo-png-transparent-background-download-1500.png" width="35" height="35"> </a></li>
<li><a href="Filtraggio?marca=Dior">Dior</a></li>

<li><a href="Filtraggio?marca=Nike">Nike</a></li>
			
       </ul> 
        
</nav>
</header>
<br>
<br>


       <div class="classe1"> <img src="http://24.media.tumblr.com/ab8b710685a997d419eeb15d35d36b63/tumblr_mfqospIom61qbptbuo1_1280.gif"width="400" height="450" alt="Descrizione immagine" >
             <div class="text">
            <h2>scopri i nostri prodotti</h2>
            <br><br><br><br><br><br>
           <center>  outlet dream anda passion ci mette il cuore per portare nelle vostre case i migliori marchi ai migliori prezzi</center>
           <br><br>
             <center><a href="catalogo.jsp">dai un occhiata al nostro catalogo</a></center>
            </div>
        </div>
        <br><br>
        
        <div class="classe1">
             <div class="text">
            <h2>PRODOTTI SOTTO I 5O$</h2>
            <br><br><br><br><br><br>
           <center> dai un occhiata alla nostra collezione di articoli sotto i 50$, risparima sui soldi , ma non sullo stile</center>
           <br><br>
             <center><a href="catalogo.jsp">dai un occhiata al nostro catalogo</a></center>
            </div>
             <img src="https://www.flashfashion.it/s/cc_images/teaserbox_70981162.gif?t=1582393046"width="400" height="450" alt="Descrizione immagine" >
        </div>
    
    

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
      
       

    <h2>Inserisci i dati di un nuovo prodotto</h2>
    <form action="product" method="post">
        <input type="hidden" name="action" value="insert">

        <label for="name">Nome:</label><br>
        <input name="name" type="text" maxlength="20" required placeholder="Inserisci Nome"><br>

        <label for="marca">Marca:</label><br>
        <input name="marca" type="text" maxlength="20" required placeholder="Inserisci marca"><br>

        <label for="description">Descrizione:</label><br>
        <textarea name="description" maxlength="100" rows="3" required placeholder="Inserisci descrizione"></textarea><br>

        <label for="price">Prezzo:</label><br>
        <input name="price" type="number" min="0" value="0" required><br>

        <label for="quantity">Quantità:</label><br>
        <input name="quantity" type="number" min="1" value="1" required><br>

        <label for="image">Immagine:</label><br>
        <input name="image" type="text" maxlength="512" placeholder="percorso immagine"><br>

        <input type="submit" value="Aggiungi il prodotto"><input type="reset" value="Resetta i campi">
    </form>


    <br><br>
    <footer>Sito sviluppato da: Dream Team (Michele Di Meo, Fabrizio Cozzolino, Antonio Rapa)
        <br><br>Immagini date in gentile concessioni dai marchi in collaborazione quali: Gucci, Prada, Nike, Dior
    </footer>
</body>
</html>