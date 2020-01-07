package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库连接类
 * @author ljl
 *
 */
public class DB {
	
	private Connection con;
	private PreparedStatement pstm;

	//sqlServer连接数据库
	// private String user="sa";
	// private String password="123";
	// private String className =
	// "com.microsoft.sqlserver.jdbc.SQLServerDriver";//驱动程序名称
	// private String url =
	// "jdbc:sqlserver://localhost:1433;databaseName=db_jxc";//连接字符串
	//mysql连接数据库
	private String user = "root";
	private String password = "123456";
	private String className = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql:///jxc_ms";
	/**
	 * 构造方法
	 * 数据库连接，加载数据库驱动
	 */
	public DB() {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库连接
	 * @return
	 */
	public Connection getCon() {
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("创建数据库连接失败！");
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * 执行sql操作
	 * @param sql SQL预处理语句
	 * @param params
	 */
	public void doPstm(String sql, Object[] params) {
		if (sql != null && !sql.equals("")) {
			if (params == null)
				params = new Object[0];

			getCon();// 获取连接
			if (con != null) {
				try {
					System.out.println(sql);
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++) {
						pstm.setObject(i + 1, params[i]);
					}
					pstm.execute();// 执行SQL语句
				} catch (SQLException e) {
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 获取结果集
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getRs() throws SQLException {
		return pstm.getResultSet();
	}

	/**
	 * 获取更新条数
	 * @return
	 * @throws SQLException
	 */
	public int getCount() throws SQLException {
		return pstm.getUpdateCount();
	}

	/**
	 * 关闭资源
	 */
	public void closed() {
		try {
			if (pstm != null)
				pstm.close();
		} catch (SQLException e) {
			System.out.println("关闭pstm对象失败！");
			e.printStackTrace();
		}
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
