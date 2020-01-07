package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.DB;
import com.orm.Kucun;
import com.orm.TAdmin;
import com.orm.Tgoods;
import com.orm.TrukuMingxi;
import com.orm.Tchuku;
import com.orm.TchukuMingxi;
import com.orm.Yuangong;
import com.service.KuCunService;
import com.service.MingxiService;
import com.service.liuService;
/**
 * ����Servlet
 * @author ljl
 *
 */
public class chuku_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//��ȡ�������
		String type = req.getParameter("type");

		if (type.endsWith("chukuAdd")) {
			chukuAdd(req, res);//��ӳ���
		}
		if (type.endsWith("chukuMana")) {
			chukuMana(req, res);//�鿴������Ϣ
		}
		if (type.endsWith("chukuDel")) {
			chukuDel(req, res);//ɾ��������Ϣ
		}

		if (type.endsWith("chukuMingxiAdd")) {
			chukuMingxiAdd(req, res);//��ӳ�����ϸ
		}
		if (type.endsWith("chukuMingxiMana")) {
			chukuMingxiMana(req, res);//�鿴������ϸ
		}
		if (type.endsWith("chukuMingxiDel")) {
			chukuMingxiDel(req, res);//ɾ��������ϸ
		}
		if(type.endsWith("findChukuMingxi")) {
			findChukuMingxi(req,res);
		}
	}
	/**
	 * ����ģ����ѯ
	 * @param req
	 * @param res
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findChukuMingxi(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<TchukuMingxi> ck=new ArrayList<>();
		String goodsName=req.getParameter("goodsName");
		String danjuhao=req.getParameter("danjuhao");
		int minPrice=0;
		int maxPrice=0;
		try {
			minPrice=Integer.parseInt(req.getParameter("min"));
			maxPrice=Integer.parseInt(req.getParameter("max"));
			req.setAttribute("min", minPrice);
			req.setAttribute("max", maxPrice);
			ck=MingxiService.getChukuMingxi(goodsName,danjuhao,minPrice,maxPrice);
		} catch (Exception e) {
			try {
				ck=MingxiService.getChukuMingxi(goodsName,danjuhao,MingxiService.minPrice("chuku"),MingxiService.maxPrice("chuku"));
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		req.setAttribute("chukuMingxiList", ck);
		req.setAttribute("size", ck.size());
		req.setAttribute("goodsName", goodsName);
		req.setAttribute("danjuhao", danjuhao);
		req.getRequestDispatcher("admin/chuku/chukuMingxi.jsp").forward(req, res);
		
	}

	public void chukuAdd(HttpServletRequest req, HttpServletResponse res) {
		String danjuhao = req.getParameter("danjuhao");
		String shijian = req.getParameter("shijian");
		String jingshouren = req.getParameter("jingshouren");
		String beizhu = req.getParameter("beizhu");
		String customer_id = req.getParameter("customer_id");
		//String lianxi = req.getParameter("lianxi");
		String del = "no";
		// ʱ��ת�����ڸ�ʽ
		Date date = new Date();
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(shijian);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String sql = "insert into t_chuku(danjuhao,shijian,jingshouren,beizhu,customer_id,del) values(?,?,?,?,?,?)";
		Object[] params = { danjuhao, date, jingshouren, beizhu,customer_id, del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "��ӳɹ�");
		req.setAttribute("path", "chuku?type=chukuMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	/**
	 * ɾ�����ⵥ
	 * @param req
	 * @param res
	 */
	public void chukuDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		//�ж��Ƿ���ϵͳ����Ա
		HttpSession session=req.getSession();
		int userType=Integer.parseInt(session.getAttribute("userType").toString());
		if(userType==0) {//����Ա
			String sql = "update t_chuku set del='yes' where id=?";
			Object[] params = { id };
			DB mydb = new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			
			req.setAttribute("message", "ɾ���ɹ�");
			req.setAttribute("path", "chuku?type=chukuMana");
		}
		if(userType==1) {
			String sql="select jingshouren from t_chuku where id="+id;
			Object[] params= {};
			DB mydb = new DB();
			mydb.doPstm(sql, params);
			try {
				ResultSet rs=mydb.getRs();
				if(rs.next()) {
					String jingshouren=rs.getString(1);
					Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
					if(jingshouren.equals(yuangong.getName())) {
						String sql2 = "update t_chuku set del='yes' where id=?";
						Object[] params2 = { id };
						mydb.doPstm(sql2, params2);
						req.setAttribute("message", "ɾ���ɹ�");
						req.setAttribute("path", "chuku?type=chukuMana");
					}else {
						req.setAttribute("message", "ɾ��ʧ�ܣ���û��Ȩ�޲����˶���������");
						req.setAttribute("path", "chuku?type=chukuMana");
					}
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			mydb.closed();
		}

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void chukuMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Tchuku> chukuList = new ArrayList<>();
		String sql = "select c.id,c.danjuhao,c.shijian,c.jingshouren,c.beizhu,m.c_name,m.c_tel from t_chuku c,t_customer m where c.customer_id=m.id AND  c.del='no'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tchuku chuku = new Tchuku();
				chuku.setId(rs.getInt("id"));
				chuku.setDanjuhao(rs.getString("danjuhao"));
				chuku.setShijian(rs.getString("shijian"));
				chuku.setJingshouren(rs.getString("jingshouren"));
				chuku.setBeizhu(rs.getString("beizhu"));
				chuku.setCustomerName(rs.getString("c_name"));
				chuku.setCustomerTel(rs.getString("c_tel"));
				chukuList.add(chuku);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("chukuList", chukuList);
		req.setAttribute("size", chukuList.size());
		req.getRequestDispatcher("admin/chuku/chukuMana.jsp").forward(req, res);
	}

	public void chukuMingxiAdd(HttpServletRequest req, HttpServletResponse res) {

		int chuku_id = Integer.parseInt(req.getParameter("chuku_id"));
		String goods_id = req.getParameter("goods_id");
		int danjia = Integer.parseInt(req.getParameter("danjia"));
		int shuliang = Integer.parseInt(req.getParameter("shuliang"));
		int cangku_id=Integer.parseInt(req.getParameter("cangku_id"));
		String beizhu = req.getParameter("beizhu");
		Date time = new Date();
		// �������=�������-��������
		//int kucunshuliang = liuService.getGoodsRukuShuliang(goods_id,cangku_id) - liuService.getGoodsChukuShuliang(goods_id,cangku_id);
		//��ȡ��Ʒ���
		Kucun kc=null;
		try {
			kc = KuCunService.getKucunByGoodsIdAndCangkuId(goods_id, cangku_id);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// ��ȡʱ��time
		DB mydb = new DB();// �������ݿ�
		String getTimeSql = "select shijian from t_chuku where id=?";
		Object[] param = { chuku_id };
		try {
			mydb.doPstm(getTimeSql, param);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				time = rs.getDate("shijian");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ��ӳ�����ϸ
		if (shuliang <= kc.getKucun()) {// ����㹻
			String sql = "insert into t_chukuMingxi(chuku_id,goods_id,danjia,shuliang,beizhu,time,cangku_id) values(?,?,?,?,?,?,?)";
			Object[] params = { chuku_id, goods_id, danjia, shuliang, beizhu, time,cangku_id };
			mydb.doPstm(sql, params);
			mydb.closed();
			liuService.updateCangku("chuku", cangku_id, shuliang);//���²ֿ�����
			//���¿��
			kc.setKucun(kc.getKucun()-shuliang);
			kc.setChuku_price(danjia);
			KuCunService.updateKucun(kc);
			
			req.setAttribute("msg", "��Ʒ����ɹ�");
		} else {// ��治��
			req.setAttribute("msg", "����ʧ�ܣ���治��");
		}
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void chukuMingxiMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int chuku_id = Integer.parseInt(req.getParameter("chuku_id"));

		List<TchukuMingxi> chukuMingxiList = new ArrayList<>();
		String sql = "SELECT c.id,c.chuku_id,c.goods_id,g.`name`,c.danjia,c.shuliang,k.cangku_name FROM " + 
				"t_chukumingxi c,t_chuku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id "+
				" AND c.chuku_id=r.id AND chuku_id=? ORDER BY c.shuliang desc";
		Object[] params = {chuku_id};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				TchukuMingxi chukuMingxi = new TchukuMingxi();

				chukuMingxi.setId(rs.getInt("id"));
				chukuMingxi.setChuku_id(rs.getInt("chuku_id"));
				chukuMingxi.setGoods_id(rs.getString("goods_id"));
				chukuMingxi.setDanjia(rs.getInt("danjia"));
				chukuMingxi.setShuliang(rs.getInt("shuliang"));
				chukuMingxi.setJine(rs.getInt("danjia") * rs.getInt("shuliang"));
				chukuMingxi.setGoods_name(rs.getString("name"));
				chukuMingxi.setCangku_name(rs.getString("cangku_name"));

				chukuMingxiList.add(chukuMingxi);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		System.out.println(chukuMingxiList.size());
		req.setAttribute("chukuMingxiList", chukuMingxiList);
		req.setAttribute("chuku_id", chuku_id);
		req.getRequestDispatcher("admin/chuku/chukuMingxiMana.jsp").forward(req, res);
	}

	public void chukuMingxiDel(HttpServletRequest req, HttpServletResponse res) {
		
		int id = Integer.parseInt(req.getParameter("id"));//������ϸ���
		//�Ȼ�ȡ������ϸ�е���Ʒid������
		Map<String,Integer> goodsAndShuliang=MingxiService.getShuliangById("ruku", id);
		String goodsId="";
		int shuliang=0;
		int cangkuId=MingxiService.getCangkuIdById("ruku", id);//��ȡ�ֿ�id
		for (Map.Entry<String, Integer> entry : goodsAndShuliang.entrySet()) {
			goodsId=entry.getKey();
			shuliang=entry.getValue();
		}
		HttpSession session=req.getSession();
		int userType=Integer.parseInt(session.getAttribute("userType").toString());
		DB mydb = new DB();
		String sql="";
		Object[] params= {};
		if(userType==0) {//ϵͳ����Ա
			sql = "delete from t_chukuMingxi where id=" + id;
			mydb.doPstm(sql, params);
			//���¿��
//			Kucun kc=null;
//			try {
//				kc = KuCunService.getKucunByGoodsIdAndCangkuId(goodsId, cangkuId);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
			//ɾ��������ϸ�൱����Ʒ�������
//			kc.setKucun(kc.getKucun()+shuliang);
//			KuCunService.updateKucun(kc);
			//���²ֿ�����:ɾ��������ϸ�൱����Ʒ���
			//liuService.updateCangku("chuku", cangkuId, shuliang);
			
			req.setAttribute("message", "ɾ���ɹ�");
		}
		if(userType==1) {//����Ա
			//��ѯ�ó�����ϸ�ľ�����
			sql="SELECT jingshouren FROM t_chuku a,t_chukumingxi b WHERE a.id=b.chuku_id AND b.id="+id;
			mydb.doPstm(sql, params);
			try {
				ResultSet rs=mydb.getRs();
				if(rs.next()) {
					String jingshouren=rs.getString(1);
					Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
					if(jingshouren.equals(yuangong.getName())) {
						sql = "delete from t_chukuMingxi where id=" + id;
						mydb.doPstm(sql, params);
						//���¿��
//						Kucun kc=null;
//						try {
//							kc = KuCunService.getKucunByGoodsIdAndCangkuId(goodsId, cangkuId);
//						} catch (SQLException e) {
//							e.printStackTrace();
//						}
						//ɾ��������ϸ�൱����Ʒ�������
						//kc.setKucun(kc.getKucun()+shuliang);
						//KuCunService.updateKucun(kc);
						//���²ֿ�����:ɾ��������ϸ�൱����Ʒ���
						//liuService.updateCangku("chuku", cangkuId, shuliang);
						
						req.setAttribute("message", "ɾ���ɹ�");
						//req.setAttribute("path", "chuku?type=chukuMingxiMana");
					}else {
						req.setAttribute("message", "ɾ��ʧ�ܣ���û��Ȩ�޲����˶�����ϸ������");
						//req.setAttribute("path", "chuku?type=chukuMingxiMana");
					}
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		mydb.closed();
		req.setAttribute("path", "chuku?type=findChukuMingxi");
//		String targetURL = "/common/msg.jsp";
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void dispatch(String targetURI, HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try {
			dispatch.forward(request, response);
			return;
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void destroy() {

	}
}
