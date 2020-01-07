package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import com.orm.TAdmin;
import com.orm.Gongyingshang;
/**
 * 供应商Servlet
 * @author ljl
 *
 */
public class gongyingshang_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//获取请求参数
		String type = req.getParameter("type");

		if (type.endsWith("gongyingshangAdd")) {
			gongyingshangAdd(req, res);//添加供应商
		}
		if (type.endsWith("gongyingshangEdit")) {
			gongyingshangEdit(req, res);//编辑供应商信息
		}
		if (type.endsWith("gongyingshangDel")) {
			gongyingshangDel(req, res);//删除供应商
		}
		if (type.endsWith("gongyingshangMana")) {
			gongyingshangMana(req, res);//查看供应商信息
		}
		if (type.endsWith("gongyingshangAll")) {
			gongyingshangAll(req, res);//获取全部供应商
		}
	}

	public void gongyingshangAdd(HttpServletRequest req, HttpServletResponse res) {
		String mingcheng = req.getParameter("mingcheng");
		String dizhi = req.getParameter("dizhi");
		String lianxiren = req.getParameter("lianxiren");
		String dianhua = req.getParameter("dianhua");
		String youbian = req.getParameter("youbian");
		String chuanzhen = req.getParameter("chuanzhen");
		String youxiang = req.getParameter("youxiang");
		String del = "no";

		String sql = "insert into t_gongyingshang(mingcheng,dizhi,lianxiren,dianhua,youbian,chuanzhen,youxiang,del) values(?,?,?,?,?,?,?,?)";
		Object[] params = { mingcheng, dizhi, lianxiren, dianhua, youbian, chuanzhen, youxiang, del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void gongyingshangEdit(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		String mingcheng = req.getParameter("mingcheng");
		String dizhi = req.getParameter("dizhi");
		String lianxiren = req.getParameter("lianxiren");
		String dianhua = req.getParameter("dianhua");
		String youbian = req.getParameter("youbian");
		String chuanzhen = req.getParameter("chuanzhen");
		String youxiang = req.getParameter("youxiang");
		String del = "no";

		String sql = "update t_gongyingshang set mingcheng=?,dizhi=?,lianxiren=?,dianhua=?,"
				+ "youbian=?,chuanzhen=?,youxiang=? where id=?";
		Object[] params = { mingcheng, dizhi, lianxiren, dianhua, youbian, chuanzhen, youxiang, id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void gongyingshangMana(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		List gongyingshangList = new ArrayList();
		String sql = "select * from t_gongyingshang where del='no'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Gongyingshang gongyingshang = new Gongyingshang();

				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshang.setDel(rs.getString("del"));
				gongyingshangList.add(gongyingshang);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("gongyingshangList", gongyingshangList);
		req.setAttribute("size", gongyingshangList.size());
		req.getRequestDispatcher("admin/gongyingshang/gongyingshangMana.jsp").forward(req, res);
	}

	public void gongyingshangDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));

		String sql = "update t_gongyingshang set del='yes' where id=?";
		Object[] params = { id };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void gongyingshangAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List gongyingshangList = new ArrayList();
		String sql = "select * from t_gongyingshang where del='no'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Gongyingshang gongyingshang = new Gongyingshang();

				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshang.setDel(rs.getString("del"));
				
				gongyingshangList.add(gongyingshang);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("gongyingshangList", gongyingshangList);
		req.getRequestDispatcher("admin/gongyingshang/gongyingshangAll.jsp").forward(req, res);
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
