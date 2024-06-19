package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                    bean.setQuantità(Integer.parseInt(request.getParameter("quantita")));  // Correzione qui
                    bean.setMarca(request.getParameter("marca"));
                    bean.setImmagine(request.getParameter("img"));
                    bean.setDescrizioneDettagliata(request.getParameter("descDett"));
                    
                    prodDao.doSave(bean);
                } else if(action.equalsIgnoreCase("modifica")) {
                    bean.setIdProdotto(Integer.parseInt(request.getParameter("id")));
                    bean.setNome(request.getParameter("nome"));
                    bean.setDescrizione(request.getParameter("descrizione"));
                    bean.setIva(request.getParameter("iva"));
                    bean.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                    bean.setQuantità(Integer.parseInt(request.getParameter("quantita")));  // Correzione qui
                    bean.setMarca(request.getParameter("marca"));
                    bean.setImmagine(request.getParameter("img"));
                    bean.setDescrizioneDettagliata(request.getParameter("descDett"));
                    
                    prodDao.doUpdate(bean);  // Assicurati di avere questo metodo
                }  else if (action.equalsIgnoreCase("read")) {
                	request.removeAttribute("products");
                    request.setAttribute("products", prodDao.doRetrieveAll());
                    request.getRequestDispatcher("/Catalogo.jsp").forward(request, response);
                }
            }
        }
            
         catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }
  }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
