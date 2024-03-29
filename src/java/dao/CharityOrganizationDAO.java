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
                CharityOrganization charityOrg = new CharityOrganization(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7));
                list.add(charityOrg);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public boolean checkCharityOrgName(String charityOrganizationName) {
        try {
            String query = "SELECT COUNT(*) FROM CharityOrganization WHERE charityOrganizationName = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, charityOrganizationName);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public boolean checkCharityOrgEmail(String charityOrganizationEmail) {
        try {
            String query = "SELECT COUNT(*) FROM CharityOrganization WHERE charityOrganizationEmail = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, charityOrganizationEmail);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public boolean updateCharityOrgWithoutLogo(CharityOrganization charityorg) {
        try {
            String query = "UPDATE CharityOrganization SET charityOrganizationName = ?, charityOrganizationEmail = ?, charityOrganizationAddress = ?, charityOrganizationPhone = ? WHERE charityOrganizationId = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, charityorg.getCharityOrganizationName());
            ps.setString(2, charityorg.getCharityOrganizationEmail());
            ps.setString(3, charityorg.getCharityOrganizationAddress());
            ps.setString(4, charityorg.getCharityOrganizationPhone());
            ps.setInt(5, charityorg.getCharityOrganizationId());
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean updateCharityOrg(CharityOrganization charityorg) {
        try {
            String query = "UPDATE CharityOrganization SET charityOrganizationName = ?, charityOrganizationEmail = ?, charityOrganizationLogo = ?, charityOrganizationAddress = ?, charityOrganizationPhone = ? WHERE charityOrganizationId = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, charityorg.getCharityOrganizationName());
            ps.setString(2, charityorg.getCharityOrganizationEmail());
            ps.setString(3, charityorg.getCharityOrganizationLogo());
            ps.setString(4, charityorg.getCharityOrganizationAddress());
            ps.setString(5, charityorg.getCharityOrganizationPhone());
            ps.setInt(6, charityorg.getCharityOrganizationId());
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean insertCharityOrg(CharityOrganization charityorg) {
        try {
            String query = "INSERT INTO CharityOrganization (charityOrganizationName, charityOrganizationEmail, charityOrganizationLogo, charityOrganizationAddress, charityOrganizationPhone, dateCreated) VALUES (?, ?, ?, ?, ?, ?)";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, charityorg.getCharityOrganizationName());
            ps.setString(2, charityorg.getCharityOrganizationEmail());
            ps.setString(3, charityorg.getCharityOrganizationLogo());
            ps.setString(4, charityorg.getCharityOrganizationAddress());
            ps.setString(5, charityorg.getCharityOrganizationPhone());

            java.sql.Date sqlDate = new java.sql.Date(charityorg.getDateCreated().getTime());
            ps.setDate(6, sqlDate);
            
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
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

    public int getCharityOrganizationIdByName(String org) throws Exception {
        conn = new DonationDBContext().getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            String sql = "SELECT charityOrganizationId FROM charityOrganization WHERE charityOrganizationName=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, org);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("charityOrganizationId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý các ngoại lệ khác nếu cần
        }

        return 0;
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
