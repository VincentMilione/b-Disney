package coreServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminCatalog
 */
@WebServlet("/AdminCatalog")
public class AdminCatalog extends CatalogServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(javax.servlet.ServletConfig config) throws ServletException {
		super.init(config);

		URL = "productAdminView.jsp";
		numEl = 45;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isAdmin = (Boolean) request.getSession().getAttribute("isAdmin");
		
		if(isAdmin)
			super.doGet(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
}
