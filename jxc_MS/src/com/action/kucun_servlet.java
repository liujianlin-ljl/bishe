package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orm.Cangku;
import com.orm.Kucun;
import com.orm.Tgoods;
import com.service.KuCunService;
import com.service.liuService;
import com.service.loginService;

/**
 * ���Servlet
 * 
 * @author ljl
 *
 */
public class kucun_servlet extends HttpServlet {
	// public void service(HttpServletRequest req, HttpServletResponse res) throws
	// ServletException, IOException {
	// String type=req.getParameter("kucunMana");
	// System.out.println("���������"+type);
	// if("kucunMana".equals(type)) {
	// kucunMana(req,res);
	// }
	// List<Integer> goods_id_list = liuService.getAllGoods_id();
	// List<String> goods_id_list=new ArrayList<>();
	// try {
	// //��ȡĳ���ֿ��е�������Ʒid
	// goods_id_list = liuService.getAllGoodsIdByCangkuId(cangku_id);
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// for (int i = 0; i < goods_id_list.size(); i++) {
	// String goods_id = goods_id_list.get(i);
	// //��ȡ�������
	// int kucunShuliang = liuService.getGoodsRukuShuliang(goods_id, cangku_id) -
	// liuService.getGoodsChukuShuliang(goods_id,cangku_id);
	//
	// Kucun kucun = new Kucun();
	// kucun.setGoods_id(goods_id);
	// kucun.setKucun(kucunShuliang);
	// kucun.setGoods_name(liuService.getGoodsName(goods_id));
	// kucunList.add(kucun);
	// }
	// }
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String type = req.getParameter("type");// ����
		System.out.println("���������" + type);
		try {
			if (type.endsWith("kucunMana")) {
				kucunMana(req, res);
			}
			if (type.endsWith("updatejiage")) {
				System.out.println("����ţ�" + req.getParameter("kucun_id"));
				System.out.println("����۸�" + req.getParameter("chuku_price"));
				updatejiage(req, res);
			}
			if (type.endsWith("getdanjia")) {
				getdanjia(req, res);
			}

		} catch (Exception e) {
			req.setAttribute("msg", "�����������");
			dispatch("/common/msg.jsp", req, res);
		}

	}

	private void getdanjia(HttpServletRequest req, HttpServletResponse res) {
		String goods_id = req.getParameter("goodsId");
		int cangku_id = Integer.parseInt(req.getParameter("cangkuId"));
		try {
			Kucun kc = KuCunService.getKucunByGoodsIdAndCangkuId(goods_id, cangku_id);
			if (kc != null) {
				// ������ص��ַ�����������
				res.setCharacterEncoding("utf-8");
				PrintWriter out = res.getWriter();
				// ���������������
				StringBuilder json = new StringBuilder();

				json.append("{");
				json.append("\"price" + "\":\"" + kc.getChuku_price() +"\",\"kucun" + "\":\"" + kc.getKucun() + "\"");
				json.append("}");
				out.print(json);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void updatejiage(HttpServletRequest req, HttpServletResponse res) {
		int kucun_id = Integer.parseInt(req.getParameter("kucun_id"));
		try {
			int chuku_price = Integer.parseInt(req.getParameter("chuku_price"));
			KuCunService.updateChukuPrice(kucun_id, chuku_price);
			req.setAttribute("msg", "�۸�����ɹ�");
		} catch (Exception e) {
			req.setAttribute("msg", "�۸��ʽ�����޸�ʧ��");
		}
		dispatch("/common/msg.jsp", req, res);
	}

	private void kucunMana(HttpServletRequest req, HttpServletResponse res) {
		List<Kucun> kucunList = new ArrayList<>();
		String caozuo=req.getParameter("caozuo");//����
		int cangku_id = Integer.parseInt(req.getParameter("cangku_id"));
		String cangku_name = req.getParameter("cangku_name");// �ֿ���
		System.out.println("�ֿ�id��" + cangku_id);
		try {
			kucunList = KuCunService.getKucunAll(cangku_id);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if (cangku_id == 0) {
			Cangku cangku = new Cangku(0, "�ֿܲ�", "", "", "", loginService.getCangkuSize(), "");
			req.setAttribute("cangku", cangku);
		} else {
			req.setAttribute("cangku", loginService.getCangku(cangku_id));
		}
		req.setAttribute("kucunList", kucunList);
		req.setAttribute("size", kucunList.size());
		try {
			if (caozuo.equals("cangku_goods")) {
				req.setAttribute("cangku_name", cangku_name);
				req.getRequestDispatcher("admin/cangku/cangku_goods.jsp").forward(req, res);
			} else {
				req.getRequestDispatcher("admin/kucun/kucunMana.jsp").forward(req, res);
			}
		} catch (Exception e) {
			try {
				req.getRequestDispatcher("admin/kucun/kucunMana.jsp").forward(req, res);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
