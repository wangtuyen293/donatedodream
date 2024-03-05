package dao;

import db.DonationDBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserGoogle;
import model.Users;

/**
 *
 * @author OS
 */
public class UserDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private static final Logger logger = Logger.getLogger(UserDAO.class.getName());

    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE userTypeId <> 1";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToUser(rs));
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public Users checkUser(String username, String password) {
        try {
            String query = "select * from Users where userName = ? and password = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public Users getUserByUserName(String userName) {
        try {
            String query = "SELECT * FROM Users WHERE userName = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public Users getUserByEmail(String email) {
        try {
            String query = "SELECT * FROM Users WHERE email = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public String getUserNameByEmail(String email) throws Exception {
        conn = new DonationDBContext().getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            String sql = "SELECT userName FROM Users WHERE email=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("userName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý các ngoại lệ khác nếu cần
        }

        return null;
    }

    public void addUserLoginByEmail(UserGoogle ug, String accessToken) throws Exception {
        conn = new DonationDBContext().getConnection();
        String sql = "INSERT INTO UserGoogle (userName,email,accessToken) VALUES (?, ?, ?)";
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(3, accessToken);
            statement.setString(1, ug.getName());
            statement.setString(2, ug.getEmail());
            statement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addUser(String userName, String password, String email) {
        String sql = "INSERT INTO Users (fullName, userName, password, gender, dateOfBirth, avatar, email, phoneNumber, userTypeId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNull(1, java.sql.Types.VARCHAR);
            ps.setString(2, userName);
            ps.setString(3, password);
            ps.setNull(4, java.sql.Types.VARCHAR);
            ps.setNull(5, java.sql.Types.DATE);
            ps.setNull(6, java.sql.Types.VARCHAR);
            ps.setString(7, email);
            ps.setNull(8, java.sql.Types.VARCHAR);
            ps.setNull(9, java.sql.Types.INTEGER);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public int countUsers() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Users";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int countUserAsUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "FROM Users WHERE userTypeId <> 1";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public boolean updateUserStatus(int userId, String userStatus) {
        String sql = "UPDATE Users SET userStatus = ? WHERE userId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userStatus);
            ps.setInt(2, userId);
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

    public void updateUserPassword(int userId, String password) {
        String sql = "UPDATE Users SET password = ? WHERE userId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean checkExistedEmail(String email) {
        boolean isExisted = false;
        String sql = "select email from UserGoogle";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(email)) {
                    isExisted = true;
                    break;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return isExisted;
        }
        return isExisted;
    }

    public boolean checkExistedUserByEmail(String email) {
        boolean isExisted = false;
        String sql = "select email from Users";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(email)) {
                    isExisted = true;
                    break;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return isExisted;
        }
        return isExisted;
    }

    public boolean checkExistUserName(String userName) {
        boolean check = false;
        try {
            String query = "SELECT * FROM Users WHERE userName = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            check = rs.next();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return check;
    }

    public void createUser(String email, String password) {
        String sql = "INSERT INTO Users (email, password) VALUES (?, ?)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.executeQuery();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return;
        }
    }

    public int getUserIdByEmail(String email) {
        int userId = 0;
        String sql = "SELECT userId FROM Users WHERE email = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("userId");
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return userId;
    }

    public boolean checkPassword(int userId, String password) {
        String sql = "SELECT password from Users where userId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                return storedPassword.equals(password);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public void updatePassword(String username, String newPassword) throws Exception {
        conn = new DonationDBContext().getConnection();
        String query = "UPDATE Users SET password = ? WHERE email = ?";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updatePasswordwithUserName(String username, String newPassword) throws Exception {
        conn = new DonationDBContext().getConnection();
        String query = "UPDATE Users SET password = ? WHERE userName = ?";
        try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE userId=?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the user.", ex);
            System.out.println(ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            System.out.println(ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteUserSelected(int[] userIds) {
        try {
            String sql = "DELETE FROM Users WHERE userId=?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);

            // Delete users based on the user IDs
            for (int userId : userIds) {
                ps.setInt(1, userId);
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
            System.out.println(ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            System.out.println(ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public void updateUserAuth(int userId, int googleUserId) {
        String sql = "UPDATE Authentication SET googleUserId = ? WHERE userId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, googleUserId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public void createAuthenByGoogleId(int googleUserId) {
        String sql = "INSERT INTO Authentication (googleUserId) VALUES (?)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, googleUserId);
            ps.executeUpdate();
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public int getGoogleUserIdByEmail(String email) {
        String sql = "select googleUserId from UserGoogle where email= ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            closeResources(conn, ps, rs);
        }
        return 0;
    }

    public boolean updateUserProfile(Users user) throws Exception {
        conn = new DonationDBContext().getConnection();
        String query = "UPDATE Users SET fullName=?, gender=?, dateOfBirth=?,email=?, phoneNumber=?, avatar=? WHERE username=?";
        boolean success = false;

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setByte(2, user.getGender());
            preparedStatement.setDate(3, (Date) user.getDateOfBirth());
            preparedStatement.setString(6, user.getAvatar());
            preparedStatement.setString(7, user.getUserName());
            int rowsUpdated = preparedStatement.executeUpdate();
            success = (rowsUpdated > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Integer> getGoogleUserId() {
        List<Integer> list = new ArrayList<>();
        String sql = "select googleUserId from UserGoogle";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Integer> getAuthen() {
        List<Integer> list = new ArrayList<>();
        String sql = "select userId from Authentication";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    private Users mapResultSetToUser(ResultSet rs) throws SQLException {
        Users user = new Users();
        user.setUserId(rs.getInt("userId"));
        user.setFullName(rs.getString("fullName"));
        user.setUserName(rs.getString("userName"));
        user.setPassword(rs.getString("password"));
        user.setGender(rs.getByte("gender"));
        user.setDateOfBirth(rs.getDate("dateOfBirth"));
        user.setAvatar(rs.getString("avatar"));
        user.setEmail(rs.getString("email"));
        user.setPhoneNumber(rs.getString("phoneNumber"));
        user.setDateCreated(rs.getDate("dateCreated"));
        user.setUserTypeId(rs.getInt("userTypeId"));
        user.setUserStatus(rs.getString("userStatus"));
        return user;
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
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while closing resources", e);
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        System.out.println(userDAO.getUserByEmail("admin1@gmail.com"));
    }

}
