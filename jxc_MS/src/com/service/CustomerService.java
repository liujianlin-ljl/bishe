package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Customer;

/**
 * 客户service
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
	 * 添加客户
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
	 * 根据客户编号更新客户信息
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
	 * 根据客户id更新状态
	 * @param id
	 */
	public static void updateDel(String del,String id) {
		sql="update t_customer set del=? where id=?";
		Object[] params= {del,id};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * 根据客户编号删除客户信息
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
	 * 获取所有的客户信息
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
	 * 通过结果集获取对象
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
	 * 根据客户编号查找客户信息
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
	 * 根据客户姓名查找客户信息
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
	 * 根据客户类型查找客户信息
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
	 * 根据姓名和类型查找
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
