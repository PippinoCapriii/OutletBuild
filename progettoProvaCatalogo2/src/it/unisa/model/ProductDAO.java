
 package it.unisa.model;

  import java.sql.Connection;
  import java.sql.PreparedStatement;
  import java.sql.ResultSet;
  import java.sql.SQLException;
  import java.util.Collection;
  import java.util.LinkedList;
  import javax.naming.Context;
  import javax.naming.InitialContext;
  import javax.naming.NamingException;
  import javax.sql.DataSource;

  public class ProductDAO implements ProductDAOInterfaccia {
    private static DataSource ds;
    
    private static final String TABLE_NAME = "product";
    
    static {
      try {
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        ds = (DataSource)envCtx.lookup("jdbc/storage");
      } catch (NamingException e) {
        System.out.println("Error:" + e.getMessage());
      } 
    }
    
    public synchronized void doSave(ProductBean product) throws SQLException {
      Connection connection = null;
      PreparedStatement preparedStatement = null;
      String insertSQL = "INSERT INTO product (NOME, DESCRIZIONE, PREZZO, QUANTITA', MARCA, IMMAGINE) VALUES (?, ?, ?, ?, ?, ?)";
      try {
        connection = ds.getConnection();
        connection.setAutoCommit(false);
        preparedStatement = connection.prepareStatement(insertSQL);
        preparedStatement.setString(1, product.getNome());
        preparedStatement.setString(2, product.getDescrizione());
        preparedStatement.setDouble(3, product.getPrezzo());
        preparedStatement.setInt(4, product.getQuantità());
        preparedStatement.setString(5, product.getMarca());
        preparedStatement.setString(6, product.getImmagine());
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
    
    public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
      Connection connection = null;
      PreparedStatement preparedStatement = null;
      ProductBean bean = new ProductBean();
      String selectSQL = "SELECT * FROM product WHERE CODE = ?";
      try {
        connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(selectSQL);
        preparedStatement.setInt(1, code);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
          bean.setIdProdotto(rs.getInt("IDPRODOTTO"));
          bean.setNome(rs.getString("NOME"));
          bean.setDescrizione(rs.getString("DESCRIZIONE"));
          bean.setPrezzo(rs.getInt("PREZZO"));
          bean.setQuantità(rs.getInt("QUANTITA'"));
          bean.setMarca(rs.getString("MARCA"));
          bean.setImmagine(rs.getString("IMMAGINE"));
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
    
    public synchronized boolean doDelete(int code) throws SQLException {
      Connection connection = null;
      PreparedStatement preparedStatement = null;
      int result = 0;
      String deleteSQL = "DELETE FROM product WHERE CODE = ?";
      try {
        connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(deleteSQL);
        preparedStatement.setInt(1, code);
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
    
    public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
      Connection connection = null;
      PreparedStatement preparedStatement = null;
      Collection<ProductBean> products = new LinkedList<>();
      String selectSQL = "SELECT * FROM product";
      if (order != null && !order.equals(""))
        selectSQL = selectSQL + " ORDER BY " + selectSQL; 
      try {
        connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(selectSQL);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
          ProductBean bean = new ProductBean();
          bean.setIdProdotto(rs.getInt("IDPRODOTTO"));
          bean.setNome(rs.getString("NOME"));
          bean.setDescrizione(rs.getString("DESCRIZIONE"));
          bean.setPrezzo(rs.getInt("PREZZO"));
          bean.setQuantità(rs.getInt("QUANTITa'"));
          bean.setMarca(rs.getString("MARCA"));
          bean.setImmagine(rs.getString("IMMAGINE"));
         
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
    
    public synchronized Collection <ProductBean> filtra(String marca) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<ProductBean> products = new LinkedList<>();
        
        String selectSQL = "SELECT * FROM "+TABLE_NAME+" WHERE marca =? ";
       
        try {
          connection = ds.getConnection();
          preparedStatement = connection.prepareStatement(selectSQL);
          preparedStatement.setString(1, marca);
          ResultSet rs = preparedStatement.executeQuery();
          while (rs.next()) {
          ProductBean bean = new ProductBean();
            bean.setIdProdotto(rs.getInt("IDPRODOTTO"));
            bean.setNome(rs.getString("NOME"));
            bean.setDescrizione(rs.getString("DESCRIZIONE"));
            bean.setPrezzo(rs.getInt("PREZZO"));
            bean.setQuantità(rs.getInt("QUANTITa'"));
            bean.setMarca(rs.getString("MARCA"));
            bean.setImmagine(rs.getString("IMMAGINE"));
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
      }
  
  	  
  	  
