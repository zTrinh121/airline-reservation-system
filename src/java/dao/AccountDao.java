/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Admin;

/**
 *
 * @author HP
 */
public class AccountDao {

    public boolean checkAccountExist(String username, String password) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;

        PreparedStatement pre = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
        try {
            connection = db.openConnection();
            if(connection==null){
                System.out.println("Null ngay day");
            }
            pre = connection.prepareStatement(sql);

            pre.setString(1, username);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return this.isAdmin(username, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {

        }
        return false;
    }

    public boolean isAdmin(String adminId, String password) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;

//        if (connection == null) {
//            return false;
//        }
        System.out.println(adminId + " " + password);

        String sql = "SELECT * FROM [Admin] WHERE adminId = ? AND password = ?";
        try {
            connection = db.openConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, adminId);
            pre.setString(2, password);
            ResultSet resultSet = pre.executeQuery();
            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {

        }
        return false;
    }

    public boolean addUser(String fullname, String username, String password, String email, String phoneNumber, String address) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;

        try {
            connection = db.openConnection();
            String sql = "INSERT INTO Account (fullName, username, password, email, phoneNumber, address) VALUES (?, ?, ?, ?, ?, ?)";
            pre = connection.prepareStatement(sql);
            pre.setString(1, fullname);
            pre.setString(2, username);
            pre.setString(3, password);
            pre.setString(4, email);
            pre.setString(5, phoneNumber);
            pre.setString(6, address);

            int rowsAffected = pre.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public int getAccountIdByUsername(String username) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        int accountId = -1;
        try {
            connection = db.openConnection();
            String sql = "SELECT accountId FROM Account WHERE username =?";
            pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();

            if (rs.next()) {
                accountId = rs.getInt("accountId");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return accountId;
    }

    public String getUserRole(String username, String password) {
        if (isAdmin(username, password)) {
            return "admin";
        } else {
            return "user";
        }
    }
public Account getUserDetails(int accountId) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        Account account = null;

        try {
            connection = db.openConnection();
            String sql = "SELECT * FROM Account WHERE accountId = ?";
            pre = connection.prepareStatement(sql);
            pre.setInt(1, accountId);
            rs = pre.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccountID(rs.getInt("accountId"));
                account.setFullName(rs.getString("fullName"));
                account.setUserName(rs.getString("username"));
                account.setEmail(rs.getString("email"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
                account.setAddress(rs.getString("address"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
           
        }
        return account;
    }
public String getPasswordById(int accountId) {
    ConnectDB db = ConnectDB.getInstance();
    Connection connection = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    String password = null;

    try {
        connection = db.openConnection();
        String sql = "SELECT password FROM Account WHERE accountId = ?";
        pre = connection.prepareStatement(sql);
        pre.setInt(1, accountId);
        rs = pre.executeQuery();

        if (rs.next()) {
            password = rs.getString("password");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return password;
}
public boolean updateAccount(Account account) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;

        try {
            connection = db.openConnection();
            String sql = "UPDATE Account SET fullName = ?, email = ?, phoneNumber = ?, address = ? WHERE accountId = ?";
            pre = connection.prepareStatement(sql);
            pre.setString(1, account.getFullName());
            pre.setString(2, account.getEmail());
            pre.setString(3, account.getPhoneNumber());
            pre.setString(4, account.getAddress());
            pre.setInt(5, account.getAccountID());

            int rowsAffected = pre.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updatePassword(int accountId, String newPassword) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;

        try {
            connection = db.openConnection();
            String sql = "UPDATE Account SET password = ? WHERE accountId = ?";
            pre = connection.prepareStatement(sql);
            pre.setString(1, newPassword);
            pre.setInt(2, accountId);

            int rowsAffected = pre.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

        public Admin getAdminDetails(String adminId) {
    ConnectDB db = ConnectDB.getInstance();
    Connection connection = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    Admin admin = null;

    try {
        connection = db.openConnection();
        String sql = "SELECT * FROM Admin WHERE adminId = ?";
        pre = connection.prepareStatement(sql);
        pre.setString(1, adminId);
        rs = pre.executeQuery();

        if (rs.next()) {
            admin = new Admin();
            admin.setAdminId(rs.getString("adminId"));
            admin.setName(rs.getString("name"));
              admin.setEmail(rs.getString("email"));
            
            
            // Các thông tin khác của admin
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return admin;
}
        public boolean updateAdmin(Admin admin) {
    ConnectDB db = ConnectDB.getInstance();
    Connection connection = null;
    PreparedStatement pre = null;

    try {
        connection = db.openConnection();
        String sql = "UPDATE Admin SET name = ?, email = ? WHERE adminId = ?"; // Thêm điều kiện WHERE adminId = ?
        pre = connection.prepareStatement(sql);
        pre.setString(1, admin.getName());
        pre.setString(2, admin.getEmail());
        pre.setString(3, admin.getAdminId()); // Truyền adminId vào câu lệnh UPDATE

        int rowsAffected = pre.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return false;
}
        public String getPasswordByAdminId(String adminId) {
    ConnectDB db = ConnectDB.getInstance();
    Connection connection = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    String password = null;

    try {
        connection = db.openConnection();
        String sql = "SELECT password FROM Admin WHERE adminId = ?";
        pre = connection.prepareStatement(sql);
        pre.setString(1, adminId);
        rs = pre.executeQuery();

        if (rs.next()) {
            password = rs.getString("password");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return password;
}
       public boolean updatePasswordAdmin(String adminId, String newPassword) {
    ConnectDB db = ConnectDB.getInstance();
    Connection connection = null;
    PreparedStatement pre = null;

    try {
        connection = db.openConnection();
        String sql = "UPDATE Admin SET password = ? WHERE adminId = ?";
        pre = connection.prepareStatement(sql);
        pre.setString(1, newPassword);
        pre.setString(2, adminId);

        int rowsAffected = pre.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        return false; // Trả về false nếu có lỗi xảy ra
    } finally {
        try {
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

}




