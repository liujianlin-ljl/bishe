package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.dao.DB;
import com.orm.Tgoods;
import com.service.KuCunService;
import com.service.liuService;
import com.service.loginService;


import net.sf.json.JSONObject;
/**
 * 商品Servlet
 * @author ljl
 *
 */
public class goods_servlet extends HttpServlet {
	String id = null;

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String type = req.getParameter("type");//获取请求参数
		id = req.getParameter("id");//获取id

		if (type.endsWith("goodsAdd")) {
			goodsAdd(req, res);//添加商品
		}
		if (type.endsWith("goodsMana")) {
			goodsMana(req, res);//查看商品
		}
		if (type.endsWith("goodsDel")) {
			goodsDel(req, res);//删除商品
		}
		if (type.endsWith("goodsSearch")) {
			goodsSearch(req, res);//查找商品
		}
		if (type.endsWith("goodsEdit")) {
			goodsEdit(req, res);//编辑商品
		}
		if (type.endsWith("goodsSingle")) {
			goodsSingle(req, res);
		}
		if(type.endsWith("findGoods")) {//查找商品
			findGoodsByCatelogId(req,res);//根据分类编号查找
		}
	}

	private void findGoodsByCatelogId(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		List<Tgoods> goodsList=new ArrayList<>();
		goodsList=loginService.getGoodsByCatelogId(catelog_id);
		 //解决返回的字符串编码问题
        res.setCharacterEncoding("utf-8");
        PrintWriter out = res.getWriter();
        //将数据流入输出流
        StringBuilder json = new StringBuilder();

        if (goodsList != null || goodsList.size() != 0) {
        	json.append("[");
            for (Tgoods tgoods : goodsList) {
            	 json.append("{");
            	 json.append("\"id" + "\":\"" + tgoods.getId() + "\",\"name" + "\":\"" + tgoods.getName() + "\"}");
            	// if (j < fields.length - 1) {
	                    json.append(",");
	            // }
			}
            json.deleteCharAt(json.length()-1);
            json.append("]");
        }
        out.print(json);
		//System.out.println(goodsList);
		//req.setAttribute("goodsList", goodsList);
	}

	public void goodsSingle(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Tgoods> goodsList = new ArrayList<>();
		String id=req.getParameter("id");
		String sql = "select * from t_goods where del='no' and id = ?" ;
		Object[] params = {id};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tgoods goods = new Tgoods();
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setDanjia(rs.getInt("danjia"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goods.setCatelog_name(liuService.getCatelogName(rs.getInt("catelog_id")));
				goodsList.add(goods);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsEdit.jsp").forward(req, res);
	}

	public void goodsAdd(HttpServletRequest req, HttpServletResponse res) {
		String id=req.getParameter("id");
		int catelog_id = Integer.parseInt(req.getParameter("catelog_id"));
		String name = req.getParameter("name");
		int danjia=Integer.parseInt(req.getParameter("danjia"));
		String chandi = req.getParameter("chandi");
		String danwei = req.getParameter("danwei");
		String guige = req.getParameter("guige");
		String beizhu = req.getParameter("beizhu");
		String del = "no";
		
		String sql = "insert into t_goods(id,catelog_id,name,danjia,chandi,danwei,guige,beizhu,del) values(?,?,?,?,?,?,?,?,?)";
		Object[] params = {id,catelog_id, name, danjia, chandi, danwei, guige, beizhu, del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		//将商品id写入库存表
//		KuCunService.insertKucun(id);
		
//		req.setAttribute("message", "操作成功");
//		req.setAttribute("path", "goods?type=goodsMana");
//
//		String targetURL = "/common/success.jsp";
		req.setAttribute("msg", "添加成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void goodsDel(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		System.out.println("dddd");
		String sql = "update t_goods set del='yes' where id=?" ;
		Object[] params = {id};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void goodsMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Tgoods> goodsList = new ArrayList<>();
		String sql = "select * from t_goods where del='no' order by catelog_id";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tgoods goods = new Tgoods();
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setDanjia(rs.getInt("danjia"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goods.setCatelog_name(liuService.getCatelogName(rs.getInt("catelog_id")));
				goodsList.add(goods);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("goodsList", goodsList);
		req.setAttribute("size", goodsList.size());
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}

	public void goodsEdit(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		int danjia = Integer.parseInt(req.getParameter("danjia"));
		String chandi = req.getParameter("chandi");
		String danwei = req.getParameter("danwei");
		String guige = req.getParameter("guige");
		String beizhu = req.getParameter("beizhu");
		String id = req.getParameter("id");
		
		String sql = "update t_goods set name=?,chandi=?,danjia=?,danwei=?,guige=?,beizhu=? where id=?" ;
		Object[] params = { name, chandi,danjia, danwei, guige, beizhu,id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

//		req.setAttribute("message", "操作成功");
//		req.setAttribute("path", "goods?type=goodsMana");
//
//		String targetURL = "/common/success.jsp";
		req.setAttribute("msg", "修改成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	/**
	 * 查询商品----模糊查询
	 * @param req
	 * @param res
	 * @throws ServletException
	 * @throws IOException
	 */
	public void goodsSearch(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Tgoods> goodsList = new ArrayList<>();
		String sql = "select g.name as name,g.id as id,g.danjia as danjia,g.catelog_id,g.beizhu,g.chandi,g.danwei,g.guige from t_goods g left join t_catelog c on c.id = g.catelog_id where g.del='no' and g.name like '%"
				+ req.getParameter("name").trim() + "%' or c.name like '%" + req.getParameter("name").trim()
				+ "%' order by g.catelog_id";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tgoods goods = new Tgoods();
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setDanjia(rs.getInt("danjia"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goods.setCatelog_name(liuService.getCatelogName(rs.getInt("catelog_id")));
				goodsList.add(goods);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("goodsList", goodsList);
		req.setAttribute("size", goodsList.size());
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
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
