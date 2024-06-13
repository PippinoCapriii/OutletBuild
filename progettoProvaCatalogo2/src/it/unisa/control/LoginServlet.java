package it.unisa.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import it.unisa.model.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ottieni i parametri dalla richiesta
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Chiama il metodo loginUser del UserService per autenticare l'utente
        String message = userService.loginUser(email, password);

        // Visualizza un messaggio di benvenuto o di errore
        if (message.startsWith("Benvenuto")) {
            // L'utente è autenticato, reindirizza alla home page o a una pagina di benvenuto
            response.sendRedirect("home.jsp");
        } else {
            // L'utente non è autenticato, mostra un messaggio di errore nella pagina di login
            request.setAttribute("message", message);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

