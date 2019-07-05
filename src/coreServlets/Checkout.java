package coreServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coreModel.FatturaModel;
import coreModel.FatturaModelDM;
import coreModel.FatturaModelDS;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static boolean isDataSource = true;
	static FatturaModel model;
	
	static {
		if (isDataSource) {
			model = new FatturaModelDS();
		} else {
			model = new FatturaModelDM();
		}
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean isUser = (Boolean) request.getSession().getAttribute("isUser");
		
		if (isUser == null ? false : !isUser)
			return;
		
			
		
		try {
			@SuppressWarnings("unchecked")
			java.util.Map<Integer,beans.Adress> addresses = (java.util.Map<Integer,beans.Adress>) request.getSession().getAttribute("addresses");
			beans.Adress shipping = addresses.get(Integer.parseInt(request.getParameter("address")));
			beans.Cart cart = (beans.Cart) request.getSession().getAttribute("cart");
			beans.FatturaBean invoice = new beans.FatturaBean();
			
			if (!cart.isEmpty()) {
				invoice.setProdotti(cart.getOrders());
				invoice.setUser((beans.Registered)request.getSession().getAttribute("user"));
				invoice.setShipping(shipping);
			
				request.getSession().removeAttribute("cart");
				model.doSave(invoice);
				response.getWriter().write("Grazie per aver acquistato da noi");
			} 
			else 
				response.sendRedirect(response.encodeURL("error.jsp"));
				
			
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
