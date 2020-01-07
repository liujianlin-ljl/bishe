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
import javax.servlet.http.HttpSession;

import com.dao.DB;
import com.orm.Yuangong;
import com.service.liuService;

/**
 * 员工Servlet
 * 
 * @author ljl
 *
 */
public class yuangong_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String type = req.getParameter("type");// 获取请求参数
		System.out.println("请求参数："+type);
		try {
			if (type.endsWith("yuangongAdd")) {
				yuangongAdd(req, res);// 添加员工
			}
			if (type.endsWith("yuangongMana")) {
				yuangongMana(req, res);// 查看员工信息
			}
			if (type.endsWith("yuangongDel")) {
				yuangongDel(req, res);// 删除员工
			}
			if (type.endsWith("yuangongQuanxian")) {
				yuangongQuanxian(req, res);// 修改员工权限
			}
			if (type.endsWith("editPw")) {
				editPw(req, res);// 员工修改密码
			}
			if (type.endsWith("editInfo")) {
				editInfo(req, res);// 修改个人信息
			}
			if(type.equals("shenhe")) {//审核员工注册信息
				shenhe(req,res);
			}
			if(type.endsWith("shenheMana")) {
				shenheMana(req,res);//查看待审核员工信息
			}
			if(type.equals("myshenhe")) {
				String name=req.getParameter("name");//员工姓名
				System.out.println("员工姓名："+name);
				myshenhe(req,res);//员工查看审核信息
			}
		} catch (Exception e) {
			req.setAttribute("msg", "请求参数错误");
			dispatch("/common/msg.jsp", req, res);
		}
	}

	private void myshenhe(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name=req.getParameter("name");//员工姓名
		System.out.println("员工姓名："+name);
		Yuangong yuangong = new Yuangong();
		String sql = "SELECT * FROM t_yuangong WHERE `name`=?";
		Object[] params = {name};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				yuangong.setId(rs.getInt("id"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangong.setDel(rs.getString("del"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("yuangong", yuangong);
		req.setAttribute("name", name);
		req.getRequestDispatcher("admin/yuangong/myShenhe.jsp").forward(req, res);
	}

	private void shenheMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Yuangong> yuangongList = new ArrayList<>();
		String sql = "select * from t_yuangong where del='yes'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Yuangong yuangong = new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				
				yuangongList.add(yuangong);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("yuangongList", yuangongList);
		req.setAttribute("size", yuangongList.size());
		req.getRequestDispatcher("admin/yuangong/shenheReg.jsp").forward(req, res);
		
	}

	private void shenhe(HttpServletRequest req, HttpServletResponse res) {
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="update t_yuangong set del='no' where id=?";
		DB db=new DB();
		Object[] params= {id};
		db.doPstm(sql, params);
		db.closed();
		
		req.setAttribute("message", "审核成功");
		req.setAttribute("path", "yuangong?type=shenheMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
		
	}

	private void editInfo(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		Yuangong yuangong = ((Yuangong) session.getAttribute("yuangong"));
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String age = req.getParameter("age");
		String tel = req.getParameter("tel");
		String addr = req.getParameter("addr");
		yuangong.setName(name);
		yuangong.setSex(sex);
		yuangong.setAge(age);
		yuangong.setTel(tel);
		yuangong.setAddress(addr);
		String sql = "update t_yuangong set name=?,sex=?,age=?,tel=?,address=? where id=?";
		DB db = new DB();
		Object[] params = { name, sex, age, tel, addr, yuangong.getId() };
		db.doPstm(sql, params);
		db.closed();
		session.setAttribute("yuangong", yuangong);
		
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "admin/userinfo/myInfo.jsp");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	private void editPw(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		PrintWriter out;
		Yuangong yuangong = (Yuangong) session.getAttribute("yuangong");
		try {
			int id = yuangong.getId();
			String newPw = req.getParameter("newPw");
			String sql = "update t_yuangong set loginPw=? where id=?";
			Object[] params = { newPw, id };
			DB mydb = new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			yuangong.setLoginPw(newPw);
			session.setAttribute("yuangong", yuangong);
			res.setCharacterEncoding("utf-8");
			out = res.getWriter();
			// 将数据流入输出流
			StringBuilder json = new StringBuilder();
			json.append("{");
			json.append("\"msg" + "\":\"y\"");
			json.append("}");
			out.print(json);
		} catch (Exception e) {
			try {
				res.setCharacterEncoding("utf-8");
				out = res.getWriter();
				// 将数据流入输出流
				StringBuilder json = new StringBuilder();
				json.append("{");
				json.append("\"msg" + "\":\"n\"");
				json.append("}");
				out.print(json);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	public void yuangongAdd(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String age = req.getParameter("age");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String zhiwei = req.getParameter("zhiwei");
		System.out.println(address);
		System.out.println("职位："+zhiwei);
		int quanxian=Integer.parseInt(req.getParameter("quanxian"));
		String del=req.getParameter("del");
		String caozuo=req.getParameter("caozuo");//操作：管理员添加/员工注册

		String sql = "insert into t_yuangong(name,sex,age,tel,address,zhiwei,quanxian,loginName,loginPw,del) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { name, sex, age, tel, address, zhiwei, quanxian, "", "",del };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		try {
			if(caozuo.equals("add")) {
				req.setAttribute("message", "添加成功");
				req.setAttribute("path", "yuangong?type=yuangongMana");
			}else if(caozuo.equals("reg")) {//员工注册
				req.setAttribute("message", "注册成功，请等待管理员审核");
				req.setAttribute("path", "login.jsp");
			}
		}catch(Exception e) {
			req.setAttribute("msg", "请求参数错误");
			dispatch("/common/msg.jsp", req, res);
		}
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void yuangongDel(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));

//		String sql = "update t_yuangong set del=? where id=?";
		String sql = "delete from t_yuangong where id=?";
		Object[] params = {id};
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void yuangongMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List yuangongList = new ArrayList();
		String sql = "select * from t_yuangong where del='no'";
		Object[] params = {};
		DB mydb = new DB();
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Yuangong yuangong = new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangongList.add(yuangong);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("yuangongList", yuangongList);
		req.setAttribute("size", yuangongList.size());
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}

	public void yuangongQuanxian(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		int quanxian = Integer.parseInt(req.getParameter("quanxian"));
		String loginName = req.getParameter("loginName");
		String loginPw = req.getParameter("loginPw");

		String sql = "update t_yuangong set quanxian=?,loginName=?,loginPw=? where id=" + id;
		Object[] params = { quanxian, loginName, loginPw };
		DB mydb = new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");

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
