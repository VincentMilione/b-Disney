package coreServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import coreModel.RegisteredModelDM;
import coreModel.RegisteredModelDS;
import coreModel.UserModel;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static boolean isDataSource = false;
	static UserModel model;
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean paying = session.getAttribute("wasPaying") == null ? false : (Boolean) session.getAttribute("wasPaying");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String page = new String();

		try {
			UserBean user = model.login(username, password);
			session.setAttribute("user", user);
			session.setAttribute("isUser", new Boolean(true));
			session.removeAttribute("wasPaying");
			
			if (paying) {
				request.getRequestDispatcher("/Billing").forward(request, response);
				System.out.println("ciao");
				return;
			} else page = "index.jsp";
		} catch (SQLException e) {
			page = "error.jsp";
			e.printStackTrace();
		} catch (Exception e) {
			page = "Login.jsp";
			session.setAttribute("isUser", new Boolean(false));
		}
		
		response.sendRedirect(response.encodeURL(page));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
