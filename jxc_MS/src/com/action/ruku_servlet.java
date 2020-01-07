package com.action;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.dao.DB;
import com.orm.Kucun;
import com.orm.Truku;
import com.orm.TrukuMingxi;
import com.orm.Yuangong;
import com.service.KuCunService;
import com.service.MingxiService;
import com.service.liuService;

/**
 * 入库Servlet
 * 
 * @author ljl
 *
 */
public class ruku_servlet extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String type = req.getParameter("type");// 获取请求参数
		try {
			if (type.endsWith("rukuAdd")) {
				rukuAdd(req, res);// 添加入库
			}
			if (type.endsWith("rukuMana")) {
				rukuMana(req, res);// 查看入库信息
			}
			if (type.endsWith("rukuDel")) {
				rukuDel(req, res);// 删除入库信息
			}
			if (type.endsWith("rukuMingxiAdd")) {
				rukuMingxiAdd(req, res);// 添加入库明细
			}
			if (type.endsWith("rukuMingxiMana")) {
				rukuMingxiMana(req, res);// 查看入库明细
			}
			if (type.endsWith("rukuMingxiDel")) {
				rukuMingxiDel(req, res);// 删除入库明细
			}
			if (type.endsWith("findRukuMingxi")) {
				findRukuMingxi(req, res);// 查询入库明细
			}
			if (type.endsWith("getPrice")) {// 获取入库商品单价
				getPrice(req, res);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "请求参数错误");
			dispatch("/common/msg.jsp", req, res);
		}
	}

	// 获取入库商品单价
	private void getPrice(HttpServletRequest req, HttpServletResponse res) {
		try {
			String goodsId = req.getParameter("goodsId");
			// int ruku_price=liuService.getGoodsPrice(goodsId);
			// 解决返回的字符串编码问题
			res.setCharacterEncoding("utf-8");
			PrintWriter out = res.getWriter();
			// 将数据流入输出流
			StringBuilder json = new StringBuilder();
			json.append("{");
			json.append("\"price" + "\":\"" + liuService.getGoodsPrice(goodsId) + "\"");
			json.append("}");
			out.print(json);
		} catch (IOException e) {
			req.setAttribute("msg", "请求错误");
			dispatch("/common/msg.jsp", req, res);
		}
	}

	private void findRukuMingxi(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<TrukuMingxi> rk = new ArrayList<>();
		String goodsName = req.getParameter("goodsName");
		String danjuhao = req.getParameter("danjuhao");
		int minPrice = 0;
		int maxPrice = 0;
		try {
			minPrice = Integer.parseInt(req.getParameter("min"));
			maxPrice = Integer.parseInt(req.getParameter("max"));
			req.setAttribute("min", minPrice);
			req.setAttribute("max", maxPrice);
			rk = MingxiService.getRukuMingxi(goodsName, danjuhao, minPrice, maxPrice);
		} catch (Exception e) {
			try {
				rk = MingxiService.getRukuMingxi(goodsName, danjuhao, MingxiService.minPrice("ruku"),
						MingxiService.maxPrice("ruku"));
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		req.setAttribute("rukuMingxiList", rk);
		req.setAttribute("size", rk.size());
		req.setAttribute("goodsName", goodsName);
		req.setAttribute("danjuhao", danjuhao);
		req.getRequestDispatcher("admin/ruku/rukuMingxi.jsp").forward(req, res);
	}

	public void rukuAdd(HttpServletRequest req, HttpServletResponse res) {
		int gongyingshang_id = Integer.parseInt(req.getParameter("gongyingshang_id"));
		String danjuhao = req.getParameter("danjuhao");
		String shijian = req.getParameter("shijian");
		// int zongjiage=Integer.parseInt(req.getParameter("zongjiage"));
		String jingshouren = req.getParameter("jingshouren");
		String beizhu = req.getParameter("beizhu");
		String del = "no";
		// 时间转换日期格式
		Date date = new Date();
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(shijian);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String sql = "insert into t_ruku(gongyingshang_id,danjuhao,shijian,jingshouren,beizhu,del) values(?,?,?,?,?,?)";
		Object[] params = { gongyingshang_id, danjuhao, date, jingshouren, beizhu, del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "添加成功");
		req.setAttribute("path", "ruku?type=rukuMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	/**
	 * 删除入库单
	 * 
	 * @param req
	 * @param res
	 */
	public void rukuDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		// 判断是否是系统管理员
		HttpSession session = req.getSession();
		int userType = Integer.parseInt(session.getAttribute("userType").toString());
		if (userType == 0) {// 管理员
			String sql = "update t_ruku set del='yes' where id=?";
			Object[] params = { id };
			DB mydb = new DB();
			mydb.doPstm(sql, params);
			mydb.closed();

			req.setAttribute("message", "删除成功");
			req.setAttribute("path", "ruku?type=rukuMana");
		}
		if (userType == 1) {
			String sql = "select jingshouren from t_ruku where id=" + id;
			Object[] params = {};
			DB mydb = new DB();
			mydb.doPstm(sql, params);
			try {
				ResultSet rs = mydb.getRs();
				if (rs.next()) {
					String jingshouren = rs.getString(1);
					Yuangong yuangong = (Yuangong) session.getAttribute("yuangong");
					if (jingshouren.equals(yuangong.getName())) {
						String sql2 = "update t_ruku set del='yes' where id=?";
						Object[] params2 = { id };
						mydb.doPstm(sql2, params2);
						req.setAttribute("message", "删除成功");
						req.setAttribute("path", "ruku?type=rukuMana");
					} else {
						req.setAttribute("message", "删除失败，您没有权限操作此订单！！！");
						req.setAttribute("path", "ruku?type=rukuMana");
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

	public void rukuMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List rukuList = new ArrayList();
		String sql = "select * from t_ruku where del='no'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Truku ruku = new Truku();
				ruku.setId(rs.getInt("id"));
				ruku.setGongyingshang_id(rs.getInt("gongyingshang_id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				ruku.setShijian(rs.getString("shijian"));
				// ruku.setZongjiage(rs.getInt("zongjiage"));
				ruku.setJingshouren(rs.getString("jingshouren"));
				ruku.setBeizhu(rs.getString("beizhu"));

				ruku.setGongyingshang(liuService.get_gongyingshang(rs.getInt("gongyingshang_id")));
				rukuList.add(ruku);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("rukuList", rukuList);
		req.setAttribute("size", rukuList.size());
		req.getRequestDispatcher("admin/ruku/rukuMana.jsp").forward(req, res);
	}

	public void rukuMingxiAdd(HttpServletRequest req, HttpServletResponse res) {

		int ruku_id = Integer.parseInt(req.getParameter("ruku_id"));
		String goods_id = req.getParameter("goods_id");
		int danjia = Integer.parseInt(req.getParameter("danjia"));
		int shuliang = Integer.parseInt(req.getParameter("shuliang"));
		int cangku_id = Integer.parseInt(req.getParameter("cangku_id"));
		String beizhu = req.getParameter("beizhu");
		Date time = new Date();// 时间
		// 获取时间
		DB mydb = new DB();// 连接数据库
		String getTimeSql = "select shijian from t_ruku where id=?";
		Object[] param = { ruku_id };
		try {
			mydb.doPstm(getTimeSql, param);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				time = rs.getDate("shijian");
			}

			if (liuService.updateCangku("ruku", cangku_id, shuliang) == 1) {// 仓库容量足够
				String sql = "insert into t_rukuMingxi(ruku_id,goods_id,danjia,shuliang,beizhu,time,cangku_id) values(?,?,?,?,?,?,?)";
				Object[] params = { ruku_id, goods_id, danjia, shuliang, beizhu, time, cangku_id };
				mydb.doPstm(sql, params);
				mydb.closed();
				// 更新库存
				// KuCunService.updateGoodsKucun("ruku",goods_id, shuliang);
				Kucun kc = KuCunService.getKucunByGoodsIdAndCangkuId(goods_id, cangku_id);
				// System.out.println("库存："+kc);
				// int price=MingxiService.getAvgPrice("ruku", goods_id);//平均入库价格
				// System.out.println("入库平均价格："+price);
				if (kc.getKucun_id() == 0) {
					Kucun kucun = new Kucun(goods_id, shuliang, danjia, 0, cangku_id, "no");
					System.out.println(kucun);
					KuCunService.innsertKucun(kucun);
				} else {
					kc.setKucun(kc.getKucun() + shuliang);
					KuCunService.updateKucun(kc);
				}
				req.setAttribute("msg", "入库成功");
			} else {
				req.setAttribute("msg", "入库失败，该仓库容量不足");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void rukuMingxiMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int ruku_id = Integer.parseInt(req.getParameter("ruku_id"));

		List<TrukuMingxi> rukuMingxiList = new ArrayList<>();
		String sql = "SELECT c.id,c.ruku_id,c.goods_id,g.`name`,c.danjia,c.shuliang,k.cangku_name FROM "
				+ "t_rukumingxi c,t_ruku r,t_goods g,t_cangku k WHERE c.goods_id=g.id AND c.cangku_id=k.cangku_id "
				+ " AND c.ruku_id=r.id AND ruku_id=? ORDER BY c.shuliang desc";
		Object[] params = { ruku_id };
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				TrukuMingxi rukuMingxi = new TrukuMingxi();

				rukuMingxi.setId(rs.getInt("id"));
				rukuMingxi.setRuku_id(rs.getInt("ruku_id"));
				rukuMingxi.setGoods_id(rs.getString("goods_id"));
				rukuMingxi.setDanjia(rs.getInt("danjia"));
				rukuMingxi.setShuliang(rs.getInt("shuliang"));
				rukuMingxi.setJine(rs.getInt("danjia") * rs.getInt("shuliang"));
				rukuMingxi.setGoods_name(rs.getString("name"));
				rukuMingxi.setCangku_name(rs.getString("cangku_name"));

				rukuMingxiList.add(rukuMingxi);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		System.out.println(rukuMingxiList.size());
		req.setAttribute("rukuMingxiList", rukuMingxiList);
		req.setAttribute("ruku_id", ruku_id);
		req.getRequestDispatcher("admin/ruku/rukuMingxiMana.jsp").forward(req, res);
	}

	public void rukuMingxiDel(HttpServletRequest req, HttpServletResponse res) {

		int id = Integer.parseInt(req.getParameter("id"));// 入库明细编号
		// 先获取本条明细中的商品id和数量
		Map<String, Integer> goodsAndShuliang = MingxiService.getShuliangById("ruku", id);
		String goodsId = "";
		int shuliang = 0;
		int cangkuId = MingxiService.getCangkuIdById("ruku", id);// 获取仓库id
		for (Map.Entry<String, Integer> entry : goodsAndShuliang.entrySet()) {
			goodsId = entry.getKey();
			shuliang = entry.getValue();
		}
		HttpSession session = req.getSession();
		int userType = Integer.parseInt(session.getAttribute("userType").toString());
		DB mydb = new DB();
		String sql = "";
		Object[] params = {};
		if (userType == 0) {// 系统管理员
			sql = "delete from t_rukuMingxi where id=" + id;
			mydb.doPstm(sql, params);
			// 更新库存
			// Kucun kc=null;
			// try {
			// kc = KuCunService.getKucunByGoodsIdAndCangkuId(goodsId, cangkuId);
			// } catch (SQLException e) {
			// e.printStackTrace();
			// }
			// kc.setKucun(kc.getKucun()+shuliang);
			// KuCunService.updateKucun(kc);
			// 更新仓库容量:删除入库明细相当于商品出库
			// liuService.updateCangku("chuku", cangkuId, shuliang);

			req.setAttribute("msg", "删除成功");
		}
		if (userType == 1) {// 操作员
			// 查询该出库明细的经手人
			sql = "SELECT jingshouren FROM t_ruku a,t_rukumingxi b WHERE a.id=b.ruku_id AND b.id=" + id;
			mydb.doPstm(sql, params);
			try {
				ResultSet rs = mydb.getRs();
				if (rs.next()) {
					String jingshouren = rs.getString(1);
					System.out.println("入库明细经手人：" + jingshouren);
					Yuangong yuangong = (Yuangong) session.getAttribute("yuangong");
					if (jingshouren.equals(yuangong.getName())) {
						sql = "delete from t_rukuMingxi where id=" + id;
						mydb.doPstm(sql, params);
						// 更新库存
						// Kucun kc=KuCunService.getKucunByGoodsIdAndCangkuId(goodsId, cangkuId);
						// kc.setKucun(kc.getKucun()+shuliang);
						// KuCunService.updateKucun(kc);
						// 更新仓库容量:删除入库明细相当于商品出库
						// liuService.updateCangku("chuku", cangkuId, shuliang);

						req.setAttribute("msg", "删除成功");
						// req.setAttribute("path", "chuku?type=chukuMingxiMana");
					} else {
						req.setAttribute("msg", "删除失败，您没有权限操作此订单明细！！！");
						// req.setAttribute("path", "chuku?type=chukuMingxiMana");
					}
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		mydb.closed();
		String targetURL = "/common/msg.jsp";
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
