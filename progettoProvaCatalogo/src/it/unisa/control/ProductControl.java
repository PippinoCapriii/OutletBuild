package it.unisa.control;

import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDS;
import java.io.IOException;
import java.sql.SQLException;
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
	  String action = request.getParameter("action");
      
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
        	else if (action.equalsIgnoreCase("filtra")) {
        	    String marca = request.getParameter("marca");
        	    System.out.println(marca);
        	    try {
        	        Collection<ProductBean> products = null;
        	        if (marca != null && !marca.isEmpty()) {
        	            products = model.filtra(marca);
        	        }
        	        request.setAttribute("products", products);
        	        request.getRequestDispatcher("/WEB-INF/ProductView.jsp").forward(request, response);
        	    } catch (SQLException e) {
        	        e.printStackTrace();
        	        response.sendRedirect(request.getContextPath() + "/error.jsp");
        	    }
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
          bean.setCount(1);
          model.doSave(bean);
        }  
    } catch (SQLException e) {
      System.out.println("Error:" + e.getMessage());
    } 
    request.getSession().setAttribute("cart", cart);
    request.setAttribute("cart", cart);
    String marca = request.getParameter("marca");
    try {
      request.removeAttribute("products");
      request.setAttribute("products", model.filtra(marca));
    } catch (SQLException e) {
      System.out.println("Error:" + e.getMessage());
    } 
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
    dispatcher.forward((ServletRequest)request, (ServletResponse)response);
  }
 


  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}