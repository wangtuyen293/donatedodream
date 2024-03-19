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
import model.Comments;

/**
 *
 * @author OS
 */
public class CommentDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public void addComment(Comments comment) throws SQLException, ClassNotFoundException {
        conn = new DonationDBContext().getConnection();
        String query = "INSERT INTO comments (content,realTime,projectId,userId) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(4, comment.getUserId());
            statement.setInt(3, comment.getProjectId());
            statement.setString(1, comment.getContent());
            statement.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
            statement.executeUpdate();
        }
    }

    public List<Comments> getProjectComments(int projectId) throws SQLException, ClassNotFoundException {
        List<Comments> comments = new ArrayList<>();
        String query = "SELECT * FROM Comments WHERE projectId = ?";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, projectId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int commentId = resultSet.getInt("commentId");
                int userId = resultSet.getInt("userId");
                String content = resultSet.getString("content");
                java.util.Date realTime = resultSet.getTimestamp("realTime");
                Comments comment = new Comments(commentId, content, realTime, projectId, userId);
                comments.add(comment);
            }
        }

        return comments;
    }

    public void updateComment(Comments comment) throws SQLException, ClassNotFoundException {

        PreparedStatement statement = null;

        try {
            // Get connection from the database context
            conn = new DonationDBContext().getConnection();

            // SQL statement to update feedback
            String sql = "UPDATE Comments SET content=?, realTime=? WHERE projectId=? AND userId=? AND commentId=?";

            // Prepare the statement
            statement = conn.prepareStatement(sql);

            // Set parameters for the statement
            statement.setString(1, comment.getContent());
            statement.setTimestamp(2, new Timestamp(comment.getRealTime().getTime()));
            statement.setInt(3, comment.getProjectId());
            statement.setInt(4, comment.getUserId());
            statement.setInt(5, comment.getCommentId());

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

    public void deleteCommentById(int commentId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = new DonationDBContext().getConnection();
            String sql = "DELETE FROM Comments WHERE commentId = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, commentId);
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

    public int countComment() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Comments";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        CommentDAO comment = new CommentDAO();
        System.out.println(comment.countComment());
    }
}
