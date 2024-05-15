<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<h2>User Registration</h2>
<form action="register" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br>
    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="nome" required><br>
    <label for="cognome">Cognome:</label><br>
    <input type="text" id="cognome" name="cognome" required><br>
    <label for="indirizzo">Indirizzo:</label><br>
    <input type="text" id="indirizzo" name="indirizzo" required><br>
    <label for="citta">Città:</label><br>
    <input type="text" id="citta" name="citta" required><br>
    <label for="prov">Provincia:</label><br>
    <input type="text" id="prov" name="prov" required><br>
    <label for="cap">CAP:</label><br>
    <input type="text" id="cap" name="cap" required><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" value="Register">
</form>
</body>
</html>
