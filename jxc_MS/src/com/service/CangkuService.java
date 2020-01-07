package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Cangku;

/**
 * 仓库service
 * @author ljl
 *
 */
public class CangkuService {
	
	static DB db=null;
	static ResultSet rs=null;
	static String sql=null;
	static Cangku ck=null;
	static Object[] params= {};
	static {
		db=new DB();
		ck=new Cangku();
	}
	/**
	 * 根据仓库负责人查询
	 * @param master
	 * @return
	 * @throws SQLException 
	 */
	public static List<Cangku> getCangkuByMaster(String master) throws SQLException{
		List<Cangku> ckList=new ArrayList<>();
		sql="SELECT * FROM t_cangku c WHERE c.cangku_master LIKE '%"+master+"%' AND del ='no'";
		db.doPstm(sql, params);
		return getCangku(ckList, db.getRs());
	}
	
	public static List<Cangku> getCangku(List<Cangku> ck,ResultSet rs) throws SQLException {
		Cangku ca=new Cangku();
		while(rs.next()) {
			ca.setCangku_id(rs.getInt("cangku_id"));
			ca.setCangku_name(rs.getString("cangku_name"));
			ca.setCangku_master(rs.getString("cangku_master"));
			ca.setCangku_addr(rs.getString("cangku_addr"));
			ca.setCangku_tel(rs.getString("cangku_tel"));
			ca.setCangku_size(rs.getInt("cangku_size"));
			
			ck.add(ca);
		}
		rs.close();
		return ck;
	}
	/**
	 * 根据仓库地址查找
	 * @param addr
	 * @return
	 * @throws SQLException 
	 */
	public static List<Cangku> getCangkuByAddr(String addr) throws SQLException{
		List<Cangku> ckList=new ArrayList<>();
		sql="SELECT * FROM t_cangku c WHERE c.cangku_addr LIKE '%"+addr+"%' AND del ='no'";
		db.doPstm(sql, params);
		return getCangku(ckList, db.getRs());
	}
	/**
	 * 通过仓库容量查找
	 * @param min
	 * @param max
	 * @return
	 * @throws SQLException
	 */
	public static List<Cangku> getCangkuBySize(int min,int max) throws SQLException{
		List<Cangku> ckList=new ArrayList<>();
		sql="SELECT * FROM t_cangku c WHERE c.cangku_size between "+min+" AND "+max+" and del ='no'";
		db.doPstm(sql, params);
		return getCangku(ckList, db.getRs());
	}
	
	
	
}
