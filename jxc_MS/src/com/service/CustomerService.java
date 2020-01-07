package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Customer;

/**
 * �ͻ�service
 * @author ljl
 *
 */
public class CustomerService {
	static DB db=null;
	static ResultSet rs=null;
	static String sql=null;
	static Customer cus=null;
	static {
		db=new DB();
		cus=new Customer();
	}
	/**
	 * ��ӿͻ�
	 * @return
	 */
	public static void addCustomer(Customer customer) {
		sql="insert into t_customer(id,c_name,c_sex,c_tel,c_type,del) values (?,?,?,?,?,?)";
		Object[] params= {customer.getId(),customer.getCname(),customer.getCsex(),
				customer.getCtel(),customer.getCtype(),customer.getDel()};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * ���ݿͻ���Ÿ��¿ͻ���Ϣ
	 * @param cus
	 * @return
	 */
	public static void updateCustomer(Customer cus) {
		sql="update t_customer set c_name=? ,c_sex=?,c_tel=?,c_type=?,del=? where id=?";
		Object[] params= {cus.getCname(),cus.getCsex(),cus.getCtel(),cus.getCtype(),cus.getDel(),cus.getId()};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * ���ݿͻ�id����״̬
	 * @param id
	 */
	public static void updateDel(String del,String id) {
		sql="update t_customer set del=? where id=?";
		Object[] params= {del,id};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * ���ݿͻ����ɾ���ͻ���Ϣ
	 * @param id
	 * @return
	 */
	public static void delCustomer(String id) {
		sql="delete from t_customer where id='"+id+"'";
		Object[] params= {};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * ��ȡ���еĿͻ���Ϣ
	 * @return
	 * @throws SQLException 
	 */
	public static List<Customer> getAllCustomer(String type) throws SQLException{
		List<Customer> cusList=new ArrayList<>();
		if("customerMana".equals(type)) {
			sql="select * from t_customer";
		}else{
			sql="select * from t_customer where del='no'";
		}
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			cus=getCustomerByResultSet(rs);
			cusList.add(cus);
		}
		for (Customer customer : cusList) {
			System.out.println(customer);
		}
		rs.close();
		db.closed();
		return cusList;
	}
	/**
	 * ͨ���������ȡ����
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public static Customer getCustomerByResultSet(ResultSet rs) throws SQLException {
		Customer customer=new Customer();
		customer.setId(rs.getString("id"));
		customer.setCname(rs.getString("c_name"));
		customer.setCsex(rs.getString("c_sex"));
		customer.setCtel(rs.getString("c_tel"));
		customer.setCtype(rs.getString("c_type"));
		customer.setDel(rs.getString("del"));
		return customer;
	}
	/**
	 * ���ݿͻ���Ų��ҿͻ���Ϣ
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public static List<Customer> findById(String id) throws SQLException {
		List<Customer> cusList=new ArrayList<>();
		sql="select * from t_customer where id='"+id+"'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			cus=getCustomerByResultSet(rs);
			
			cusList.add(cus);
		}
		rs.close();
		db.closed();
		return cusList;
	}
	/**
	 * ���ݿͻ��������ҿͻ���Ϣ
	 * @param name
	 * @return
	 * @throws SQLException 
	 */
	public static List<Customer> findByName(String name) throws SQLException {
		List<Customer> cusList=new ArrayList<>();
		sql="select * from t_customer where c_name like '%"+name+"%'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			cus=getCustomerByResultSet(rs);
			
			cusList.add(cus);
		}
		rs.close();
		db.closed();
		return cusList;
	}
	/**
	 * ���ݿͻ����Ͳ��ҿͻ���Ϣ
	 * @param type
	 * @return
	 * @throws SQLException 
	 */
	public static List<Customer> findByType(String type) throws SQLException {
		List<Customer> cusList=new ArrayList<>();
		sql="select * from t_customer where c_type='"+type+"'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			cus=getCustomerByResultSet(rs);
			
			cusList.add(cus);
		}
		rs.close();
		db.closed();
		return cusList;
	}
	/**
	 * �������������Ͳ���
	 * @param name
	 * @param type
	 * @return
	 * @throws SQLException 
	 */
	public static List<Customer> findByNameAndType(String name,String type) throws SQLException{
		List<Customer> cusList=new ArrayList<>();
		sql="select * from t_customer where c_name='"+name+"' and c_type='"+type+"'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			cus=getCustomerByResultSet(rs);
			
			cusList.add(cus);
		}
		rs.close();
		db.closed();
		return cusList;
	}

}
