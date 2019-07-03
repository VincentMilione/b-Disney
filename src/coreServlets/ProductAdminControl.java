package coreServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.ProductBean;
import coreModel.ProductModel;
import coreModel.ProductModelDM;
import coreModel.ProductModelDS;

/**
 * Servlet implementation class ProductAdminControl
 */
@WebServlet("/ProductAdminControl")
public class ProductAdminControl extends HttpServlet {
	private static final long serialVersionUID = 1000L;
    
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			model = new ProductModelDM();
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Boolean isAdmin = (Boolean) request.getSession().getAttribute("isAdmin");
		String action = request.getParameter("act");
		
		try {
			if (action != null && (isAdmin == null ? false : isAdmin)) {
					if (action.equalsIgnoreCase("delete")) {
						int id = Integer.parseInt(request.getParameter("id"));
						model.doDelete(id);
					} else if (action.equalsIgnoreCase("insert")) {
						
						//codice, nome, descrizione, prezzo, quantita, personaggio, foto, iva, sconto, tipo, categoria
						String name = request.getParameter("name");
						String description = request.getParameter("description");
						String personaggio = request.getParameter("personaggio");
						String url = request.getParameter("url");
						String tipo = request.getParameter("tipo");
						int categoria = Integer.parseInt(request.getParameter("categoria"));
						int quantity = Integer.parseInt(request.getParameter("qty"));
						double price = Double.parseDouble(request.getParameter("price"));
						double iva= Double.parseDouble(request.getParameter("iva"));
						double sconto= Double.parseDouble(request.getParameter("sconto"));
						
						ProductBean bean = new ProductBean(name, description,personaggio, url, tipo,categoria,quantity,price,iva,sconto);
						model.doSave(bean);
					} else if (action.equalsIgnoreCase("modify")) {
					
						ProductBean bean = new ProductBean ();
						bean.setCode(Integer.parseInt(request.getParameter("code")));
						bean.setIva(Integer.parseInt(request.getParameter("iva")));
						bean.setPrice(Integer.parseInt(request.getParameter("price")));
						bean.setDiscount(Integer.parseInt(request.getParameter("discount")));
						bean.setQty(Integer.parseInt(request.getParameter("qty")));
						
						
						model.doUpdate(bean);
					}
				}
			}
			catch (SQLException e) {
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
