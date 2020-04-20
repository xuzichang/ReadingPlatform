package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库连接
 */

public class   DbConn {

    //连接数据库
    public  static Connection getConn(){

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("加载驱动程序错误"+e.getMessage());
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book?serverTimezone=UTC", "root", "root");
//            con = DriverManager.getConnection("jdbc:mysql://121.41.118.207/book?serverTimezone=UTC", "root", "WZCWXCWYH99620.");
        } catch (SQLException e) {
            System.out.println("数据库连接操作出错"+e.getMessage());
        }
        return con;
    }

    //关闭ResultSet，将从数据库查询的结果从缓存清空
    public static void RsClose(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //关闭Stmt，将预编译的数据库查询语句清空
    public static void StmtClose(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
                stmt = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //关闭Connection
    public static void ConnClose(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //关闭数据库
    public static void DbClose(Statement stmt,Connection conn) {
        StmtClose(stmt);
        ConnClose(conn);
    }

    //关闭数据库,顺序不能修改
    public static void DbClose(ResultSet rs,Statement stmt,Connection conn) {
        RsClose(rs);
        StmtClose(stmt);
        ConnClose(conn);
    }
}
