package coreServlets;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 300L;
	
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index servlet deve caricare una lista di prodotti in sconto
		try {
			List<ProductBean> list = model.doRetrieveByDiscount(30, true);
			
			if (list.size()>10)
				request.setAttribute("list", list.subList(0, 10));
			else 
				request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		getServletContext().getRequestDispatcher("/ProductCard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
