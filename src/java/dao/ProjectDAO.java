package dao;

import db.DonationDBContext;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Project;
import model.ProjectImages;
import model.ProjectMilestoneGift;
import model.ProjectProcess;
import model.Users;

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
                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), rs.getInt("userId"), rs.getInt("charityOrganizationId"));
                list.add(project);
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
     
    public List<Project> getProjectsByUserIdApproved(int userId) {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.userId = ? AND p.isApproved = 1";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(rs.getInt("userId"), fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);
                String image1_path = rs.getString("image1_path");
                ProjectImages prj = new ProjectImages(image1_path);
                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user, prj);
                list.add(project);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Project> getOutdatedProject() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 AND p.endDate < CAST(CURRENT_TIMESTAMP AS DATE) AND p.donatedAmountOfMoney < p.projectTarget";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public List<Project> getActiveProject() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 AND p.donatedAmountOfMoney > 0 AND p.endDate >= CAST(CURRENT_TIMESTAMP AS DATE)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public List<Project> getNewProject() {
        List<Project> list = new ArrayList<>();
         String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 AND p.donatedAmountOfMoney = 0 AND p.endDate >= CAST(CURRENT_TIMESTAMP AS DATE)";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public List<Project> getSuccessProject() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 AND p.donatedAmountOfMoney >= p.projectTarget";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public List<Project> getProjectByProjectNameAZ() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 "
                + "ORDER BY p.projectName";
        
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }
    
    public List<Project> searchProject(String searchQuery) {
        List<Project> searchProjectResult = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1 AND p.projectName LIKE ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);

                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);

                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user);
                searchProjectResult.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return searchProjectResult;
    }
    
    public List<Project> getProjectsApproved() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.projectImage, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 1";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);
                String image1_path = rs.getString("image1_path");
                ProjectImages prj = new ProjectImages(image1_path);
                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user, prj);
                list.add(project);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<String> getCategoryProject(int projectId) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT c.categoryName "
                + "FROM Category c "
                + "INNER JOIN project_categories p ON p.categoryId = c.categoryId "
                + "INNER JOIN Project i ON p.projectId = i.projectId "
                + "WHERE i.projectId = ?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("categoryName");
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

    public List<Project> getProjectsUnapproved() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT p.projectId, p.projectName, p.projectTarget, p.projectImage, p.donatedAmountOfMoney, p.projectStatus, p.projectDescription, p.startDate, p.endDate, p.isApproved , u.userId, u.fullName, u.userName, u.gender, u.dateOfBirth, u.avatar, u.email, u.phoneNumber, u.userStatus, u.dateCreated, u.userTypeId,i.image1_path "
                + "FROM Project p "
                + "INNER JOIN Users u ON p.userId = u.userId "
                + "INNER JOIN project_images i ON p.projectId = i.projectId "
                + "WHERE p.isApproved = 0";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String fullName = rs.getString("fullName");
                String userName = rs.getString("userName");
                byte gender = rs.getByte("gender");
                java.util.Date dateOfBirth = rs.getDate("dateOfBirth");
                String avatar = rs.getString("avatar");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String userStatus = rs.getString("userStatus");
                java.util.Date dateCreated = rs.getDate("dateCreated");
                int userTypeId = rs.getInt("userTypeId");
                Users user = new Users(userId, fullName, userName, gender, dateOfBirth, avatar, email, phoneNumber, userStatus, dateCreated, userTypeId);
                String image1_path = rs.getString("image1_path");
                ProjectImages prj = new ProjectImages(image1_path);
                Project project = new Project(rs.getInt("projectId"), rs.getString("projectName"), rs.getBigDecimal("projectTarget"), rs.getBigDecimal("donatedAmountOfMoney"), rs.getString("projectStatus"), rs.getString("projectDescription"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getByte("isApproved"), user, prj);
                list.add(project);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Project> getListByPage(List<Project> list, int start, int end) {
        List<Project> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
            return rowsAffected > 0; // Check if any rows were affected by the update operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while update the project.", ex);
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
            logger.log(Level.SEVERE, "An error occurred while deleting the project!", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found!", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteFeedback(int projectId) {
        String sql = "DELETE FROM Feedback WHERE projectId=?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the project!", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found!", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteCategories(int projectId) {
        String sql = "DELETE FROM project_categories WHERE projectId=?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the project!", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found!", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean deleteImages(int projectId) {
        String sql = "DELETE FROM project_images WHERE projectId=?";
        try {
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Check if any rows were affected by the delete operation
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the project!", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found!", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public boolean isProjectOnDonate(int projectId) {
        String sql = "select donatedAmountOfMoney  FROM Project WHERE projectId=?";
        try {
            ResultSet resultSet = null;
            conn = new DonationDBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                return resultSet.getBigDecimal("donatedAmountOfMoney").compareTo(BigDecimal.ZERO) > 0;

            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occurred while deleting the project!", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found!", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
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
            logger.log(Level.SEVERE, "An error occurred while deleting the projects.", ex);
            return false;
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, "Database driver class not found.", ex);
            return false;
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    public void saveProject(Project project) throws Exception {
        String insertProjectSql = "INSERT INTO Project (projectName, projectTarget, "
                + "donatedAmountOfMoney, projectStatus, projectDescription, "
                + "startDate, endDate,isApproved, userId, charityOrganizationId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement insertProjectStmt = conn.prepareStatement(insertProjectSql)) {

            insertProjectStmt.setString(1, project.getProjectName());
            insertProjectStmt.setBigDecimal(2, project.getProjectTarget());
            insertProjectStmt.setDouble(3, 0);
            insertProjectStmt.setString(4, "pending");
            insertProjectStmt.setString(5, project.getProjectDescription());
            insertProjectStmt.setDate(6, new java.sql.Date(project.getStartDate().getTime()));
            insertProjectStmt.setDate(7, new java.sql.Date(project.getEndDate().getTime()));
            insertProjectStmt.setByte(8, (byte) 0);
            insertProjectStmt.setInt(9, project.getUserId());
            insertProjectStmt.setInt(10, project.getCharityOrganizationId());
            insertProjectStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
        }
    }

    public int getIdByProjectName(String us) throws Exception {
        conn = new DonationDBContext().getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            String sql = "SELECT projectId FROM Project WHERE projectName=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, us);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("projectId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý các ngoại lệ khác nếu cần
        }

        return 0;
    }

    public boolean isProjectNameExists(String projectName) throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) AS count FROM Project WHERE projectName = ?";
        conn = new DonationDBContext().getConnection();

        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, projectName);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
            throw e;
        } finally {
            // Đóng kết nối nếu cần
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public void saveProjectImages(int projectId, String image1Path, String image2Path, String image3Path, String image4Path) throws Exception {
        String sql = "INSERT INTO project_images (projectId, image1_path, image2_path, image3_path, image4_path) VALUES (?, ?, ?, ?, ?)";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, projectId);
            preparedStatement.setString(2, image1Path);
            preparedStatement.setString(3, image2Path);
            preparedStatement.setString(4, image3Path);
            preparedStatement.setString(5, image4Path);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
        }
    }

    public boolean areImagesPathsExist(String image1Path, String image2Path, String image3Path, String image4Path) throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) AS count FROM project_images WHERE image1_path IN (?, ?, ?, ?) OR image2_path IN (?, ?, ?, ?) OR image3_path IN (?, ?, ?, ?) OR image4_path IN (?, ?, ?, ?)";
        conn = new DonationDBContext().getConnection();

        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            // Thiết lập tham số cho mỗi ảnh
            for (int i = 1; i <= 4; i++) {
                preparedStatement.setString(i, image1Path);
                preparedStatement.setString(i + 4, image2Path);
                preparedStatement.setString(i + 8, image3Path);
                preparedStatement.setString(i + 12, image4Path);
            }

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
            throw e;
        }

        return false;
    }

    public ProjectImages getImagePathsByProjectId(int projectId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT image1_path, image2_path, image3_path, image4_path FROM project_images WHERE projectId = ?";
        conn = new DonationDBContext().getConnection();
        ProjectImages pr = null;

        try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setInt(1, projectId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                pr = new ProjectImages();
                pr.setImage1_path(resultSet.getString("image1_path"));
                pr.setImage2_path(resultSet.getString("image2_path"));
                pr.setImage3_path(resultSet.getString("image3_path"));
                pr.setImage4_path(resultSet.getString("image4_path"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
            throw e;
        }

        return pr;
    }

    public void addCategoriesProject(int projectId, List<Category> selectedCategories) throws Exception {
        String sql = "INSERT INTO project_categories (projectId, categoryId) VALUES (?, ?)";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            for (Category category : selectedCategories) {
                statement.setInt(1, projectId);
                statement.setInt(2, category.getCategoryId());
                statement.addBatch();
            }

            // Thực hiện một lô (batch) các thêm mới
            statement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addProjectMilesStone(String projectMilestoneName, String description, int projectId, int userId) throws Exception {
        String sql = "INSERT INTO ProjectMilestoneGift (projectMilestoneGiftName,description,projectId,userId) VALUES (?,?,?,?)";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, projectMilestoneName);
            statement.setString(2, description);
            statement.setInt(3, projectId);
            statement.setInt(4, userId);

            // Thực hiện một lô (batch) các thêm mới
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ProjectMilestoneGift> getProjectMilestoneGiftsByProjectId(int projectId) {
        List<ProjectMilestoneGift> milestoneGifts = new ArrayList<>();
        String sql = "SELECT * FROM ProjectMilestoneGift WHERE projectId = ?";

        try ( PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, projectId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int milestoneId = resultSet.getInt("projectMilestoneGiftId");
                String projectMilestoneGiftName = resultSet.getString("projectMilestoneGiftName");
                String description = resultSet.getString("description");
                int userId = resultSet.getInt("userId");

                // Tạo một đối tượng ProjectMilestoneGift từ dữ liệu trong cơ sở dữ liệu và thêm vào danh sách
                ProjectMilestoneGift milestoneGift = new ProjectMilestoneGift(milestoneId, projectMilestoneGiftName, description, projectId, userId);
                milestoneGifts.add(milestoneGift);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return milestoneGifts;
    }

    public Project getProjectById(int projectId) throws SQLException, ClassNotFoundException {
        Project project = null;
        String query = "SELECT * FROM Project WHERE projectId = ?";
        conn = new DonationDBContext().getConnection();
        try ( PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, projectId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                project = new Project();
                project.setProjectId(resultSet.getInt("projectId"));
                project.setProjectName(resultSet.getString("projectName"));
                project.setProjectTarget(resultSet.getBigDecimal("projectTarget"));
                project.setDonatedAmountOfMoney(resultSet.getBigDecimal("donatedAmountOfMoney"));
                project.setProjectStatus(resultSet.getString("projectStatus"));
                project.setProjectDescription(resultSet.getString("projectDescription"));
                project.setStartDate(resultSet.getDate("startDate"));
                project.setEndDate(resultSet.getDate("endDate"));
                project.setIsApproved(resultSet.getByte("isApproved"));
                project.setUserId(resultSet.getInt("userId"));
                project.setCharityOrganizationId(resultSet.getInt("charityOrganizationId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return project;
    }

    public boolean addProjectProcess(ProjectProcess projectProcess) throws SQLException, ClassNotFoundException {
        conn = new DonationDBContext().getConnection();
        try {
            String sql = "INSERT INTO ProjectProcess (updateDate,moneyCost,description,userId,charityOrganizationId,projectId,"
                    + "image_path1, image_path2, image_path3, image_path4,processName)  "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(11, projectProcess.getProcessName());
            statement.setDate(1, (Date) projectProcess.getUpdateDate());
            statement.setBigDecimal(2, projectProcess.getMoneyCost());
            statement.setString(7, projectProcess.getImage1());
            statement.setString(8, projectProcess.getImage2());
            statement.setString(9, projectProcess.getImage3());
            statement.setString(10, projectProcess.getImage4());
            statement.setString(3, projectProcess.getDescription());
            statement.setInt(4, projectProcess.getUserId());
            statement.setNull(5, java.sql.Types.INTEGER);
            statement.setInt(6, projectProcess.getProjectId());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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
        System.out.println(projectDAO.getProjectsApproved());
    }
}
