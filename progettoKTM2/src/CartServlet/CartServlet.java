package CartServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.model.Cart;
import it.unisa.model.ProductBean;

@WebServlet("/product")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action != null && action.equals("deleteC")) {
       
            String productId = request.getParameter("id");
            removeFromCart(request, productId);
     
            response.sendRedirect("./Cart.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action != null && action.equals("addC")) {
          
            String productId = request.getParameter("id");
            ProductBean product = getProductById(productId);
            addToCart(request, product);
            
            response.sendRedirect("./ProductPreview.jsp");
        }
    }


    private void addToCart(HttpServletRequest request, ProductBean product) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        cart.addProduct(product);
    }


    private void removeFromCart(HttpServletRequest request, String productId) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeProduct(productId);
        }
    }

    
    private ProductBean getProductById(String productId) {
       
        ProductBean product = new ProductBean();
        product.setCode(Integer.parseInt(productId));
        product.setName("Sample Product");
        return product;
    }
}
