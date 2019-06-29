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
 * Servlet implementation class CatalogServlet
 */
@WebServlet("/CatalogServlet")
public abstract class CatalogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected String URL;
    protected int numEl;
    /**
     * @see HttpServlet#HttpServlet()
     */
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
	private boolean isEmptyString(String s) {
		return s == null || s.trim() == "";
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String category = request.getParameter("ctgy");
		String search = request.getParameter("srch");
		java.util.List<ProductBean> list = null;
		int pgNumber = Integer.parseInt(request.getParameter("pg"));
		int size = 0;
		
		try {
			int start = numEl * (pgNumber - 1);
			
			if (!isEmptyString(category) && isEmptyString(search)) {
				int ctgy = Integer.parseInt(category);
				list = model.doRetrieveByCategory(ctgy);
			}
			else if (isEmptyString(category) && !isEmptyString(search))
				list = model.doRetrieveBySearch(search);
			else {
				response.sendRedirect("error.jsp");
				return;
			}
			
			size = list.size();
			request.setAttribute("maxPg", (size/numEl) + 1);
			
			if(size > start && size - start > numEl)
				list = list.subList(start, start + numEl);
			else if(size > start && size - start <= numEl)
				list = list.subList(start, size - 1);
			else list = null;
		} catch (SQLException e) {
			response.sendRedirect("error.jsp");
			return;
		}
		
		if (request.getHeader("x-requested-with") == null) {
			//forward to the jsp
			response.setContentType("text/html");
			request.setAttribute("list", list);
			request.setAttribute("sizeInput", size);
			request.getRequestDispatcher(response.encodeURL(URL)).forward(request, response);
		}
		else {
			//send JSON FILE
			response.setContentType("application/json");
			beans.JSONProd parser = new beans.JSONProd (list);
			
			response.getWriter().write(parser.parse());
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
