package coreModels.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import coreModels.beans.RecenzioneBean;

public abstract class RecenzioneModel {

	public synchronized double mediumVote (coreModels.beans.ProductBean e) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		double vote = 0;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(voto);
			preparedStatement.setInt(1, e.getCode());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next())
				vote = rs.getDouble(1);
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					closeConnection(connection);
			}
		}
		return vote;
	}
	
	public synchronized RecenzioneBean userComment (coreModels.beans.Registered e, coreModels.beans.ProductBean p) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		RecenzioneBean bean = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(verify);
			preparedStatement.setString(1, e.getLogin());
			preparedStatement.setInt(2, p.getCode());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				bean = new RecenzioneBean();
				
				bean.setName(rs.getString("cognome") +" " +rs.getString("nome"));
				bean.setDescription(rs.getString("descrizioneRecenzione"));
				bean.setValutazione(rs.getFloat("valutazione"));
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
		return bean;
	}
	
	public synchronized java.util.List<RecenzioneBean> getComments (coreModels.beans.ProductBean e) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		java.util.ArrayList<RecenzioneBean> comments = new java.util.ArrayList<RecenzioneBean>();

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, e.getCode());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				RecenzioneBean bean = new RecenzioneBean ();
				
				bean.setName(rs.getString("cognome") +" " +rs.getString("nome"));
				bean.setDescription(rs.getString("descrizioneRecenzione"));
				bean.setValutazione(rs.getFloat("valutazione"));
				comments.add(bean);
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
		return comments;
	}
	
	//prodottoR, utente, descrizioneRecenzione, valutazione
	public synchronized void newComment (coreModels.beans.Registered e, coreModels.beans.ProductBean p, String comment, float valutation) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, p.getCode());
			preparedStatement.setString(2, e.getLogin());
			preparedStatement.setString(3, comment);
			preparedStatement.setFloat(4, valutation);

			preparedStatement.executeUpdate();

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
	
	protected abstract void closeConnection(Connection connector) throws SQLException;
	protected abstract Connection getConnection () throws SQLException;
	
	private static final String voto = "SELECT AVG(valutazione) FROM recenzione WHERE prodottoR = ?";
	private static final String insertSQL = "INSERT INTO recenzione values (?, ?, ?, ?)";
	private static final String verify = "SELECT * FROM recenzione JOIN registrato on utente = loginA WHERE utente = ? AND prodottoR = ?";
	private static final String selectSQL = "SELECT * FROM recenzione JOIN registrato on utente = loginA WHERE prodottoR = ?";
}
