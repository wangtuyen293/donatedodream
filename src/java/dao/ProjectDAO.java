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
import model.Category;
import model.Project;

/**
 *
 * @author OS
 */
public class ProjectDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private static final Logger logger = Logger.getLogger(ProjectDAO.class.getName());

    public List<Project> getProjects() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.projectImage, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.userId, p.charityOrganizationId, p.isApproved, p.categoryId FROM Project p";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getString("projectImage"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), rs.getInt("userId"), rs.getInt("charityOrganizationId"), rs.getInt("categoryId"));
                list.add(project);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
//    public List<Project> getProjectsByCategory() {
//        List<Project> list = new ArrayList<>();
//        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.projectImage, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.userId, p.charityOrganizationId, p.isApproved, c.categoryId, c.categoryName, c.categoryDescription, c.imgCategory FROM Project p INNER JOIN Category c ON p.categoryId = c.categoryId";
//        try {
//            conn = new DonationDBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                Category ca = new Category(categoryId, categoryName, categoryDescription, imgCategory);
//                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getString("projectImage"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), rs.getInt("userId"), rs.getInt("charityOrganizationId"), ca);
//                list.add(project);
//            }
//        } catch (Exception ex) {
//            logger.log(Level.SEVERE, null, ex);
//        } finally {
//            closeResources(conn, ps, rs);
//        }
//        return list;
//    }

    public List<Category> getCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category ORDER BY categoryName";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(category);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<String> getCategoryName() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT categoryName FROM Category ORDER BY categoryName";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString(1);
                if (!list.contains(categoryName)) {
                    list.add(categoryName);
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public int countProject() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Project";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return count;
    }
    
    public int countSucceedProject() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Project WHERE donatedAmountOfMoney >= projectTarget";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return count;
    }

    public void insertCategory(String categoryName) {
        String sql = "INSERT INTO Category (categoryName) VALUES(?)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, categoryName);
            ps.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean updateProjectApproval(int projectId, byte isApproved) {
        String sql = "UPDATE Project SET isApproved = ? WHERE projectId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setByte(1, isApproved);
            ps.setInt(2, projectId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the user.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteProject(int projectId) {
        String sql = "DELETE FROM Project WHERE projectId=?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the user.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteProjectSelected(int[] projectIds) {
        try {
            String sql = "DELETE FROM Project WHERE projectId=?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);

            // Delete users based on the user IDs
            for (int projectId : projectIds) {
                ps.setInt(1, projectId);
                ps.addBatch(); // Add the delete operation to the batch
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
            logger.log(Level.SEVERE, "An error occurred while deleting the users.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
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
        ProjectDAO projectDAO = new ProjectDAO();
//        System.out.println(projectDAO.updateProjectApproval(1, 1));
    }
}
