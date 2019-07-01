package coreServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminManager
 */
@WebServlet("/admin")
public class AdminManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static coreModel.FatturaModel model;
    static boolean isDataSource = false;
    
    static
	{
		if (isDataSource) 
			model = new coreModel.FatturaModelDS();
		else 
			model = new coreModel.FatturaModelDM();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Boolean isAdmin = (Boolean) request.getSession().getAttribute("isAdmin");
		
		if (isAdmin != null ? isAdmin : true) {
			try {
				
				String login = request.getParameter("search");
				System.out.println(login);
				SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
				String par1 = request.getParameter("da");
				String par2 = request.getParameter("a");
			
				java.util.Date da = par1 == null || "".equals(par1) ? null : format.parse(par1);
				java.util.Date a = par2 == null || "".equals(par2) ? null : format.parse(par2);
				
				request.setAttribute("fatture", login == null ? model.retrieveInvoices(da, a) : model.retrieveInvoices(new coreModel.RegisteredModelDM().doRetrieveByKey(login), da, a));
				
				if (request.getHeader("x-requested-with") == null)
					getServletContext().getRequestDispatcher(response.encodeURL("/Ordini.jsp")).forward(request, response);
				else getServletContext().getRequestDispatcher(response.encodeURL("contentJSP/tableOrdersadmin.jsp")).forward(request, response);
			} catch (ParseException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
