package tool;

import java.sql.*;

public class JDBConnection {
	private String dbDriver = "org.sqlite.JDBC"; // 连接驱动
	private static final String FILENAME = "F:/sqlitestudio/guitar";
//	private String url = "jdbc:odbc:guitar";  // URL数据库地址ַ

	public Connection connection = null;

	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // 建立实例
			connection = DriverManager.getConnection("jdbc:sqlite:"+FILENAME); // 账户信息
		} catch (Exception ex) {
			System.out.println("连接失败");
		}
		System.out.println("连接成功");
	}
}
