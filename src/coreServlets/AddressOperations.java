package coreServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Adress;
import coreModel.AdressModel;
import coreModel.AddressModelDM;
import coreModel.AddressModelDS;

/**
 * Servlet implementation class AddressOperations
 */
@WebServlet("/AddressOperations")
public class AddressOperations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static boolean isDataSource = true;
	static AdressModel model;
	
	static {
		if (isDataSource) {
			model = new AddressModelDS();
		} else {
			model = new AddressModelDM();
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int op = Integer.parseInt(request.getParameter("operation"));
			beans.Registered user = (beans.Registered) request.getSession().getAttribute("user");
			java.util.Map<Integer,beans.Adress> ad = (java.util.Map<Integer,beans.Adress>)request.getSession().getAttribute("addresses");
			System.out.println(user);
			if (op == 0 && user != null) {
				//operazione di visualizzazione
				request.getSession().setAttribute("addresses", model.doRetrieveAll(user.getLogin()));
			} else if (op == 1 && user != null) {
				//operazione di inserimento
				Adress bean = new Adress ();
				
				bean.setCAP(Integer.parseInt(request.getParameter("cap")));
				bean.setCitta(request.getParameter("citta"));
				bean.setNation(request.getParameter("stato"));
				bean.setnCv(Integer.parseInt(request.getParameter("ncv")));
				bean.setProvince(request.getParameter("provincia"));
				bean.setStreet(request.getParameter("via"));
				bean.setCodice(model.doSave(bean, user));
				
				if (ad != null) {
					ad.put(bean.getCodice(), bean);
					request.getSession().setAttribute("addresses", ad);
				}
				if (request.getHeader("x-requested-with") != null) {
					response.setContentType("application/json");
					response.getWriter().write(new Gson().toJson(bean));
				}
			} else if (op == 2 && user != null) {
				//operazione di modifica
				Adress bean = new Adress ();
				
				bean.setCAP(Integer.parseInt(request.getParameter("cap")));
				bean.setCitta(request.getParameter("citta"));
				bean.setNation(request.getParameter("stato"));
				bean.setnCv(Integer.parseInt(request.getParameter("ncv")));
				bean.setProvince(request.getParameter("provincia"));
				bean.setStreet(request.getParameter("via"));
				
				model.doModify(Integer.parseInt(request.getParameter("code")), bean);
			} else if (op == 3 && user != null) {
				//operazione di cancellazione
				model.doDelete(Integer.parseInt(request.getParameter("code")));
			} 
		} catch (java.sql.SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			response.sendRedirect(response.encodeURL("error.jsp"));
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
