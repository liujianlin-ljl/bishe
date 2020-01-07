package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ���ݿ�������
 * @author ljl
 *
 */
public class DB {
	
	private Connection con;
	private PreparedStatement pstm;

	//sqlServer�������ݿ�
	// private String user="sa";
	// private String password="123";
	// private String className =
	// "com.microsoft.sqlserver.jdbc.SQLServerDriver";//������������
	// private String url =
	// "jdbc:sqlserver://localhost:1433;databaseName=db_jxc";//�����ַ���
	//mysql�������ݿ�
	private String user = "root";
	private String password = "123456";
	private String className = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql:///jxc_ms";
	/**
	 * ���췽��
	 * ���ݿ����ӣ��������ݿ�����
	 */
	public DB() {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			System.out.println("�������ݿ�����ʧ�ܣ�");
			e.printStackTrace();
		}
	}

	/**
	 * ��ȡ���ݿ�����
	 * @return
	 */
	public Connection getCon() {
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("�������ݿ�����ʧ�ܣ�");
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * ִ��sql����
	 * @param sql SQLԤ�������
	 * @param params
	 */
	public void doPstm(String sql, Object[] params) {
		if (sql != null && !sql.equals("")) {
			if (params == null)
				params = new Object[0];

			getCon();// ��ȡ����
			if (con != null) {
				try {
					System.out.println(sql);
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++) {
						pstm.setObject(i + 1, params[i]);
					}
					pstm.execute();// ִ��SQL���
				} catch (SQLException e) {
					System.out.println("doPstm()��������");
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * ��ȡ�����
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getRs() throws SQLException {
		return pstm.getResultSet();
	}

	/**
	 * ��ȡ��������
	 * @return
	 * @throws SQLException
	 */
	public int getCount() throws SQLException {
		return pstm.getUpdateCount();
	}

	/**
	 * �ر���Դ
	 */
	public void closed() {
		try {
			if (pstm != null)
				pstm.close();
		} catch (SQLException e) {
			System.out.println("�ر�pstm����ʧ�ܣ�");
			e.printStackTrace();
		}
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			System.out.println("�ر�con����ʧ�ܣ�");
			e.printStackTrace();
		}
	}
}
