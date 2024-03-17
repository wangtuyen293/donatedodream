package dao;

import db.DonationDBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public void addFeedback(Feedback feedback) throws SQLException, ClassNotFoundException {
        conn = new DonationDBContext().getConnection();
        try {
            // Câu lệnh SQL để chèn phản hồi vào cơ sở dữ liệu
            String sql = "INSERT INTO feedback (content, realTime, projectId, userId,rating) VALUES (?, ?, ?, ?, ?)";

            try ( PreparedStatement statement = conn.prepareStatement(sql)) {
                // Đặt các tham số cho câu lệnh SQL
                statement.setInt(5, feedback.getStar());
                statement.setString(1, feedback.getContent());
                statement.setTimestamp(2, new Timestamp(feedback.getRealTime().getTime()));
                statement.setInt(3, feedback.getProjectId());
                statement.setInt(4, feedback.getUserId());

                // Thực thi câu lệnh SQL
                statement.executeUpdate();
            } catch (Exception ex) {
                Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                closeResources(conn, ps, rs);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public void updateFeedback(Feedback feedback) throws SQLException, ClassNotFoundException {
        conn = new DonationDBContext().getConnection();
        try {
            // Câu lệnh SQL để chèn phản hồi vào cơ sở dữ liệu
            String sql = "UPDATE feedback SET content=?, realTime=?, rating=? WHERE projectId=? AND userId=?";

            try ( PreparedStatement statement = conn.prepareStatement(sql)) {
                // Đặt các tham số cho câu lệnh SQL
                statement.setInt(5, feedback.getStar());
                statement.setString(1, feedback.getContent());
                statement.setTimestamp(2, new Timestamp(feedback.getRealTime().getTime()));
                statement.setInt(3, feedback.getProjectId());
                statement.setInt(4, feedback.getUserId());

                // Thực thi câu lệnh SQL
                statement.executeUpdate();
            } catch (Exception ex) {
                Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                closeResources(conn, ps, rs);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
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
                feedback.setProjectId(rs.getInt("feedbackId"));
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
