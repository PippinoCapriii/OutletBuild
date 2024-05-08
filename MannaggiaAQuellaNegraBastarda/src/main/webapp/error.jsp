<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Errore</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Errore</h1>
    <p>Si è verificato un errore durante l'esecuzione della richiesta.</p>
    <p>Dettagli dell'errore:</p>
    <p><strong>Codice errore:</strong> <%= request.getAttribute("javax.servlet.error.status_code") %></p>
    <p><strong>Messaggio:</strong> <%= request.getAttribute("javax.servlet.error.message") %></p>
    <p>Torna alla <a href="/">pagina principale</a>.</p>
</div>
</body>
</html>
