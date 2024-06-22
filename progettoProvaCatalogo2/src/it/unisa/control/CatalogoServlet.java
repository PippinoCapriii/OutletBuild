package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.file.Paths;
import javax.servlet.http.Part;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoDAO;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdottoDAO prodDao = new ProdottoDAO();
        ProdottoBean bean = new ProdottoBean();
        String sort = request.getParameter("sort");
        String action = request.getParameter("action");
        String redirectedPage = request.getParameter("page");

        try {
            if(action != null) {
                if(action.equalsIgnoreCase("add")) {
                    bean.setNome(request.getParameter("nome"));
                    bean.setDescrizione(request.getParameter("descrizione"));
                    bean.setIva(request.getParameter("iva"));
                    bean.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                    bean.setQuantità(Integer.parseInt(request.getParameter("quantita"))); // Correzione qui
                    bean.setMarca(request.getParameter("marca"));
                    bean.setDataUscita(request.getParameter("dataUscita"));
                    bean.setDescrizioneDettagliata(request.getParameter("descDett"));
                    bean.setImmagine(request.getParameter("img"));
                    
                    prodDao.doSave(bean);

                    request.getRequestDispatcher("catalogo?action=read").forward(request, response);
                } else if(action.equalsIgnoreCase("modifica")) {
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        bean.setIdProdotto(Integer.parseInt(idParam));
                    } else {
                        throw new ServletException("Il parametro 'id' è mancante o vuoto.");
                    }

                    bean.setNome(request.getParameter("nome"));
                    bean.setDescrizione(request.getParameter("descrizione"));
                    bean.setIva(request.getParameter("iva"));
                    bean.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                    bean.setQuantità(Integer.parseInt(request.getParameter("quantita"))); // Correzione qui
                    bean.setMarca(request.getParameter("marca"));
                    bean.setImmagine(request.getParameter("img"));
                    bean.setDataUscita(request.getParameter("dataUscita"));
                    bean.setDescrizioneDettagliata(request.getParameter("descDett"));

                    prodDao.doUpdate(bean); // Assicurati di avere questo metodo

                    response.sendRedirect(request.getContextPath() + "catalogo?action=read");
                } else if (action.equalsIgnoreCase("read")) {
                    request.removeAttribute("products");
                    request.setAttribute("products", prodDao.doRetrieveAll());
                    request.getRequestDispatcher("/Catalogo.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("gestione")) {
                    request.removeAttribute("products");
                    request.setAttribute("products", prodDao.doRetrieveAll());
                    request.getRequestDispatcher("/admin/GestioneCatalogo.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("modifica5")) {
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        int id = Integer.parseInt(idParam);
                        request.removeAttribute("products");
                        request.setAttribute("products", prodDao.doRetrieveByKey(id));
                        request.getRequestDispatcher("/admin/ModificaProdotto.jsp").forward(request, response);
                    } else {
                        throw new ServletException("Il parametro 'id' è mancante o vuoto.");
                    }
                } else if (action.equalsIgnoreCase("aggiungi")) {
                    request.removeAttribute("products");
                    request.setAttribute("products", prodDao.doRetrieveAll());
                    request.getRequestDispatcher("/admin/AddProdotto.jsp").forward(request, response);
                }
                else if (action.equalsIgnoreCase("delete")) { // Aggiungi questo blocco per l'eliminazione
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        int id = Integer.parseInt(idParam);
                        boolean isDeleted = prodDao.doDelete(id);
                        if (isDeleted) {
                            response.sendRedirect(request.getContextPath() + "/Home.jsp");
                        } else {
                            throw new ServletException("Errore nell'eliminazione del prodotto.");
                        }
                    } else {
                        throw new ServletException("Il parametro 'id' è mancante o vuoto.");
                    }

            }
        }} catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            throw new ServletException("Database error", e);
        } catch (NumberFormatException e) {
            System.out.println("Error:" + e.getMessage());
            throw new ServletException("Number format error", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
