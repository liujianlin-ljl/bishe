package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Cangku;
import com.orm.Kucun;

/**
 * 库存service
 * 
 * @author ljl
 *
 */
public class KuCunService {

	static DB db = null;
	static ResultSet rs = null;
	static String sql = null;
	static Kucun cn = null;
	static {
		db = new DB();
		cn = new Kucun();
	}

	/**
	 * 插入商品库存
	 * 
	 * @param kucun
	 */
	// public static void insertKucun(String goodsId) {
	// sql="insert into t_kucun(goods_id,del) values(?,?)";
	// Object[] params= {goodsId,"yes"};
	// db.doPstm(sql, params);
	// db.closed();
	// }

	public static void innsertKucun(Kucun kc) {
		sql = "insert into t_kucun(goods_id,kucun,ruku_price,chuku_price,cangku_id,del) values(?,?,?,?,?,?)";
		Object[] params = { kc.getGoods_id(), kc.getKucun(), kc.getRuku_price(), kc.getChuku_price(), kc.getCangku_id(),
				kc.getDel() };
		db.doPstm(sql, params);
		db.closed();
	}

	/**
	 * 检查仓库中是否有指定的商品
	 * 
	 * @param goodsId
	 * @param cangku_id
	 * @return
	 * @throws SQLException
	 */
	public static Kucun getKucunByGoodsIdAndCangkuId(String goodsId, int cangku_id) throws SQLException {
		sql = "SELECT * FROM t_kucun WHERE goods_id=? AND cangku_id=?";
		Object[] params = { goodsId, cangku_id };
		db.doPstm(sql, params);
		try {
			cn = getKucun(db.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return cn;
	}

	public static void delKucun(String goodsId) {
		sql = "update t_kucun del=? where goods_id=?";
		Object[] params = { "yes", goodsId };
		db.doPstm(sql, params);
		db.closed();
	}

	/**
	 * 根据库存编号更新商品库存数量
	 */
	public static void updateKucun(Kucun kc) {
		sql = "update t_kucun set kucun_id=?,kucun=?,ruku_price=?,chuku_price=?,del=? where goods_id=? and cangku_id=?";
		Object[] params = { kc.getKucun_id(), kc.getKucun(), kc.getRuku_price(), kc.getChuku_price(),kc.getDel(), kc.getGoods_id(),kc.getCangku_id()};
		db.doPstm(sql, params);
		db.closed();
	}

	/**
	 * 更新某仓库中指定商品的库存数量
	 * 
	 * @param goodsId
	 * @param shuliang
	 */
	public static void updateGoodsKucun(String type, Kucun kc) {
		sql = "update t_kucun set kucun=? where goods_id=? and kucun_id=?";
		Object[] params = { kc.getKucun(), kc.getGoods_id(), kc.getCangku_id() };
		db.doPstm(sql, params);
		db.closed();
	}

	/**
	 * 根据库存编号更新出库价格
	 * 
	 * @param kucun_id
	 * @param price
	 */
	public static void updateChukuPrice(int kucun_id, int price) {
		sql = "update t_kucun set chuku_price=? where kucun_id=?";
		Object[] params = { price, kucun_id };
		db.doPstm(sql, params);
		db.closed();
	}
	
	public static Kucun getKucunById(int kucun_id) {
		sql="select * from t_kucun where kucun_id=?";
		Object[] params= {kucun_id};
		db.doPstm(sql, params);
		try {
			cn = getKucun(db.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return cn;
	}

	/**
	 * 根据商品编号获取商品库存
	 * 
	 * @return
	 */
	public static Kucun getKucunByGoodsId(String goodsId) {
		sql = "select * from t_kucun where goods_id=?";
		Object[] params = { goodsId };
		db.doPstm(sql, params);
		try {
			cn = getKucun(db.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return cn;
	}

	/**
	 * 根据商品名称获取库存
	 * 
	 * @param goodsName
	 * @return
	 */
	public static Kucun getKucunByGoodsName(String goodsName) {
		sql = "select k.*,g.name from t_kucun k,t_goods g where k.goods_id=g.id and g.name=?";
		Object[] params = { goodsName };
		db.doPstm(sql, params);
		try {
			cn = getKucun(db.getRs());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return cn;
	}

	/**
	 * 根据仓库编号获取库存列表
	 * 
	 * @param cangkuId
	 * @return
	 * @throws SQLException
	 */
	public static List<Kucun> getKucunByCangkuId(int cangkuId) throws SQLException {
		sql = "select k.*,g.name from t_kucun k,t_goods g where k.goods_id=g.id and  cangku_id=?";
		Object[] params = { cangkuId };
		db.doPstm(sql, params);
		List<Kucun> kcList = getKucunList(db.getRs());
		db.closed();
		return kcList;
	}

	/**
	 * 获取全部库存列表
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static List<Kucun> getKucunAll(int cangkuId) throws SQLException {
		if(cangkuId==0) {
			sql = "SELECT k.*,g.`name` FROM t_kucun k,t_goods g WHERE k.goods_id=g.id ORDER BY cangku_id";
		}else {
			sql="SELECT k.*,g.`name` FROM t_kucun k,t_goods g WHERE k.goods_id=g.id AND k.cangku_id="+cangkuId+" ORDER BY k.goods_id";
		}
		Object[] params = {};
		db.doPstm(sql, params);
		List<Kucun> kcList = getKucunList(db.getRs());
		db.closed();
		return kcList;

	}

	/**
	 * 通过结果集获取单个商品库存
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public static Kucun getKucun(ResultSet rs) throws SQLException {
		Kucun kc = new Kucun();
		while (rs.next()) {
			kc.setKucun_id(rs.getInt("kucun_id"));
			kc.setGoods_id(rs.getString("goods_id"));
//			kc.setGoods_name(rs.getString("name"));
			kc.setKucun(rs.getInt("kucun"));
			kc.setRuku_price(rs.getInt("ruku_price"));
			kc.setChuku_price(rs.getInt("chuku_price"));
			kc.setCangku_id(rs.getInt("cangku_id"));
		}
		rs.close();
		return kc;
	}

	/**
	 * 根据结果集对象获取库存列表
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public static List<Kucun> getKucunList(ResultSet rs) throws SQLException {
		List<Kucun> kcList = new ArrayList<>();
		while (rs.next()) {
			Kucun kc = new Kucun();
			kc.setKucun_id(rs.getInt("kucun_id"));
			kc.setGoods_id(rs.getString("goods_id"));
			kc.setGoods_name(rs.getString("name"));
			kc.setKucun(rs.getInt("kucun"));
			kc.setRuku_price(rs.getInt("ruku_price"));
			kc.setChuku_price(rs.getInt("chuku_price"));
			kc.setCangku_id(rs.getInt("cangku_id"));

			kcList.add(kc);
		}
		rs.close();
		return kcList;
	}

}
