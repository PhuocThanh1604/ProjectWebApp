/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.category.CategoryDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Mr.Thanh
 */
public class CategoryDAO {
     private static final String SEARCH_CATEGORY = "SELECT categoryID, categoryName FROM tblCategory WHERE categoryID=?";
    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> listCategory = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            rs = ptm.executeQuery();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_CATEGORY);
                while (rs.next()) {
                    int categoryID = rs.getInt("categoryID");
                    String categoryName = rs.getString("categoryName");
                    listCategory.add(new CategoryDTO(categoryID, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return listCategory;
        }
    }
}
