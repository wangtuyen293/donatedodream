package dao;

import db.DonationDBContext;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import model.Donation;
import model.ProjectMilestoneGift;
import model.Users;

/**
 *
 * @author OS
 */
public class DonationDAO {

    public int addDonation(Donation donation) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = null;
        Connection conn = new DonationDBContext().getConnection();
        ResultSet generatedKeys = null;
        int donationId = -1; // Giá trị mặc định, -1 nếu có lỗi

        try {
            // Chuẩn bị câu lệnh SQL
            String sql = "INSERT INTO Donation (amountOfMoney, donationTime, userId, projectId,giftId, address, paymentMethod) VALUES (?, ?, ?, ?, ?, ?,?)";
            preparedStatement = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            // Thiết lập các tham số cho câu lệnh SQL
            preparedStatement.setBigDecimal(1, donation.getAmountOfMoney());
            preparedStatement.setTimestamp(2, new Timestamp(donation.getDonationTime().getTime()));
            preparedStatement.setInt(3, donation.getUserId());
            preparedStatement.setInt(5, donation.getGiftId());
            preparedStatement.setInt(4, donation.getProjectId());
            preparedStatement.setString(7, donation.getPaymentMethod());
            preparedStatement.setString(6, donation.getAddress());

            // Thực thi câu lệnh SQL
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                // Lấy giá trị tự động tăng từ ResultSet
                generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    donationId = generatedKeys.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên (ResultSet, PreparedStatement, Connection)
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return donationId;
    }

    public boolean hasMatchingTransactions(String keywordMoTa) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            conn = new DonationDBContext().getConnection();
            String sql = "SELECT * FROM GiaoDich WHERE MoTa LIKE ? ";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, "%" + keywordMoTa + "%");
            resultSet = preparedStatement.executeQuery();

            // Nếu có bất kỳ kết quả nào, trả về true
            return resultSet.next();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên (ResultSet, PreparedStatement, Connection)
            // ...
        }

        return false; // Trả về false nếu có lỗi hoặc không có kết quả
    }

    public String getGiaTriByDonationId(int donationId) throws ClassNotFoundException, SQLException {
        String sql = "SELECT GiaTri FROM GiaoDich WHERE donationId = ?";
        String giaTri = null;
        Connection conn = new DonationDBContext().getConnection();
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setInt(1, donationId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    giaTri = resultSet.getString("GiaTri");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ theo ý bạn
        }

        return giaTri;
    }

    public void updateDonatedAmount(int donationId) throws SQLException, ClassNotFoundException {
        Connection conn = new DonationDBContext().getConnection();
        int projectId = getProjectIdForDonation(donationId);
        if (projectId != -1) {
            int amountOfMoney = getAmountOfMoneyForDonation(donationId);
            if (amountOfMoney != -1) {
                String sql = "UPDATE Project SET donatedAmountOfMoney = donatedAmountOfMoney + ? WHERE projectId = ?";
                try ( PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setInt(1, amountOfMoney);
                    statement.setInt(2, projectId);
                    statement.executeUpdate();
                }
            }
        }
    }

    // Phương thức để lấy projectId tương ứng với donationId
    private int getProjectIdForDonation(int donationId) throws SQLException, ClassNotFoundException {
        int projectId = -1;
        Connection conn = new DonationDBContext().getConnection();
        String sql = "SELECT projectId FROM Donation WHERE donationId = ?";
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, donationId);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    projectId = resultSet.getInt("projectId");
                }
            }
        }
        return projectId;
    }

    // Phương thức để lấy amountOfMoney tương ứng với donationId
    private int getAmountOfMoneyForDonation(int donationId) throws SQLException, ClassNotFoundException {
        int amountOfMoney = -1;
        Connection conn = new DonationDBContext().getConnection();
        String sql = "SELECT amountOfMoney FROM Donation WHERE donationId = ?";
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, donationId);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    amountOfMoney = resultSet.getInt("amountOfMoney");
                }
            }
        }
        return amountOfMoney;
    }

    public List<Donation> getDonationsByProjectId(int projectId) throws ClassNotFoundException {
        List<Donation> donations = new ArrayList<>();

        try {
            String query = "SELECT * FROM Donation d "
                    + "INNER JOIN GiaoDich g ON d.donationId = g.donationId "
                    + "WHERE projectId = ? AND g.paymentMethod = 1";

            Connection conn = new DonationDBContext().getConnection();
            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, projectId);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Donation donation = new Donation();
                    donation.setAmountOfMoney(resultSet.getBigDecimal("amountOfMoney"));
                    donation.setUserId(resultSet.getInt("userId"));
                    // Set other properties as needed

                    donations.add(donation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return donations;
    }

    public List<Donation> getDonationsGiftByProjectId(int projectId) throws ClassNotFoundException {
        List<Donation> donations = new ArrayList<>();

        try ( Connection conn = new DonationDBContext().getConnection()) {
            String query = "SELECT u.userName, d.amountOfMoney, m.description, d.address "
                    + "FROM Users u "
                    + "INNER JOIN ProjectMilestoneGift m ON u.userId = m.userId "
                    + "INNER JOIN Donation d ON u.userId = d.userId "
                    + "WHERE projectId = ?";
            try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, projectId);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        // Tạo một đối tượng Donation mới với dữ liệu từ ResultSet
                        Donation donation = new Donation();
                        donation.setAmountOfMoney(resultSet.getBigDecimal("amountOfMoney"));
                        donation.setAddress(resultSet.getString("address"));

                        // Tạo một đối tượng User và đặt các thuộc tính của nó
                        Users user = new Users();
                        user.setUserName(resultSet.getString("userName"));
                        // Đặt người dùng vào đối tượng quyên góp
                        donation.setUser(user);

                        // Tạo một đối tượng ProjectMilestoneGift và đặt các thuộc tính của nó
                        ProjectMilestoneGift pm = new ProjectMilestoneGift();
                        pm.setDescription(resultSet.getString("description"));
                        // Đặt mô tả mốc dự án vào đối tượng quyên góp
                        donation.setPm(pm);

                        // Thêm quyên góp vào danh sách
                        donations.add(donation);
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ theo cách thích hợp
        }

        return donations;
    }

    public int getUserIdByProjectId(int id) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT userId FROM Project WHERE projectId = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("userId");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public String getUserNameByUserId(int id) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT userName FROM Users WHERE userId = ?";
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("userName");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
