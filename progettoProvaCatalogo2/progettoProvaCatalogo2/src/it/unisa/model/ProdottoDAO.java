package it.unisa.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProdottoDAO implements ProdottoDAOInterfaccia{

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/storage");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized void doSave(ProdottoBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProdottoDAO.TABLE_NAME
				+ " (NOME, MARCA, DESCRIZIONE, PREZZO, QUANTITA, DATA_USCITA, IVA, IMMAGINE, DESCRIZIONE_DETTAGLIATA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getMarca());
			preparedStatement.setString(3, product.getDescrizione());
			preparedStatement.setDouble(4, product.getPrezzo());
			preparedStatement.setInt(5, product.getQuantità());
			preparedStatement.setString(6, product.getDataUscita());
			preparedStatement.setString(7, product.getIva());
			preparedStatement.setString(8, product.getImmagine());
			preparedStatement.setString(9, product.getDescrizioneDettagliata());


			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProdottoBean doRetrieveByKey(int idProdotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProdottoBean bean = new ProdottoBean();

		String selectSQL = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE ID_PRODOTTO = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idProdotto);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setIdProdotto(rs.getInt("ID_PRODOTTO"));
				bean.setNome(rs.getString("NOME"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setQuantità(rs.getInt("QUANTITA"));
				bean.setMarca(rs.getString("MARCA"));
				bean.setIva(rs.getString("IVA"));
				bean.setDataUscita(rs.getString("DATA_USCITA"));
				bean.setImmagine(rs.getString("IMMAGINE"));
				bean.setDescrizioneDettagliata(rs.getString("DESCRIZIONE_DETTAGLIATA"));


			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public synchronized boolean doDelete(int idProdotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE ID_PRODOTTO = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idProdotto);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized ArrayList<ProdottoBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();

		String selectSQL = "SELECT * FROM " + ProdottoDAO.TABLE_NAME;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProdottoBean bean = new ProdottoBean();

				bean.setIdProdotto(rs.getInt("ID_PRODOTTO"));
				bean.setNome(rs.getString("NOME"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setQuantità(rs.getInt("QUANTITA"));
				bean.setMarca(rs.getString("MARCA"));
				bean.setIva(rs.getString("IVA"));
				bean.setDataUscita(rs.getString("DATA_USCITA"));
				bean.setImmagine(rs.getString("IMMAGINE"));
				bean.setDescrizioneDettagliata(rs.getString("DESCRIZIONE_DETTAGLIATA"));

				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	@Override
	public synchronized void doUpdateQnt(int id, int qnt) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE " + ProdottoDAO.TABLE_NAME
				+ " SET QUANTITA = ? "
				+ " WHERE ID_PRODOTTO = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setInt(1, qnt);
			preparedStatement.setInt(2, id);

			

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	public synchronized ArrayList<ProdottoBean> filtra(String marca) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();
		
		String selectSQL = "SELECT * FROM "+TABLE_NAME+" WHERE marca =? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, marca);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProdottoBean bean = new ProdottoBean();

				bean.setIdProdotto(rs.getInt("ID_PRODOTTO"));
				bean.setNome(rs.getString("NOME"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setQuantità(rs.getInt("QUANTITA"));
				bean.setMarca(rs.getString("MARCA"));
				bean.setIva(rs.getString("IVA"));
				bean.setDataUscita(rs.getString("DATA_USCITA"));
				bean.setImmagine(rs.getString("IMMAGINE"));
				bean.setDescrizioneDettagliata(rs.getString("DESCRIZIONE_DETTAGLIATA"));

				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public synchronized void doUpdate(ProdottoBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE " + ProdottoDAO.TABLE_NAME
				+ " SET NOME = ? , QUANTITA = ? , PIATTAFORMA = ?, DESCRIZIONE = ?, PREZZO = ?, GENERE = ?, DATA_USCITA = ?, IN_VENDITA = ?, IVA = ?, IMMAGINE = ?, DESCRIZIONE_DETTAGLIATA = ?"
				+ " WHERE ID_PRODOTTO = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getMarca());
			preparedStatement.setString(3, product.getDescrizione());
			preparedStatement.setDouble(4, product.getPrezzo());
			preparedStatement.setInt(5, product.getQuantità());
			preparedStatement.setString(6, product.getDataUscita());
			preparedStatement.setString(7, product.getIva());
			preparedStatement.setString(8, product.getImmagine());
			preparedStatement.setString(9, product.getDescrizioneDettagliata());

			

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
} 