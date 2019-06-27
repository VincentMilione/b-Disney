package coreServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	static
	{
		if (isDataSource) {
			model = new RegisteredModelDS();
		} else {
			model = new RegisteredModelDM();
		}
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManager() {
        super();
        // TODO Auto-generated constructor stub
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
					
				}
			} catch (java.sql.SQLException e) {
			
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
