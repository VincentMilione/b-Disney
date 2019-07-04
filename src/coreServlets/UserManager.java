package coreServlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import beans.ProductBean;
import coreModel.FatturaModel;
import coreModel.FatturaModelDM;
import coreModel.FatturaModelDS;
import coreModel.Paginator;
import coreModel.RegisteredModel;
import coreModel.RegisteredModelDM;
import coreModel.RegisteredModelDS;

/**
 * Servlet implementation class UserManager
 */
@WebServlet("/UserManager")
public class UserManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static boolean isDataSource = false;
	static RegisteredModel model;
	static FatturaModel fatt;
	static
	{
		if (isDataSource) {
			model = new RegisteredModelDS();
			fatt = new FatturaModelDS();
		} else {
			model = new RegisteredModelDM();
			fatt = new FatturaModelDM();
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManager() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private coreModel.Paginator<beans.FatturaBean>.Pair paginate (java.util.List <beans.FatturaBean> list, int pgNumber) {
    	coreModel.Paginator<beans.FatturaBean> pager = new coreModel.Paginator<beans.FatturaBean>(10, pgNumber);
		return pager.paginate(list);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * modifica password, modifica dell'email, operazioni su indirizzi, retrieval degli ordini
		 * */
		String op = request.getParameter("op");
		beans.Registered bean = (beans.Registered) request.getSession().getAttribute("user");
		
		if (bean != null)
			try {
				if("modCred".equalsIgnoreCase(op)) {
					String name = request.getParameter("nome") == null ? bean.getName() :  request.getParameter("nome"); 
					String surname = request.getParameter("cognome") == null ? bean.getCognome() : request.getParameter("cognome"); 
					String login = request.getParameter("login") == null ? bean.getLogin() : request.getParameter("login");
					String pass = request.getParameter("pass") == null ? bean.getPassword() : request.getParameter("pass");
					
					model.doModify(bean, name, surname, login, pass);
				} else if ("viewOrders".equalsIgnoreCase(op)) {
					
				} else if ("viewFatture".equalsIgnoreCase(op)) {
				
					if(request.getHeader("x-requested-with") == null) {
						coreModel.Paginator<beans.FatturaBean>.Pair obj = this.paginate(fatt.retrieveInvoices(bean, null, null), Integer.parseInt(request.getParameter("pg")));
						
						request.setAttribute("fatture", obj.pagedList);
						request.setAttribute("maxPg", obj.maxPg);
						request.getRequestDispatcher(response.encodeURL("OrdiniUtente.jsp")).forward(request, response);
					} else {
						response.setContentType("application/json");
						
						SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
						String par1 = request.getParameter("da");
						String par2 = request.getParameter("a");
						java.util.Date da = par1 == null ? null : format.parse(par1);
						java.util.Date a = par2 == null ? null : format.parse(par2);
						coreModel.Paginator<beans.FatturaBean>.Pair obj = this.paginate(fatt.retrieveInvoices(bean, da, a), Integer.parseInt(request.getParameter("pg")));
						JsonObject x = new JsonObject ();
											
						response.getWriter().write(new Gson().toJson());
					}
				}
		
			} catch (java.sql.SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
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
