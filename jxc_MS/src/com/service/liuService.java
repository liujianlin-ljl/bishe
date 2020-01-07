package com.service;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dao.DB;
import com.orm.Cangku;
import com.orm.Gongyingshang;
import com.orm.Tgoods;
import com.orm.Tongji;

/**
 * 工具类service
 * @author ljl
 *
 */
public class liuService {
	static DB mydb = null;
	static {
		mydb = new DB();
	}
	/**
	 * 根据id获取商品分类名称
	 * 
	 * @param id 分类id
	 * @return
	 */
	public static String getCatelogName(int id) {
		String catelog_name = "";

		String sql = "select * from t_catelog where id=" + id;
		Object[] params = {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			catelog_name = rs.getString("name");
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return catelog_name;
	}

	/**
	 * 根据id获取商品名称
	 * @param id 商品id
	 * @return 返回商品名称
	 */
	public static String getGoodsName(String id) {
		String name = "";

		String sql = "select * from t_goods where id=?";
		Object[] params = {id};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			name = rs.getString("name");
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return name;
	}
	/**
	 * 根据商品编号获取商品价格
	 * @param goodsId
	 * @return
	 */
	public static int getGoodsPrice(String goodsId) {
		int price=0;
		String sql="SELECT danjia FROM t_goods WHERE id=?";
		Object[] params= {goodsId};
		mydb.doPstm(sql, params);
		try {
			ResultSet rs=mydb.getRs();
			if(rs.next()) {
				price=rs.getInt("danjia");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return price;
	}

	/**
	 * 获取所有商品id---将id保存到list集合中
	 * @return 返回List集合
	 */
	public static List getAllGoods_id() {
		List<Integer> goods_id_List = new ArrayList<Integer>();
		String sql = "select id from t_goods where del='no'";
		Object[] params = {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				goods_id_List.add(rs.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return goods_id_List;
	}

	/**
	 * 根据商品id获取特定商品的入库数量
	 * @param goods_id 商品id
	 * @return 返回入库数量
	 */
	public static int getGoodsRukuShuliang(String goods_id,int cangku_id) {
		int shuliang = 0;
		String sql=null;
		if(cangku_id==0) {
			sql="select ifnull(sum(shuliang),0) from t_rukuMingxi where goods_id=?";
		}else {
			sql = "select ifnull(sum(shuliang),0) from t_rukuMingxi where goods_id=? and cangku_id="+cangku_id;
		}
		Object[] params = {goods_id};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			shuliang = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return shuliang;
	}

	/**
	 * 根据商品id获取特定商品的出库数量
	 * @param goods_id 商品id
	 * @param cangku_id 如果cangku_id=0表示总仓库
	 * @return 返回出库数量
	 */
	public static int getGoodsChukuShuliang(String goods_id,int cangku_id) {
		int shuliang = 0;
		String sql=null;
		if(cangku_id==0) {
			sql="select ifnull(sum(shuliang),0) from t_chukuMingxi where goods_id=?";
		}else {
			sql = "select ifnull(sum(shuliang),0) from t_chukuMingxi where goods_id=? and cangku_id="+cangku_id;
		}
		Object[] params = {goods_id};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			rs.next();
			shuliang = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return shuliang;
	}

	/**
	 * 根据id获取供应商
	 * @param id  供应商id
	 * @return 返回供应商对象
	 */
	public static Gongyingshang get_gongyingshang(int id) {
		Gongyingshang gongyingshang = new Gongyingshang();
		String sql = "select * from t_gongyingshang where id=?";
		Object[] params = { id };
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshang.setDel(rs.getString("del"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return gongyingshang;
	}

	/**
	 * 获取某年每月的入库总金额--先准备一个长度为12的数组，将查询到的月份与金额封装到统计类Tongji中，
	 * 再将统计对象保存到数组中，没有数据的位置金额填充为0，月份对应，最后将数组转换成List集合
	 * @param year  月份:1-12
	 * @return 返回入库统计List
	 */
	public static List<Tongji> getRukuMoney(int year,int cangku_id) {
		List<Tongji> tongjiRukuList = new ArrayList<Tongji>();
		Tongji tongjiArr[] = new Tongji[12];
		String sql="";
		if(cangku_id==0) {//总仓库
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_rukumingxi where year(time)= "+year+" group by month (time) ";
		}else {//分仓库
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_rukumingxi where year(time)= "+year+" and cangku_id="+cangku_id+" group by month (time) ";
		}
		Object[] params= {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tongji tongji = new Tongji();
				tongji.setMonth(rs.getInt(1));
				tongji.setMoney(new BigDecimal(rs.getDouble(2)));
				tongjiArr[rs.getInt(1) - 1] = tongji;// -1防止数据下标越界异常
				// tongjiRukuList.add(tongji);
			}
			rs.close();
			for (int i = 0; i < tongjiArr.length; i++) {
				if (tongjiArr[i] == null) {
					tongjiArr[i] = new Tongji(i + 1, new BigDecimal(0));
				}
			}
			tongjiRukuList = Arrays.asList(tongjiArr);// 将数组转换成list集合

		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return tongjiRukuList;
	}

	/**
	 * 获取某年每月的出库总金额
	 * @param year 年份
	 * @return
	 */
	public static List<Tongji> getChukuMoney(int year,int cangku_id) {
		List<Tongji> tongjiChukuList = new ArrayList<Tongji>();
		Tongji tongjiArr[] = new Tongji[12];
		String sql="";
		if(cangku_id==0) {//总仓库
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_chukumingxi where year(time)= "+year+" group by month (time) ";
		}else {//分仓库
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_chukumingxi where year(time)= "+year+" and cangku_id="+cangku_id+" group by month (time) ";
		}
		Object[] params= {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tongji tongji = new Tongji();
				tongji.setMonth(rs.getInt(1));
				tongji.setMoney(new BigDecimal(rs.getDouble(2)));
				// tongjiChukuList.add(tongji);
				tongjiArr[rs.getInt(1) - 1] = tongji;
			}
			rs.close();
			for (int i = 0; i < tongjiArr.length; i++) {
				if (tongjiArr[i] == null) {
					tongjiArr[i] = new Tongji(i + 1, new BigDecimal(0));
				}
			}
			tongjiChukuList = Arrays.asList(tongjiArr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return tongjiChukuList;
	}

	/**
	 * 更新仓库容量
	 * @param type   类型：入库/出库
	 * @param cangku_id  仓库id
	 * @param count  数量
	 * @return 返回-1表示入库失败，则更新失败，返回1表示更新成功
	 */
	public static int updateCangku(String type, int cangku_id, int count) {
		String sql = "";
		if (type.equals("ruku")) {
			String getSize = "select cangku_size from t_cangku where cangku_id=" + cangku_id;
			Object[] param = {};
			mydb.doPstm(getSize, param);
			try {
				ResultSet rs = mydb.getRs();
				if (rs.next()) {
					int size = rs.getInt("cangku_size");// 获取仓库剩余容量
					System.out.println("仓库剩余容量："+size+",入库数量："+count);
					if (size >= count) {
						sql = "update t_cangku set cangku_size=cangku_size-? where cangku_id=?";
					} else {
						return -1;// 无法入库
					}
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (type.equals("chuku")) {
			sql = "update t_cangku set cangku_size=cangku_size+? where cangku_id=?";
			return 1;
		}
		Object[] params = { count, cangku_id };
		mydb.doPstm(sql, params);
		mydb.closed();
		return 1;
	}
	/**
	 * 根据仓库id获取仓库中的商品及数量
	 * @param cangku_id
	 * @return
	 * @throws SQLException 
	 */
	public static Map<Tgoods,Integer> getGoodsByCangkuId(int cangku_id) throws SQLException {
		Map<Tgoods,Integer> map=new HashMap<>();
		//获取仓库中的商品id和商品数量，根据入库数量从而得到仓库的初始容量
		String sql="SELECT r.goods_id,g.name,r.shuliang FROM t_rukumingxi r,t_cangku c,t_goods g "+
					" WHERE r.cangku_id=c.cangku_id AND r.goods_id=g.id AND r.cangku_id="+cangku_id;
		//String sql="";
		Object[] params= {};
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		while(rs.next()) {
			Tgoods goods=new Tgoods();
			goods.setId(rs.getString("goods_id"));
			goods.setName(rs.getString("name"));
			int shuliang=rs.getInt("shuliang");
			map.put(goods, shuliang);
		}
		rs.close();
		//根据获取的商品id获得商品的名称
		mydb.closed();
		return map;
	}
	/**
	 * 获取仓库中所有的商品id
	 * @param cangku_id
	 * @return
	 * @throws SQLException 
	 */
	public static List<String> getAllGoodsIdByCangkuId(int cangku_id) throws SQLException{
		List<String> goodsIdList=new ArrayList<>();
		String sql="";
		if(cangku_id==0) {
			sql="SELECT DISTINCT r.goods_id FROM t_rukumingxi r,t_cangku c WHERE r.cangku_id=c.cangku_id ";
		}else {
			sql="SELECT DISTINCT r.goods_id FROM t_rukumingxi r,t_cangku c WHERE r.cangku_id=c.cangku_id AND c.cangku_id="+cangku_id;
		}
		Object[] params= {};
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		while(rs.next()) {
			goodsIdList.add(rs.getString(1));
		}
		rs.close();
		return goodsIdList;
	}
	/**
	 * 根据仓库id获取一个仓库信息
	 * @param cangku_id
	 * @return
	 */
	public static Cangku findCangkuById(int cangku_id) {
		Cangku cangku=new Cangku();
		String sql = "select * from t_cangku where cangku_id = ?";
		Object[] params = {cangku_id};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				cangku.setCangku_id(rs.getInt("cangku_id"));
				cangku.setCangku_name(rs.getString("cangku_name"));
				cangku.setCangku_master(rs.getString("cangku_master"));
				cangku.setCangku_tel(rs.getString("cangku_tel"));
				cangku.setCangku_addr(rs.getString("cangku_addr"));
				cangku.setCangku_size(rs.getInt("cangku_size"));
				System.out.println(cangku);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return cangku;
	}

}
