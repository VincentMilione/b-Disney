package coreModel;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import beans.*;

public abstract class FatturaModel {
	
	private void setOrder (ResultSet rs, Order bean) throws SQLException{
		//fattura, prodotto, prezzoAp, quantita, ivaAp, scontoAp
		ProductBean item = new ProductBean ();
		
		item.setCode(rs.getInt("codice"));
		item.setName(rs.getString("nome"));
		item.setCategory(rs.getInt("categoria"));
		item.setDescription(rs.getString("descrizione"));
		item.setCharacter(rs.getString("personaggio"));
		item.setPhoto(rs.getString("foto"));
		item.setTipo(rs.getString("tipo"));
		item.setIva(rs.getDouble("ivaAp"));
		item.setDiscount(rs.getDouble("scontoAp"));
		item.setPrice(rs.getInt("prezzoAp"));
		
		bean.setProduct(item);
		bean.setQty(rs.getInt("qty"));
	}
	
	private String createInsertStatement(FatturaBean f) throws java.sql.SQLException {
		// TODO Auto-generated method stub
		String insertSQL = newFattura +"\n";
		java.util.List<Order> list = f.getProdotti();
		
		for (int i = 0; i < list.size(); i++)
			insertSQL = insertSQL +insertOrder + "\n";
		
		return insertSQL;
	}
	
	private void prepareStatement(PreparedStatement state, FatturaBean f) throws SQLException {
		// TODO Auto-generated method stub
		state.setString(1, f.getUser().getLogin());
		state.setDate(2, (Date) new java.util.Date());
		state.setInt(3, f.getShipping().getCodice());
		
		java.util.List<Order> list = f.getProdotti();
		int i = 4;
		
		for (Order o : list) {
			ProductBean bean = o.getProduct();
			
			state.setInt(i, f.getCod());
			state.setInt(i + 1, bean.getCode());
			state.setDouble(i + 2, bean.getPrice());
			state.setInt(i + 3, o.getQty());
			state.setDouble(i + 4, bean.getIva());
			state.setDouble(i + 6, bean.getDiscount());
		}
	}
	
	//codiceFattura, registrato, dataFattura, Indirizzo
	//fattura, prodotto, prezzoAp, quantita, ivaAp, scontoAp
	
	public void doSave (FatturaBean f) throws java.sql.SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(createInsertStatement(f));
			prepareStatement(preparedStatement, f);
			
			preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
	}

	public java.util.List<Order> retrieveOrders (Registered e, java.util.Date date, java.util.Date date2) throws java.sql.SQLException {
		Connection connection = null;
		SimpleDateFormat s = new SimpleDateFormat ("yyyy-MM-dd");
		String da = date != null ? s.format(date) : null;
		String a = date2 != null ? s.format(date2) : null;
		PreparedStatement preparedStatement = null;
		String selectSQL = da != null && a != null ? retrieveOrders + " AND dataFattura BETWEEN "+da +" AND " +a : da == null && a == null ? retrieveOrders: da == null && a!= null ? retrieveOrders +" AND dataFattura < " +a : retrieveOrders +" AND dataFattura > " +da;

		java.util.ArrayList<Order> products = new java.util.ArrayList<Order>();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL + " ORDER BY fattura");
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Order bean = new Order();
				
				setOrder(rs, bean);
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return products;
	}
	
	//"SELECT FROM * " +ORDER_TABLE +" WHERE fattura = ?";
	private java.util.List<Order> retrieveInvoiceOrders (int fattura, Connection connection) throws java.sql.SQLException {
		PreparedStatement preparedStatement = null;
		java.util.List<Order> list = new java.util.ArrayList<Order>();
		
		preparedStatement = connection.prepareStatement(retrieveInvoiceorders);
		preparedStatement.setInt(1, fattura);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		while (rs.next()) {
			Order o = new Order ();
			
			setOrder(rs, o);
			list.add(o);
		}
		
		return list;
	}
	
	public FatturaBean retrieveInvoice (Registered user, int code) throws java.sql.SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		FatturaBean f = new FatturaBean ();
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(retrieveInvoice);
			preparedStatement.setString(1, user.getLogin());
			preparedStatement.setInt(2, code);
			
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				java.util.GregorianCalendar cl = new java.util.GregorianCalendar();
				cl.setTime(rs.getDate("dataFattura"));
				
				f.setCod(rs.getInt("codiceFattura"));
				f.setProdotti(this.retrieveInvoiceOrders(f.getCod(), connection));
				f.setUser(user);
				f.setShipping(new AddressModelDS().doRetrieve(rs.getInt("Indirizzo")));
				f.setDate(cl);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return f;
	}
	
	public java.util.List<FatturaBean> retrieveInvoices (Registered e, java.util.Date date, java.util.Date date2) throws java.sql.SQLException {
		Connection connection = null;
		SimpleDateFormat s = new SimpleDateFormat ("yyyy-MM-dd");
		String da = date != null ? s.format(date) : null;
		String a = date2 != null ? s.format(date2) : null;
		PreparedStatement preparedStatement = null;
		String selectSQL = da != null && a != null ?  retrieveAllInvoices + " WHERE dataFattura BETWEEN "+da +" AND " +a : da == null && a == null ? retrieveAllInvoices: da == null && a!= null ? retrieveAllInvoices +" WHERE dataFattura < " +a : retrieveAllInvoices +" WHERE dataFattura > " +da;
		selectSQL = e == null ? selectSQL : da!=null || a!=null ? selectSQL +" AND registrato = " +e.getLogin() : selectSQL + " WHERE registrato = " +"'"+e.getLogin()+"'";
		
		java.util.List<FatturaBean> list = new java.util.ArrayList<FatturaBean> ();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				FatturaBean f = new FatturaBean();
				
				java.util.GregorianCalendar cl = new java.util.GregorianCalendar();
				cl.setTime(rs.getDate("dataFattura"));
				
				f.setCod(rs.getInt("codiceFattura"));
				f.setProdotti(this.retrieveInvoiceOrders(f.getCod(), connection));
				f.setShipping(new AddressModelDS().doRetrieve(rs.getInt("Indirizzo")));
				f.setDate(cl);
				f.setUser(e);
				
				list.add(f);
			}
		
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return list;
	}
	
	public List<FatturaBean> retrieveInvoices(java.util.Date date, java.util.Date date2) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		SimpleDateFormat s = new SimpleDateFormat ("yyyy-MM-dd");
		String da = date != null ? s.format(date) : null;
		String a = date2 != null ? s.format(date2) : null;
		PreparedStatement preparedStatement = null;
		String selectSQL = da != null && a != null ?  retrieveAllInvoicesUsers + " WHERE dataFattura BETWEEN "+da +" AND " +a : da == null && a == null ? retrieveAllInvoicesUsers: da == null && a!= null ? retrieveAllInvoicesUsers +" WHERE dataFattura < " +a : retrieveAllInvoicesUsers +" WHERE dataFattura > " +da;
		
		java.util.List<FatturaBean> list = new java.util.ArrayList<FatturaBean> ();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				FatturaBean f = new FatturaBean();
				Registered bean = new Registered ();
				
				java.util.GregorianCalendar cl = new java.util.GregorianCalendar();
				cl.setTime(rs.getDate("dataFattura"));
				
				RegisteredModel.setBean(rs, bean);
				f.setCod(rs.getInt("codiceFattura"));
				f.setProdotti(retrieveInvoiceOrders(f.getCod(), connection));
				f.setShipping(new AddressModelDS().doRetrieve(rs.getInt("Indirizzo")));
				f.setDate(cl);
				f.setUser(bean);
				
				list.add(f);
			}
		
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return list;
	}
	
	public abstract void closeConnection(Connection connector) throws SQLException;
	public abstract Connection getConnection () throws SQLException;
	
	private static final String ORDER_TABLE = "ordine";
	private static final String PROD_TABLE = "prodotto";
	private static final String FATT_TABLE = "fattura";
	private static final String newFattura = "INSERT INTO " +FATT_TABLE +" (registrato, dataFattura, Indirizzo) VALUES (?,?,?)";
	private static final String retrieveInvoice = "SELECT FROM * " +FATT_TABLE +" WHERE registrato = ? AND codiceFattura = ?";
	private static final String retrieveInvoiceorders = "SELECT * FROM " +ORDER_TABLE +" JOIN " +PROD_TABLE + " ON codice = prodotto  WHERE fattura = ?";
	private static final String retrieveAllInvoices = "SELECT * FROM " +FATT_TABLE;
	private static final String retrieveAllInvoicesUsers = "SELECT * FROM " +FATT_TABLE +" JOIN " +RegisteredModel.TABLE + " ON loginA = registrato ";
	private static final String insertOrder = "INSERT INTO "+ORDER_TABLE+" VALUES (?, ?, ?, ?, ?, ?)";
	private static final String retrieveOrders = "SELECT * FROM "+ORDER_TABLE +" JOIN " +PROD_TABLE + " ON codice = prodotto WHERE registrato = ?";
	
}
