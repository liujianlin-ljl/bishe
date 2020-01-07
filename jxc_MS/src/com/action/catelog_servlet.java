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

import com.dao.DB;
import com.orm.Cangku;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.service.CatelogService;
import com.service.loginService;

/**
 * 分类Servlet
 * @author ljl
 *
 */
public class catelog_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//获取请求参数
		String type = req.getParameter("type");

		if (type.endsWith("catelogMana")) {
			catelogMana(req, res);//查看分类信息
		}
		if (type.endsWith("catelogAdd")) {
			catelogAdd(req, res);//添加分类
		}
		if (type.endsWith("catelogDel")) {
			catelogDel(req, res);//删除分类
		}
		if(type.endsWith("stopCatelog")) {
			stopCatelog(req,res);
		}
		if(type.endsWith("reCatelog")) {
			reCatelog(req,res);
		}
		if(type.endsWith("catelogEdit")) {
			catelogEdit(req,res);
		}
		if(type.endsWith("findCatelogByName")) {
			try {
				findCatelogByName(req,res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(type.endsWith("findCatelogByDel")) {
			try {
				findCatelogByDel(req,res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	private void findCatelogByDel(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		List<Tcatelog> catelogList = new ArrayList<>();
		
		catelogList=CatelogService.getCatelogByDel(req.getParameter("del"));
		req.setAttribute("catelogList", catelogList);
		req.setAttribute("size", catelogList.size());
		try {
			req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void reCatelog(HttpServletRequest req, HttpServletResponse res) {
		int catelogId=Integer.parseInt(req.getParameter("id"));
		CatelogService.updateDel("no",catelogId);
		changeParam(req);
		dispatch("/catelog?type=catelogMana", req, res);
		
	}

	private void stopCatelog(HttpServletRequest req, HttpServletResponse res) {
		int catelogId=Integer.parseInt(req.getParameter("id"));
		CatelogService.updateDel("yes",catelogId);
		changeParam(req);
		dispatch("/catelog?type=catelogMana", req, res);
		
	}

	private void findCatelogByName(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
		String catelogName=req.getParameter("catelog_name");
		List<Tcatelog> catelogList = new ArrayList<>();
		catelogList=CatelogService.getCatelogByName(catelogName);
		
		req.setAttribute("catelogList", catelogList);
		req.setAttribute("size", catelogList.size());
		req.setAttribute("catelog_name", catelogName);
		req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
	}

	private void catelogEdit(HttpServletRequest req, HttpServletResponse res) {
		int id=Integer.parseInt(req.getParameter("id"));
		String catelogName=req.getParameter("catelogName");
		CatelogService.updateCatelogName(catelogName, id);
		req.setAttribute("msg", "修改成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void catelogAdd(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		String del = "no";

		String sql = "insert into t_catelog(name,del) values(?,?)";
		Object[] params = { name, del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		changeParam(req);

		req.setAttribute("msg", "添加成功");
		//req.setAttribute("path", "catelog?type=catelogMana");
		String targetURL = "/common/msg.jsp";
		//String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	/**
	 * 修改系统分类初始参数
	 * @param req
	 */
	private void changeParam(HttpServletRequest req) {
		//修改系统分类初始参数
		List<Tcatelog> catelogList=loginService.catelogAll();
		HttpSession session=req.getSession();
		session.setAttribute("catelogList", catelogList);
	}

	public void catelogDel(HttpServletRequest req, HttpServletResponse res) {
		//String sql = "update t_catelog set del='yes' where id=" + Integer.parseInt(req.getParameter("id"));
		String sql = "delete from t_catelog where id=" + Integer.parseInt(req.getParameter("id"));
		Object[] params = {};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		changeParam(req);
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "catelog?type=catelogMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void catelogMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Tcatelog> catelogList = new ArrayList<>();
		String sql = "select * from t_catelog ";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Tcatelog catelog = new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelog.setDel(rs.getString("del"));
				
				catelogList.add(catelog);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("catelogList", catelogList);
		req.setAttribute("size", catelogList.size());
		req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
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
