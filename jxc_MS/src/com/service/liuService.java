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
 * ������service
 * @author ljl
 *
 */
public class liuService {
	static DB mydb = null;
	static {
		mydb = new DB();
	}
	/**
	 * ����id��ȡ��Ʒ��������
	 * 
	 * @param id ����id
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
	 * ����id��ȡ��Ʒ����
	 * @param id ��Ʒid
	 * @return ������Ʒ����
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
	 * ������Ʒ��Ż�ȡ��Ʒ�۸�
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
	 * ��ȡ������Ʒid---��id���浽list������
	 * @return ����List����
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
	 * ������Ʒid��ȡ�ض���Ʒ���������
	 * @param goods_id ��Ʒid
	 * @return �����������
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
	 * ������Ʒid��ȡ�ض���Ʒ�ĳ�������
	 * @param goods_id ��Ʒid
	 * @param cangku_id ���cangku_id=0��ʾ�ֿܲ�
	 * @return ���س�������
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
	 * ����id��ȡ��Ӧ��
	 * @param id  ��Ӧ��id
	 * @return ���ع�Ӧ�̶���
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
	 * ��ȡĳ��ÿ�µ�����ܽ��--��׼��һ������Ϊ12�����飬����ѯ�����·������װ��ͳ����Tongji�У�
	 * �ٽ�ͳ�ƶ��󱣴浽�����У�û�����ݵ�λ�ý�����Ϊ0���·ݶ�Ӧ���������ת����List����
	 * @param year  �·�:1-12
	 * @return �������ͳ��List
	 */
	public static List<Tongji> getRukuMoney(int year,int cangku_id) {
		List<Tongji> tongjiRukuList = new ArrayList<Tongji>();
		Tongji tongjiArr[] = new Tongji[12];
		String sql="";
		if(cangku_id==0) {//�ֿܲ�
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_rukumingxi where year(time)= "+year+" group by month (time) ";
		}else {//�ֲֿ�
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
				tongjiArr[rs.getInt(1) - 1] = tongji;// -1��ֹ�����±�Խ���쳣
				// tongjiRukuList.add(tongji);
			}
			rs.close();
			for (int i = 0; i < tongjiArr.length; i++) {
				if (tongjiArr[i] == null) {
					tongjiArr[i] = new Tongji(i + 1, new BigDecimal(0));
				}
			}
			tongjiRukuList = Arrays.asList(tongjiArr);// ������ת����list����

		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		return tongjiRukuList;
	}

	/**
	 * ��ȡĳ��ÿ�µĳ����ܽ��
	 * @param year ���
	 * @return
	 */
	public static List<Tongji> getChukuMoney(int year,int cangku_id) {
		List<Tongji> tongjiChukuList = new ArrayList<Tongji>();
		Tongji tongjiArr[] = new Tongji[12];
		String sql="";
		if(cangku_id==0) {//�ֿܲ�
			sql = "select month(time) as mon,sum(danjia*shuliang) as money from t_chukumingxi where year(time)= "+year+" group by month (time) ";
		}else {//�ֲֿ�
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
	 * ���²ֿ�����
	 * @param type   ���ͣ����/����
	 * @param cangku_id  �ֿ�id
	 * @param count  ����
	 * @return ����-1��ʾ���ʧ�ܣ������ʧ�ܣ�����1��ʾ���³ɹ�
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
					int size = rs.getInt("cangku_size");// ��ȡ�ֿ�ʣ������
					System.out.println("�ֿ�ʣ��������"+size+",���������"+count);
					if (size >= count) {
						sql = "update t_cangku set cangku_size=cangku_size-? where cangku_id=?";
					} else {
						return -1;// �޷����
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
	 * ���ݲֿ�id��ȡ�ֿ��е���Ʒ������
	 * @param cangku_id
	 * @return
	 * @throws SQLException 
	 */
	public static Map<Tgoods,Integer> getGoodsByCangkuId(int cangku_id) throws SQLException {
		Map<Tgoods,Integer> map=new HashMap<>();
		//��ȡ�ֿ��е���Ʒid����Ʒ������������������Ӷ��õ��ֿ�ĳ�ʼ����
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
		//���ݻ�ȡ����Ʒid�����Ʒ������
		mydb.closed();
		return map;
	}
	/**
	 * ��ȡ�ֿ������е���Ʒid
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
	 * ���ݲֿ�id��ȡһ���ֿ���Ϣ
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
