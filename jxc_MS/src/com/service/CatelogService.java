package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Tcatelog;

/**
 * 分类service
 * @author ljl
 *
 */
public class CatelogService {
	static DB db=null;
	static ResultSet rs=null;
	static String sql=null;
	static Tcatelog ct=null;
	static {
		db=new DB();
		ct=new Tcatelog();
	}
	/**
	 * 更新分类名称
	 * @param catelog_id
	 */
	public static void updateCatelogName(String catelogName,int catelogId){
		sql="UPDATE t_catelog c SET c.`name`=? WHERE c.id=?";
		Object[] params= {catelogName,catelogId};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * 更新状态
	 * @param catelogId
	 */
	public static void updateDel(String del,int catelogId) {
		sql="UPDATE t_catelog c SET c.del=? WHERE c.id=?";
		Object[] params= {del,catelogId};
		db.doPstm(sql, params);
		db.closed();
	}
	/**
	 * 根据分类名称查找
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public static List<Tcatelog> getCatelogByName(String name) throws SQLException{
		List<Tcatelog> caList=new ArrayList<>();
		name=name==null?"":name;
		sql="SELECT * FROM t_catelog c WHERE c.`name` LIKE '%"+name+"%'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			Tcatelog ca=new Tcatelog();
			ca.setId(rs.getInt("id"));
			ca.setName(rs.getString("name"));
			ca.setDel(rs.getString("del"));
			
			caList.add(ca);
		}
		rs.close();
		db.closed();
		return caList;
	}
	
	public static List<Tcatelog> getCatelogByDel(String del) throws SQLException{
		List<Tcatelog> caList=new ArrayList<>();
		//del=(del==""||del==null)?"no":del;
		sql="select * from t_catelog c where del='"+del+"'";
		Object[] params= {};
		db.doPstm(sql, params);
		rs=db.getRs();
		while(rs.next()) {
			Tcatelog ca=new Tcatelog();
			ca.setId(rs.getInt("id"));
			ca.setName(rs.getString("name"));
			ca.setDel(rs.getString("del"));
			
			caList.add(ca);
		}
		rs.close();
		db.closed();
		return caList;
	}
}
