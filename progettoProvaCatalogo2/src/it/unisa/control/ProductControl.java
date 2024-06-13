package it.unisa.control;

import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModel;
import it.unisa.model.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductControl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  static ProductModel model = (ProductModel)new ProductModelDS();
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	  System.out.println("PROBLEMONI");
	  
	  String action = request.getParameter("action");
	  String marca = request.getParameter("marca");
	  
      if(action != null && action.equals("delete")) {
          
          String productId = request.getParameter("id");
          Cart cart = (Cart) request.getSession().getAttribute("cart");
          if(cart != null) {
              cart.removeProduct(request, productId);
          }
  
          response.sendRedirect("./Cart.jsp");
      }
    try {
      if (action != null)
    	  if (action.equalsIgnoreCase("addC")) {
              int id = Integer.parseInt(request.getParameter("id"));
              cart.addProduct(model.doRetrieveByKey(id));
              
            } else if (action.equalsIgnoreCase("deleteC")) {
              int id = Integer.parseInt(request.getParameter("id"));
              cart.deleteProduct(model.doRetrieveByKey(id));
              
            } else if (action.equalsIgnoreCase("read")) {
              int id = Integer.parseInt(request.getParameter("id"));
              request.removeAttribute("product");
              request.setAttribute("product", model.doRetrieveByKey(id));
              
            } else if (action.equalsIgnoreCase("delete")) {
              int id = Integer.parseInt(request.getParameter("id"));
              model.doDelete(id);
            }  
         
        	    
      
        else if (action.equalsIgnoreCase("insert")) {
          String name = request.getParameter("name");
          String description = request.getParameter("description");
          int price = Integer.parseInt(request.getParameter("price"));
          int quantity = Integer.parseInt(request.getParameter("quantity"));
          String marca = request.getParameter("marca");
          String img = request.getParameter("image");
          ProductBean bean = new ProductBean();
          bean.setName(name);
          bean.setDescription(description);
          bean.setPrice(price);
          bean.setQuantity(quantity);
          bean.setMarca(marca);
          bean.setImg(img);
          model.doSave(bean);
        }  
    } catch (SQLException e) {
      System.out.println("Error:" + e.getMessage());
    } 
    request.getSession().setAttribute("cart", cart);
    request.setAttribute("cart", cart);
    
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
    dispatcher.forward((ServletRequest)request, (ServletResponse)response);
    
  }
 


  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}