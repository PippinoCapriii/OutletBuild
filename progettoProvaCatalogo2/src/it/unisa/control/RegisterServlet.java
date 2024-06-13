package it.unisa.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import it.unisa.model.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ottieni i parametri dalla richiesta
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String indirizzo = request.getParameter("indirizzo");
        String citta = request.getParameter("citta");
        String prov = request.getParameter("prov");
        String cap = request.getParameter("cap");
        String password = request.getParameter("password");

        // Crea un oggetto User con i dati della richiesta
        User user = new User(email, nome, cognome, indirizzo, citta, prov, cap, password);

        // Chiama il metodo registerUser del UserService per registrare l'utente
        String message = userService.registerUser(user);

        // Visualizza un messaggio di conferma o di errore
        request.setAttribute("message", message);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
