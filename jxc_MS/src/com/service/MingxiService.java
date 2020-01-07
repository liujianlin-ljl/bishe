package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dao.DB;
import com.orm.TchukuMingxi;
import com.orm.TrukuMingxi;
/**
 * �������ϸService
 * @author ljl
 *
 */
public class MingxiService {
	
	static DB mydb = null;
	static String sql="";
	static {
		mydb = new DB();
	}
	/**
	 * ��ȡ���еĳ���id�����id
	 * @param type ���ͣ�chuku��ruku
	 * @return ����id����
	 */
	public static List<Integer> getId(String type){
		List<Integer> idList=new ArrayList<>();
		String sql=null;
		Object[] param= {};
		try {
			if("chuku".equalsIgnoreCase(type)) {
				sql="select id from t_chuku";
			}else if("ruku".equalsIgnoreCase(type)) {
				sql="select id from t_ruku";
			}
			if(sql!=null) {
				mydb.doPstm(sql, param);
				ResultSet rs=mydb.getRs();
				while(rs.next()) {
					idList.add(rs.getInt("id"));
				}
				rs.close();
			}
		}catch(Exception e) {
			System.out.println("type���Ͳ�������");
		}
		mydb.closed();
		
		return idList;
	}
	/**
	 * ������ϸid��ȡ�ֿ�id
	 * @param id
	 * @return
	 */
	public static int getCangkuIdById(String type,int id) {
		if("ruku".equalsIgnoreCase(type)) {
			sql="SELECT cangku_id FROM t_rukumingxi WHERE id=?";
		}else if("chuku".equalsIgnoreCase(type)) {
			sql="SELECT cangku_id FROM t_chukumingxi WHERE id=?";
		}else {
			System.out.println("type�����������");
		}
		int cangkuId=0;
		Object[] params= {id};
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			if(rs.next()) {
				cangkuId=rs.getInt("cangku_id");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return cangkuId;
	}
	/**
	 * ������ϸid��ȡ��Ʒid������
	 * @param type ���ͣ��������
	 * @param id
	 * @return
	 */
	public static Map<String,Integer> getShuliangById(String type,int id) {
		Map<String,Integer> result=new HashMap<>();
		if("ruku".equalsIgnoreCase(type)) {
			sql="SELECT goods_id,shuliang FROM t_rukumingxi WHERE id="+id;
		}else if("chuku".equalsIgnoreCase(type)) {
			sql="SELECT goods_id,shuliang FROM t_chukumingxi WHERE id="+id;
		}else {
			System.out.println("type�����������");
		}
		Object[] params= {};
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			if(rs.next()) {
				result.put(rs.getString("goods_id"), rs.getInt("shuliang"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return result;
	}
	/**
	 * ��ȡ��Ʒ�����ϸ
	 * @param goodsName ��Ʒ���ƣ����Ϊ�����ѯ������Ʒ�������ϸ
	 * @return
	 * @throws SQLException
	 */
	public static List<TrukuMingxi>  getRukuMingxi(String goodsName,String danjuhao,int minPrice,int maxPrice) throws SQLException {
		List<TrukuMingxi> rukuMingxiList=new ArrayList<>();
		String sql=null;
		goodsName=goodsName==null?"":goodsName;
		System.out.println("���ݺţ�"+danjuhao);
		if(danjuhao!=null && !"".equals(danjuhao)) {
			sql="SELECT c.id,c.ruku_id,r.danjuhao,c.goods_id,g.`name`,c.danjia,c.shuliang,c.time,c.beizhu,c.cangku_id,k.cangku_name FROM " + 
					"t_rukumingxi c,t_ruku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id AND c.ruku_id=r.id AND "+
					" g.`name` like '%"+goodsName+"%' AND danjuhao='"+danjuhao+"' AND danjia BETWEEN "+minPrice+" AND "+maxPrice+" ORDER BY c.time";
		}else {
			sql="SELECT c.id,c.ruku_id,r.danjuhao,c.goods_id,g.`name`,c.danjia,c.shuliang,c.time,c.beizhu,c.cangku_id,k.cangku_name FROM " + 
					"t_rukumingxi c,t_ruku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id AND c.ruku_id=r.id AND "+
					" g.`name` like '%"+goodsName+"%' AND c.danjia BETWEEN "+minPrice+" AND "+maxPrice+" ORDER BY c.time";
		}
		Object[] params= {};
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		while(rs.next()) {
			TrukuMingxi rukuMingxi = getRukuMingxi(rs);
				
			rukuMingxiList.add(rukuMingxi);
		}
		rs.close();
		mydb.closed();
		return rukuMingxiList;
	}
	
	public static TrukuMingxi getRukuMingxi(ResultSet rs) throws SQLException {
		TrukuMingxi rukuMingxi = new TrukuMingxi();
		rukuMingxi.setId(rs.getInt("id"));
		rukuMingxi.setRuku_id(rs.getInt("ruku_id"));
		rukuMingxi.setDanjuhao(rs.getString("danjuhao"));
		rukuMingxi.setGoods_id(rs.getString("goods_id"));
		rukuMingxi.setDanjia(rs.getInt("danjia"));
		rukuMingxi.setShuliang(rs.getInt("shuliang"));
		rukuMingxi.setJine(rs.getInt("danjia") * rs.getInt("shuliang"));
		rukuMingxi.setTime(rs.getString("time"));
		rukuMingxi.setBeizhu(rs.getString("beizhu"));
		rukuMingxi.setGoods_name(rs.getString("name"));
		rukuMingxi.setCangku_name(rs.getString("cangku_name"));
		return rukuMingxi;
	}
		
	/**
	 * ��ȡ��Ʒ������ϸ
	 * @param goodsName ��Ʒ���ƣ����Ϊ�����ѯ������Ʒ�������ϸ
	 * @return
	 * @throws SQLException
	 */
	public static List<TchukuMingxi>  getChukuMingxi(String goodsName,String danjuhao,int minPrice,int maxPrice) throws SQLException {
		List<TchukuMingxi> chukuMingxiList=new ArrayList<>();
		String sql=null;
		goodsName=goodsName==null?"":goodsName;
		if(danjuhao!=null) {
			sql="SELECT c.id,c.chuku_id,r.danjuhao,c.goods_id,g.`name`,c.danjia,c.shuliang,c.time,c.beizhu,c.cangku_id,k.cangku_name FROM " + 
					"t_chukumingxi c,t_chuku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id AND c.chuku_id=r.id AND "+
					" g.`name` like '%"+goodsName+"%' AND danjuhao='"+danjuhao+"' AND danjia BETWEEN "+minPrice+" AND "+maxPrice+" ORDER BY c.time";
		}else {
			sql="SELECT c.id,c.chuku_id,r.danjuhao,c.goods_id,g.`name`,c.danjia,c.shuliang,c.time,c.beizhu,c.cangku_id,k.cangku_name FROM " + 
					"t_chukumingxi c,t_chuku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id AND c.chuku_id=r.id AND "+
					" g.`name` like '%"+goodsName+"%' AND c.danjia BETWEEN "+minPrice+" AND "+maxPrice+" ORDER BY c.time";
		}
			Object[] params= {};
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next()) {
				TchukuMingxi chukuMingxi = new TchukuMingxi();
				
				chukuMingxi.setId(rs.getInt("id"));
				chukuMingxi.setChuku_id(rs.getInt("chuku_id"));
				chukuMingxi.setDanjuhao(rs.getString("danjuhao"));
				chukuMingxi.setGoods_id(rs.getString("goods_id"));
				chukuMingxi.setDanjia(rs.getInt("danjia"));
				chukuMingxi.setShuliang(rs.getInt("shuliang"));
				chukuMingxi.setJine(rs.getInt("danjia") * rs.getInt("shuliang"));
				chukuMingxi.setTime(rs.getString("time"));
				chukuMingxi.setBeizhu(rs.getString("beizhu"));
				chukuMingxi.setGoods_name(rs.getString("name"));
				chukuMingxi.setCangku_name(rs.getString("cangku_name"));
				
				chukuMingxiList.add(chukuMingxi);
			}
			rs.close();
			mydb.closed();
		return chukuMingxiList;
	}
	/**
	 * ��ȡ��ߵ���
	 * @param type ���ͣ�ruku��chuku
	 * @return
	 */
	public static int maxPrice(String type) {
		String sql="";
		int maxPrice=0;
		if("ruku".equalsIgnoreCase(type)) {
			sql="SELECT MAX(danjia) FROM t_rukumingxi";
		}else if("chuku".equalsIgnoreCase(type)) {
			sql="SELECT MAX(danjia) FROM t_chukumingxi";
		}
		Object[] params= {};
		mydb.doPstm(sql, params);
		try {
			maxPrice=getPrice(mydb.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return maxPrice;
	}
	/**
	 * ��ȡ��͵���
	 * @param type
	 * @return
	 */
	public static int minPrice(String type) {
		String sql="";
		int minPrice=0;
		if("ruku".equalsIgnoreCase(type)) {
			sql="SELECT MIN(danjia) FROM t_rukumingxi";
		}else if("chuku".equalsIgnoreCase(type)) {
			sql="SELECT MIN(danjia) FROM t_chukumingxi";
		}
		Object[] params= {};
		mydb.doPstm(sql, params);
		try {
			minPrice=getPrice(mydb.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return minPrice;
	}
	/**
	 * ��ȡ�۸�
	 * @param rs
	 * @return
	 */
	public static int getPrice(ResultSet rs) {
		int price=0;
		try {
			if(rs.next()) {
				price=rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return price;
	}
	/**
	 * ͨ����Ʒ���ƺͲֿ����ƻ�ȡ�����ϸ�����Բ�ѯ��ĳ�ֿ���ĳ����Ʒ����ϸ
	 * @param goodsName
	 * @param cangkuName
	 * @return
	 * @throws SQLException 
	 */
	public static List<TrukuMingxi> getRukuMingxiByGoodsNameAndCangkuName(String goodsName,String cangkuName) throws SQLException{
		List<TrukuMingxi> rukuMingxiList=new ArrayList<>();
		goodsName=(goodsName==null)?"":goodsName;
		cangkuName=(cangkuName==null)?"":cangkuName;
		
		String sql="SELECT r.id,r.ruku_id,r2.danjuhao,r.goods_id,g.`name`,r.danjia,r.shuliang,r.time,r.beizhu,r.cangku_id,c.cangku_name " + 
				" FROM t_rukumingxi r,t_ruku r2,t_cangku c,t_goods g WHERE r.ruku_id=r2.id AND r.cangku_id=c.cangku_id AND " + 
				"r.goods_id=g.id AND g.`name` LIKE '%"+goodsName+"%' AND c.cangku_name LIKE '%"+cangkuName+"%'";
		Object[] params= {};
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		while(rs.next()) {
			TrukuMingxi rukuMingxi = getRukuMingxi(rs);
				
			rukuMingxiList.add(rukuMingxi);
		}
		rs.close();
		mydb.closed();
		return rukuMingxiList;
	}
	/**
	 * ͨ����Ʒ���ƺͲֿ����ƻ�ȡ������ϸ�����Բ�ѯ��ĳ�ֿ���ĳ����Ʒ����ϸ
	 * @param goodsName
	 * @param cangkuName
	 * @return
	 * @throws SQLException
	 */
	public static List<TchukuMingxi> getChukuMingxiByGoodsNameAndCangkuName(String goodsName,String cangkuName) throws SQLException{
		List<TchukuMingxi> chukuMingxiList=new ArrayList<>();
		goodsName=goodsName==null?"":goodsName;
		cangkuName=cangkuName==null?"":cangkuName;
		
		String sql="SELECT r.id,r.chuku_id,r2.danjuhao,r.goods_id,g.`name`,r.danjia,r.shuliang,r.time,r.beizhu,r.cangku_id,c.cangku_name " + 
				" FROM t_chukumingxi r,t_chuku r2,t_cangku c,t_goods g WHERE r.chuku_id=r2.id AND r.cangku_id=c.cangku_id AND " + 
				"r.goods_id=g.id AND g.`name` LIKE '%"+goodsName+"%' AND c.cangku_name LIKE '%"+cangkuName+"%'";
		Object[] params= {};
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		while(rs.next()) {
			TchukuMingxi chukuMingxi = new TchukuMingxi();
			
			chukuMingxi.setId(rs.getInt("id"));
			chukuMingxi.setChuku_id(rs.getInt("chuku_id"));
			chukuMingxi.setDanjuhao(rs.getString("danjuhao"));
			chukuMingxi.setGoods_id(rs.getString("goods_id"));
			chukuMingxi.setDanjia(rs.getInt("danjia"));
			chukuMingxi.setShuliang(rs.getInt("shuliang"));
			chukuMingxi.setJine(rs.getInt("danjia") * rs.getInt("shuliang"));
			chukuMingxi.setTime(rs.getString("time"));
			chukuMingxi.setBeizhu(rs.getString("beizhu"));
			chukuMingxi.setGoods_name(rs.getString("name"));
			chukuMingxi.setCangku_name(rs.getString("cangku_name"));
			
			chukuMingxiList.add(chukuMingxi);
		}
		rs.close();
		mydb.closed();
		return chukuMingxiList;
	}
	/**
	 * ��ȡƽ���۸�
	 * @param type
	 */
	public static int getAvgPrice(String type,String goodsId) {
		int price=0;
		if("ruku".equals(type)) {
			sql="SELECT AVG(danjia) price FROM t_rukumingxi WHERE goods_id=? GROUP BY goods_id";
		}else if("chuku".equals(type)) {
			sql="SELECT AVG(danjia) price FROM t_chukumingxi WHERE goods_id=? GROUP BY goods_id";
		}
		Object[] params= {goodsId};
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			if(rs.next()) {
				price=rs.getInt("price");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return price;
	}
	

}
