package dao;

import db.DonationDBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;

/**
 *
 * @author OS
 */
public class FeedbackDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int addFeedback(Feedback feedback) throws SQLException, ClassNotFoundException {
        int feedbackId = -1; // Giá trị mặc định trong trường hợp không có feedbackId được trả về

        conn = new DonationDBContext().getConnection();
        ResultSet generatedKeys = null;
        try {
            String sql = "INSERT INTO feedback (content, realTime, projectId, userId, rating) VALUES (?, ?, ?, ?, ?)";
            try ( PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, feedback.getContent());
                statement.setTimestamp(2, new Timestamp(feedback.getRealTime().getTime()));
                statement.setInt(3, feedback.getProjectId());
                statement.setInt(4, feedback.getUserId());
                statement.setInt(5, feedback.getStar());

                // Thực thi câu lệnh SQL
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Creating feedback failed, no rows affected.");
                }

                generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    feedbackId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating feedback failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
            if (generatedKeys != null) {
                generatedKeys.close();
            }
        }

        return feedbackId;
    }

    public void updateFeedback(Feedback feedback) throws SQLException, ClassNotFoundException {

        PreparedStatement statement = null;

        try {
            // Get connection from the database context
            conn = new DonationDBContext().getConnection();

            // SQL statement to update feedback
            String sql = "UPDATE Feedback SET content=?, realTime=?, rating=? WHERE projectId=? AND userId=? AND feedbackId=?";

            // Prepare the statement
            statement = conn.prepareStatement(sql);

            // Set parameters for the statement
            statement.setString(1, feedback.getContent());
            statement.setTimestamp(2, new Timestamp(feedback.getRealTime().getTime()));
            statement.setInt(3, feedback.getStar());
            statement.setInt(4, feedback.getProjectId());
            statement.setInt(5, feedback.getUserId());
            statement.setInt(6, feedback.getFeedbackId());

            // Execute the update
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exceptions appropriately
            throw ex;
        } finally {
            // Close resources in finally block to ensure they are always closed
            closeResources(conn, statement, null);
        }
    }

    public void updateFeedbackContent(int feedbackId, String newContent) throws SQLException, ClassNotFoundException {
        conn = new DonationDBContext().getConnection();
        String sql = "UPDATE feedback SET content = ? WHERE id = ?";
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, newContent);
            statement.setInt(2, feedbackId);
            statement.executeUpdate();
        }
    }

    public void deleteFeedbackById(int feedbackId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = new DonationDBContext().getConnection();
            String sql = "DELETE FROM Feedback WHERE feedbackId = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, feedbackId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex; // Re-throw the exception for handling at a higher level
        } finally {
            // Close resources
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<Feedback> getAllFeedbackByProjectId(int projectId) throws SQLException, ClassNotFoundException {
        List<Feedback> feedbackList = new ArrayList<>();

        try {
            conn = new DonationDBContext().getConnection();
            String sql = "SELECT * FROM feedback WHERE projectId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedbackId"));
                feedback.setContent(rs.getString("content"));
                feedback.setRealTime(rs.getTimestamp("realTime"));
                feedback.setProjectId(rs.getInt("projectId"));
                feedback.setUserId(rs.getInt("userId"));
                feedback.setStar(rs.getInt("rating"));
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }

        return feedbackList;
    }

    public int countFeedback() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Feedback";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
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
}
