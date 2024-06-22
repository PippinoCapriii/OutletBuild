package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import it.unisa.model.*;



@WebServlet("/Tipologia")
public class TipologiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
    static ProdottoDAOInterfaccia model = new ProdottoDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipologia = request.getParameter("abbigliamento");
 	    
		   ArrayList<ProdottoBean> filteredProducts = null;
			try {
				filteredProducts = model.doFilter(tipologia);
			} catch (SQLException e) {
				 System.out.println("Error:" + e.getMessage());
			}
		    
		     request.setAttribute("products", filteredProducts);
		        request.getRequestDispatcher("/Filtraggio.jsp").forward(request, response);
		  }
          
	}