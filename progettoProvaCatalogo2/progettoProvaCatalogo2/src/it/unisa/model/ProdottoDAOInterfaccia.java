
package it.unisa.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface ProdottoDAOInterfaccia {

	public void doSave(ProdottoBean prodotto) throws SQLException;

	public boolean doDelete(int idProdotto) throws SQLException;

	public ProdottoBean doRetrieveByKey(int idProdotto) throws SQLException;
	
	public ArrayList<ProdottoBean> doRetrieveAll() throws SQLException;
	
	public void doUpdateQnt(int id, int qnt) throws SQLException;
	
	public void doUpdate(ProdottoBean bean) throws SQLException;
	
	public ArrayList<ProdottoBean> filtra(String marca) throws SQLException;
	
}
