package dao;

import db.DonationDBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CharityOrganization;

/**
 *
 * @author OS
 */
public class CharityOrganizationDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private static final Logger logger = Logger.getLogger(CharityOrganizationDAO.class.getName());
    
    public List<CharityOrganization> getAllCharityOrg() {
        List<CharityOrganization> list = new ArrayList<>();
        String sql = "SELECT * FROM CharityOrganization";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CharityOrganization charityOrg = new CharityOrganization(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(charityOrg);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public boolean deleteCharityOrgByCharityOrgId(int charityOrganizationId) {
        String sql = "DELETE FROM CharityOrganization WHERE charityOrganizationId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, charityOrganizationId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the charity organization.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }
    
    public boolean deleteCharityOrgSelectedByCharityOrgId(int[] charityOrgIds) {
        try {
            String sql = "DELETE FROM CharityOrganization WHERE charityOrganizationId = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);

            for (int charityOrganizationId : charityOrgIds) {
                ps.setInt(1, charityOrganizationId);
                ps.addBatch();
            }

            int[] rowsAffected = ps.executeBatch(); // Execute the batch delete operation

            // Check if any rows were affected by the delete operation
            for (int affectedRows : rowsAffected) {
                if (affectedRows <= 0) {
                    return false; // Deletion failed
                }
            }

            return true; // Deletion successful
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the charity organizations.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public int countCharityOrg() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM CharityOrganization";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CharityOrganizationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return count;
    }

    // Close database resources (connection, statement, and result set)
    private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        CharityOrganizationDAO charityOrgDAO = new CharityOrganizationDAO();
        System.out.println(charityOrgDAO.countCharityOrg());
    }
}
