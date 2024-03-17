/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.transaction;

/**
 *
 * @author quang
 */
import dao.DonationDAO;
import db.DonationDBContext;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.poi.ss.usermodel.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import org.apache.poi.ss.usermodel.DateUtil;

public class HandleFileExcel {

    public boolean readAndWriteToDatabase(String filePath, String sheetName, int donationId, String magd) {
        int rowIndex = 0;
        boolean success = false;
        try {
            FileInputStream file = new FileInputStream(filePath);
            Workbook workbook = WorkbookFactory.create(file);
            Sheet sheet = workbook.getSheet(sheetName);

            for (Row row : sheet) {
                // Bỏ qua hàng đầu tiên
                if (rowIndex == 0) {
                    rowIndex++;
                    continue;
                }

                Cell cellA = row.getCell(0);
                String valueA = getValueAsString(cellA);

                // Kiểm tra xem giá trị trong cột A đã tồn tại chưa
                if (isDataExists(valueA)) {
                    System.out.println("Data with MaGD: " + valueA + " already exists. Skipping...");
                    rowIndex++;
                    continue;
                }

                Cell cellB = row.getCell(1);
                Cell cellC = row.getCell(2);
                Cell cellD = row.getCell(3);
                Cell cellE = row.getCell(4);
                Cell cellF = row.getCell(5);

                String valueB = getValueAsString(cellB);
                String valueC = getValueAsString(cellC);
                String valueD = getValueAsString(cellD);
                String valueE = getValueAsString(cellE);
                String valueF = getValueAsString(cellF);
                System.out.println(valueA);
                boolean check = valueB.contains(magd);
                System.out.println(check);
                if (check) {
                    writeToDatabase(valueA, valueB, valueC, valueD, valueE, valueF, donationId);
                    success = true;
                }
                rowIndex++;
            }
            file.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public void deleteDonation(int donationId) throws ClassNotFoundException, SQLException {
        Connection conn = new DonationDBContext().getConnection();
        try ( PreparedStatement preparedStatement = conn.prepareStatement("DELETE FROM Donation WHERE donationId = ?")) {
            preparedStatement.setInt(1, donationId);

            // Thực hiện câu lệnh DELETE
            int rowsAffected = preparedStatement.executeUpdate();

            // Kiểm tra xem có dòng nào bị ảnh hưởng không
            if (rowsAffected > 0) {
                System.out.println("Đã xoá Donation có donationId = " + donationId);
            } else {
                System.out.println("Không tìm thấy Donation có donationId = " + donationId);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ SQL
        }
    }

    private boolean isDataExists(String maGD) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            conn = new DonationDBContext().getConnection();

            String sql = "SELECT COUNT(*) FROM GiaoDich WHERE MaGD = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, maGD);
            resultSet = preparedStatement.executeQuery();

            // Nếu có bản ghi có cùng giá trị trong cột A, trả về true
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên (ResultSet, PreparedStatement, Connection)
            try {
                if (resultSet != null) {
                    resultSet.close();
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

        // Trả về false nếu không có bản ghi nào có giá trị trong cột A
        return false;
    }

    private String getValueAsString(Cell cell) {
        if (cell == null) {
            return "";
        } else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
            return cell.getStringCellValue();
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            return String.format("%.0f", cell.getNumericCellValue());
        } else {
            return "";
        }
    }

    private void writeToDatabase(String maGD, String moTa, String giaTri, String ngayDienRa, String soTaiKhoan, String soDu, int donationId) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
            conn = new DonationDBContext().getConnection();

            String sql = "INSERT INTO GiaoDich (MaGD, MoTa, GiaTri, NgayDienRa, SoTaiKhoan, SoDu,donationId,paymentMethod) VALUES (?, ?, ?, ?, ?, ?,?,?)";
            preparedStatement = conn.prepareStatement(sql);

            // Chuyển đổi giá trị 'NgayDienRa' từ chuỗi sang java.sql.Timestamp
            java.util.Date parsedDate = null;

            // Kiểm tra xem ngày có định dạng số serial date không
            if (ngayDienRa.matches("\\d+")) {
                int serialDate = Integer.parseInt(ngayDienRa);
                parsedDate = DateUtil.getJavaDate(serialDate, false);
            } else {
                // Đối với ngày có định dạng khác, sử dụng SimpleDateFormat
                SimpleDateFormat dateFormat = new SimpleDateFormat("M/d/yyyy HH:mm");
                parsedDate = dateFormat.parse(ngayDienRa);
            }

            Timestamp ngayDienRaTimestamp = new java.sql.Timestamp(parsedDate.getTime());

            // Thiết lập giá trị cho các tham số trong câu lệnh SQL
            preparedStatement.setString(1, maGD);
            preparedStatement.setString(2, moTa);
            preparedStatement.setString(3, giaTri);
            preparedStatement.setTimestamp(4, ngayDienRaTimestamp);
            preparedStatement.setString(5, soTaiKhoan);
            preparedStatement.setString(6, soDu);
            preparedStatement.setInt(7, donationId);
            preparedStatement.setInt(8, 1);
            // Thực hiện câu lệnh SQL INSERT
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên (PreparedStatement, Connection) ở đây nếu cần
            try {
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
    }

}
