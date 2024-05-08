package com.negre.mannaggiaaquellanegrabastarda;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;
import com.negre.mannaggiaaquellanegrabastarda.ProductBean;

public class ProductModel {
    // Metodo per recuperare tutti i prodotti dal database
    public List<ProductBean> getAllProducts() {
        List<ProductBean> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseManager.getConnection();
            String sql = "SELECT * FROM product";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setCode(rs.getInt("code"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getInt("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setMarca(rs.getString("marca"));
                product.setImg(rs.getString("image"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Errore durante il recupero dei prodotti dal database: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) DatabaseManager.releaseConnection(conn);
            } catch (SQLException e) {
                System.out.println("Errore durante la chiusura delle risorse del database: " + e.getMessage());
            }
        }
        return products;
    }
}
