package com.ljl.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.beanutils.BeanUtils;

public class JdbcUtil {
	
	private static String config="src/main/resources/jdbc-mysql.properties";
	private static String className="";
	private static String url="";
	private static String user="";
	private static String password="";
	
	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;
	
	public static Connection getConnection() {
		return getConnection(config);
	}
	
	/**
	 * ��ȡ���ݿ����ӣ�ͨ��properties�ļ���ȡ���ݿ����ӵĲ���
	 * @param file �����ļ���·��
	 * @return ���Ӷ���
	 * @throws Exception 
	 */
	public static Connection getConnection(String conf){
		try {
			/**
			 * ��������������ȡ�����ļ�����ȡ���ݿ����Ӳ���
			 */
			InputStream in=new FileInputStream(conf);
			Properties pro=new Properties();
			pro.load(in);
			className=pro.getProperty("driverClass");
			url=pro.getProperty("url");
			user=pro.getProperty("user");
			password=pro.getProperty("password");
			//ע������
			Class.forName(className);
			//��ȡ���ݿ�����
			con=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static Connection getConnection(InputStream in){
		try {
			Properties pro=new Properties();
			pro.load(in);
			className=pro.getProperty("driverClass");
			url=pro.getProperty("url");
			user=pro.getProperty("user");
			password=pro.getProperty("password");
			//ע������
			Class.forName(className);
			//��ȡ���ݿ�����
			con=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * ���µ�ͨ�÷�����ִ�к��Զ��ر����ӣ������ֶ��ر�
	 * @param sql ���µ�sql���(update/insert/delete)
	 * @param params sql�����ռλ����Ӧ�Ĳ���(���û��ռλ��������null)
	 */
	public static int update(String sql,Object[] params) {
		int row=0;//Ӱ������
		try {
			//����Ԥ����
			ps=con.prepareStatement(sql);
			//����ռλ������
			//�ж��Ƿ��в���
			if(params!=null) {
				for(int i=0;i<params.length;i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			System.out.println(sql);
			//ִ��sql��䣬���²���
			row=ps.executeUpdate();
			//�ͷ���Դ
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	/**
	 * ��ѯ��ͨ�÷�����ʹ��BeanUtils���߶Բ�ѯ�����ݽ��з�װ��ִ�в�ѯ���Զ��ر����ӣ������ֶ��ر�
	 * ������mysql���˷�����������oracle���ݿ⣨���ܷ�װ���ݣ�
	 * @param sql ��ѯ��SQL���
	 * @param params ռλ���Ĳ�����û�в�������null
	 * @param clazz Ҫ��װ���������
	 * @return �Żض�Ӧ���͵�list����
	 */
	public static <T> List<T> query(String sql,Object[] params,Class<T> clazz){
		//�������صļ���
		List<T> list=null;
		try {
			list = new ArrayList<T>();
			//��������
			T t=null;
			//����Ԥ����������
			ps=con.prepareStatement(sql);
			//����ռλ������
			if(params!=null && params.length!=0) {
				for(int i=0;i<params.length;i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			System.out.println(sql);
			//ִ��SQL��ѯ
			rs=ps.executeQuery();
			//��ȡ�����Ԫ����
			ResultSetMetaData rsmt=rs.getMetaData();
			//��ȡ�еĸ���
			int columCount=rsmt.getColumnCount();
			//���������
			while(rs.next()) {
				//��ȡҪ��װ�Ķ���
				t=clazz.newInstance();
				//����ÿһ�е�ÿһ��
				for(int i=0;i<columCount;i++) {
					//��ȡÿһ�е�����
					String columnName=rsmt.getColumnName(i+1);
					//��ȡÿһ�е����ƶ�Ӧ��ֵ
					Object value=rs.getObject(columnName);
					// ��װ�� ���õ�t�����������  ��BeanUtils�����
					BeanUtils.copyProperty(t, columnName, value);
				}
				//����װ�õĶ������list������
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	/**
	 * ��ѯͨ�÷�����ע�⣬�˷���ִ�к󲻻��Զ��ر���Դ����Ҫ�������ֶ��ر�
	 * @param sql ��ѯSQL���
	 * @param params ռλ������
	 * @return �����
	 */
	public static ResultSet query(String sql,Object[] params) {
		try {
			//��ȡԤ�������
			ps=con.prepareStatement(sql);
			//����ռλ������
			if(params!=null && params.length!=0) {
				for(int i=0;i<params.length;i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			System.out.println(sql);
			//ִ��SQL��ѯ
			rs=ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	/**
	 * �ͷ���Դ
	 */
	public static void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(ps!=null) {
				ps.close();
			}
			if(con!=null) {
				con.close();
			}
		} catch (SQLException e) {
			System.out.println("��Դ�ر�ʧ�ܣ�");
			e.printStackTrace();
		}
	}
	
	

}
