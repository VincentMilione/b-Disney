package coreModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ProductBean;

public abstract class ProductModel {
	
	private void setBean (ResultSet rs, ProductBean item) throws SQLException {
		item.setCode(rs.getInt("codice"));
		item.setName(rs.getString("nome"));
		item.setCategory(rs.getInt("categoria"));
		item.setDescription(rs.getString("descrizione"));
		item.setCharacter(rs.getString("personaggio"));
		item.setPhoto(rs.getString("foto"));
		item.setTipo(rs.getString("tipo"));
		item.setIva(rs.getDouble("iva"));
		item.setDiscount(rs.getDouble("sconto"));
		item.setPrice(rs.getInt("prezzo"));
		item.setQty(rs.getInt("quantita"));
	}
	
	private void prepareInsertStatement (PreparedStatement preparedStatement, ProductBean item) throws SQLException {
		
		preparedStatement.setString(1, item.getName());
		preparedStatement.setString(2, item.getDescription());
		preparedStatement.setDouble(3, item.getPrice());
		preparedStatement.setInt(4, item.getQty());
		preparedStatement.setString(5, item.getCharacter());
		preparedStatement.setString(6, item.getPhoto());
		preparedStatement.setDouble(7, item.getIva());
		preparedStatement.setDouble(8, item.getDiscount());
		preparedStatement.setString(9, item.getTipo());
		preparedStatement.setInt(10, item.getCategory());
	
	}
	
	private void prepareUpdateStatement (PreparedStatement preparedStatement, ProductBean product) throws SQLException {
		prepareInsertStatement(preparedStatement, product);
		preparedStatement.setInt(11, product.getCode());
	}
	
	private void prepareSQLlist (PreparedStatement statement, int [] codes) throws SQLException {
		
		int size = codes.length;
		
		for (int i = 0; i < size; i++) {
			statement.setInt(i + 1, codes[i]);
		}
	}
	
	private String setSQLlistString (int size) {
		String SQLlist = selectAllSQL + " WHERE codice = ? ";
		
		for (int i = 0; i < size - 1; i++)
			SQLlist = SQLlist + "OR codice = ? ";
		
		return SQLlist;
	}

	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			prepareInsertStatement(preparedStatement, product);

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
	
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
				setBean(rs, bean);
				
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				closeConnection(connection);
			}
		}
		return bean;
	}

	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return (result != 0);
	}
	

	public synchronized java.util.List<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		java.util.ArrayList<ProductBean> products = new java.util.ArrayList<ProductBean>();

		String selectSQL = selectAllSQL;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				setBean(rs, bean);
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
	

	public synchronized java.util.List<ProductBean> doRetrieveByCategory(int ctgy) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		java.util.ArrayList<ProductBean> products = new java.util.ArrayList<ProductBean>();

		String selectSQL = categorySQL + order;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, ctgy);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				setBean(rs, bean);
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

	public synchronized java.util.List<ProductBean> doRetrieveBySearch(String search) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		java.util.ArrayList<ProductBean> products = new java.util.ArrayList<ProductBean>();

		String selectSQL = searchSQL + order;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, search);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				setBean(rs, bean);
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
	
	public synchronized List<ProductBean> doRetrieveByDiscount(double amount) throws Exception {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<ProductBean> list = new ArrayList<ProductBean>();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectDiscountSQL);
			preparedStatement.setDouble(1, amount);

			ResultSet result = preparedStatement.executeQuery();

			while (result.next())
			{	
				int qty = result.getInt("quantita");
				
				if (qty > 0)
				{
					ProductBean bean = new ProductBean();
					setBean(result, bean);
					list.add(bean);
				}
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
	
	public synchronized boolean doUpdate(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			prepareUpdateStatement(preparedStatement, product);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return (result != 0);
	}

	public synchronized List<ProductBean> doRetrieveList(int[] codes) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String query = setSQLlistString(codes.length);
		java.util.List <ProductBean> list = new java.util.ArrayList <ProductBean> ();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			prepareSQLlist(preparedStatement, codes);
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean ();
				setBean(rs, bean);
				list.add(bean);
				System.out.println();
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

	
	protected abstract void closeConnection(Connection connector) throws SQLException;
	protected abstract Connection getConnection () throws SQLException;

	protected static final String TABLE_NAME = "prodotto";
	protected static final String selectSQL = "SELECT * FROM " +TABLE_NAME + " WHERE codice = ?";
	protected static final String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
	protected static final String selectDiscountSQL = "SELECT * FROM store.prodotto WHERE sconto >= ?";
	protected static final String deleteSQL = "DELETE FROM "+TABLE_NAME+" WHERE CODE = ?";
	protected static final String insertSQL = "INSERT INTO " + TABLE_NAME
			+ "(nome, descrizione, prezzo, quantita, personaggio, foto, iva, sconto, tipo, categoria)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	protected static final String updateSQL = "UPDATE prodotto SET "
			+ "nome = ?, descrizione = ?, prezzo = ?, quantita = ?, personaggio = ?, foto = ?, iva = ?, sconto = ?, tipo = ?, "
			+ "categoria = ? WHERE codice = ?";
	protected static final String searchSQL = "SELECT * FROM "+TABLE_NAME+ " WHERE nome LIKE %?% or descrizione LIKE %?%";
	protected static final String categorySQL = "SELECT * FROM "+TABLE_NAME+ " WHERE categoria = ?";
	protected static final String order = " ORDER BY nome";
}
