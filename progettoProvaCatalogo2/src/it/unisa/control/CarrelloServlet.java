package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Carrello;
import it.unisa.model.ItemCarrello;
import it.unisa.model.ProdottoDAO;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdottoDAO prodDao = new ProdottoDAO();
        Carrello cart = (Carrello) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Carrello();
            request.getSession().setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String quantit‡ = request.getParameter("qnt");
        String redirectedPage = request.getParameter("page");

        try {
            if (action != null) {
                String idParam = request.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        int id = Integer.parseInt(idParam);
                        if (action.equalsIgnoreCase("addC")) {
                            cart.addProdotto(prodDao.doRetrieveByKey(id));
                            // Forward alla pagina desiderata
                            request.getRequestDispatcher("catalogo?action=read").forward(request, response);
                            return; // Interrompi l'esecuzione dopo il forward
                        } else if (action.equalsIgnoreCase("deleteC")) {
                            cart.deleteProdotto(prodDao.doRetrieveByKey(id));
                        }
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del prodotto non valido: " + idParam);
                        return;
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del prodotto mancante o non valido");
                    return;
                }
            }

            if (quantit‡ != null && !quantit‡.isEmpty()) {
                String idParam = request.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        int id = Integer.parseInt(idParam);
                        ItemCarrello item = cart.getItem(id);
                        item.setQuantit‡Carrello(Integer.parseInt(quantit‡));
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quantit‡ non valida: " + quantit‡);
                        return;
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del prodotto mancante o non valido");
                    return;
                }
            }

        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del database: " + e.getMessage());
            return;
        }

        request.getSession().setAttribute("cart", cart);
        request.setAttribute("cart", cart);

        // Assicurati che redirectedPage non sia null o vuota
        if (redirectedPage == null || redirectedPage.isEmpty()) {
            redirectedPage = "index.jsp"; // Pagina di default se redirectedPage non Ë impostata
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/" + redirectedPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Gestione delle richieste POST tramite doGet
    }
}
