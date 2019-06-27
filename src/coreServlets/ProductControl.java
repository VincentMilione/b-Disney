package coreServlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cart;
import beans.Order;
import beans.ProductBean;
import coreModel.*;
/**
 * Servlet implementation class ProductControl
 */
@WebServlet("/ProductControl")

/*
 * Il filtro prender√? i prodotti per categoria, nome, prezzo
 * */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) 
			model = new ProductModelDS();
		 else 
			model = new ProductModelDM();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("act");
		
		try {
			if (action != null) {
					Cart cart = (Cart)request.getSession().getAttribute("cart");
					
					if(cart == null) {
						cart = new Cart();
						request.getSession().setAttribute("cart", cart);
					}
					
					if (action.equalsIgnoreCase("addC")) {
						int id = Integer.parseInt(request.getParameter("id"));
						int qty = Integer.parseInt(request.getParameter("qty"));
						ProductBean bean = model.doRetrieveByKey(id);
						Order orderBean = new Order (bean, qty);
						
						cart.addOrder(orderBean);
						
						if (request.getHeader("x-requested-with") == null) {
							response.setContentType("text/html");
							response.sendRedirect(response.encodeURL("carrello.jsp"));
						}
					} else if (action.equalsIgnoreCase("view")) {
						//visualizzazione del prodotto lato client
						int id = Integer.parseInt(request.getParameter("id"));
						ProductBean bean = 	model.doRetrieveByKey(id);
		
						if (bean != null) {
							request.setAttribute("product", bean);
							request.getRequestDispatcher(response.encodeURL("RecenzioneServlet?act=view")).include(request, response);
							System.out.println(request.getAttribute("recenzioni"));
							request.getRequestDispatcher(response.encodeURL("/productView.jsp")).forward(request, response);
						}
						else response.sendRedirect("/error.jsp");
					} else if (action.equalsIgnoreCase("delete")) {
						//elimina dal carrello
						int id = Integer.parseInt(request.getParameter("id"));
						cart.deleteProduct(id);
					}
			}			
		} catch (SQLException e) {
			response.sendRedirect("error.jsp");
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
