package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.orm.Cangku;
import com.orm.Tgoods;
import com.service.CangkuService;
import com.service.liuService;
import com.service.loginService;
/**
 * �ֿ�Servlet
 * @author ljl
 *
 */
public class cangku_servlet extends HttpServlet {
	static DB mydb=null;
	static {
		mydb = new DB();
	}
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//��ȡ�������
		String type = req.getParameter("type");
		HttpSession session=req.getSession();
		System.out.println(session.getAttribute("userType"));
//		if(session.getAttribute("userType")==null) {
//			req.setAttribute("path", "/login.jsp");
//			req.getRequestDispatcher("/common/success.jsp").forward(req, res);
//		}

		if (type.endsWith("cangkuAdd")) {
			cangkuAdd(req, res);//��Ӳֿ�
		}
		if (type.endsWith("cangkuEdit")) {
			cangkuEdit(req, res);//�޸Ĳֿ���Ϣ
		}
		if (type.endsWith("cangkuDel")) {
			cangkuDel(req, res);//ɾ���ֿ�
		}
		if (type.endsWith("cangkuMana")) {
			cangkuMana(req, res);//�鿴�ֿ���Ϣ
		}
		if (type.endsWith("findCangkuByName")) {
			findCangkuByName(req, res);//���ݲֿ����Ʋ���
		}
		if(type.endsWith("findById")) {//���ݱ�Ų���
			findById(req,res);
		}
		if(type.endsWith("findCangkuByMaster")) {
			try {
				findCangkuByMaster(req,res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(type.endsWith("findCangkuByAddr")) {
			try {
				findCangkuByAddr(req,res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(type.endsWith("findCangkuBySize")) {
			try {
				findCangkuBySize(req,res);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(type.endsWith("getCangkuGoods")) {
			getCangkuGoods(req,res);
		}
	}
	private void findCangkuBySize(HttpServletRequest req, HttpServletResponse res) throws SQLException, ServletException, IOException {
		int min=Integer.parseInt(req.getParameter("min"));
		int max=Integer.parseInt(req.getParameter("max"));
		List<Cangku> cangkuList=CangkuService.getCangkuBySize(min,max);
		req.setAttribute("cangkuList", cangkuList);
		req.setAttribute("size", cangkuList.size());
		req.setAttribute("min", min);
		req.setAttribute("max", max);
		req.getRequestDispatcher("admin/cangku/cangkuMana.jsp").forward(req, res);
		
	}
	private void findCangkuByAddr(HttpServletRequest req, HttpServletResponse res) throws SQLException, ServletException, IOException {
		String cangku_addr=req.getParameter("cangku_addr");
		List<Cangku> cangkuList=CangkuService.getCangkuByAddr(cangku_addr);
		req.setAttribute("cangkuList", cangkuList);
		req.setAttribute("size", cangkuList.size());
		req.setAttribute("cangku_addr", cangku_addr);
		req.getRequestDispatcher("admin/cangku/cangkuMana.jsp").forward(req, res);
	}
	private void findCangkuByMaster(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
		String cangku_master=req.getParameter("cangku_master");
		List<Cangku> cangkuList=CangkuService.getCangkuByMaster(cangku_master);
		req.setAttribute("cangkuList", cangkuList);
		req.setAttribute("size", cangkuList.size());
		req.setAttribute("cangku_master", cangku_master);
		req.getRequestDispatcher("admin/cangku/cangkuMana.jsp").forward(req, res);
	}
	/**
	 * ��ȡ�ֿ��е���Ʒ
	 * @param req
	 * @param res
	 */
	private void getCangkuGoods(HttpServletRequest req, HttpServletResponse res) {
		int cangku_id=Integer.parseInt(req.getParameter("cangku_id"));
		String cangku_name=req.getParameter("cangku_name");
		try {
			Map<Tgoods,Integer> cangkuMap=liuService.getGoodsByCangkuId(cangku_id);
			req.setAttribute("cangkuMap", cangkuMap);
			req.setAttribute("cangku_name", cangku_name);
			String targetURL = "/admin/cangku/cangku_goods.jsp";
			dispatch(targetURL, req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * ��Ӳֿ�
	 * @param req
	 * @param res
	 */
	public void cangkuAdd(HttpServletRequest req, HttpServletResponse res) {
		String cangku_name = req.getParameter("cangku_name");
		String cangku_master = req.getParameter("cangku_master");
		String cangku_tel = req.getParameter("cangku_tel");
		String cangku_addr = req.getParameter("cangku_addr");
		int cangku_size = Integer.parseInt(req.getParameter("cangku_size"));
		String del = "no";

		String sql = "insert into t_cangku(cangku_name,cangku_master,cangku_tel,cangku_addr,cangku_size,del) values(?,?,?,?,?,?)";
		Object[] params = { cangku_name, cangku_master, cangku_tel, cangku_addr, cangku_size, del };
		
		mydb.doPstm(sql, params);
		mydb.closed();
		
		changeParam(req);
		req.setAttribute("message", "��ӳɹ�");
		req.setAttribute("path", "cangku?type=cangkuMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	/**
	 * ���²ֿ���Ϣ
	 * @param req
	 * @param res
	 */
	public void cangkuEdit(HttpServletRequest req, HttpServletResponse res) {
		String cangku_id = req.getParameter("id");
		String cangku_name = req.getParameter("cangku_name");
		String cangku_master = req.getParameter("cangku_master");
		String cangku_tel = req.getParameter("cangku_tel");
		String cangku_addr = req.getParameter("cangku_addr");
		int cangku_size = Integer.parseInt(req.getParameter("cangku_size"));
		String del = "no";

		String sql = "update t_cangku set cangku_name=?,cangku_master=?,cangku_tel=?,cangku_addr=?,cangku_size=? where cangku_id=?";
		Object[] params = { cangku_name, cangku_master, cangku_tel, cangku_addr,cangku_size, cangku_id };
		mydb.doPstm(sql, params);
		mydb.closed();
		changeParam(req);
		
		req.setAttribute("message", "�޸ĳɹ�");
		req.setAttribute("path", "cangku?type=cangkuMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	//����ϵͳ����
	private void changeParam(HttpServletRequest req) {
		//�޸�ϵͳ�ֿ��ʼ����
		List<Cangku> cangkuList=loginService.getCangkuAll();
		HttpSession session=req.getSession();
		session.setAttribute("cangkuList", cangkuList);
	}
	/**
	 * �鿴�ֿ���Ϣ
	 * @param req
	 * @param res
	 * @throws ServletException
	 * @throws IOException
	 */
	public void cangkuMana(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		List<Cangku> cangkuList = new ArrayList<>();
		String sql = "select * from t_cangku where del='no'";
		Object[] params = {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Cangku cangku = new Cangku();

				cangku.setCangku_id(rs.getInt("cangku_id"));
				cangku.setCangku_name(rs.getString("cangku_name"));
				cangku.setCangku_master(rs.getString("cangku_master"));
				cangku.setCangku_tel(rs.getString("cangku_tel"));
				cangku.setCangku_addr(rs.getString("cangku_addr"));
				cangku.setCangku_size(rs.getInt("cangku_size"));
				cangku.setDel(rs.getString("del"));
				cangkuList.add(cangku);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("cangkuList", cangkuList);
		req.setAttribute("size", cangkuList.size());
		req.getRequestDispatcher("admin/cangku/cangkuMana.jsp").forward(req, res);
	}
	/**
	 * ɾ���ֿ�
	 * @param req
	 * @param res
	 */
	public void cangkuDel(HttpServletRequest req, HttpServletResponse res) {
		int cangku_id = Integer.parseInt(req.getParameter("id"));

		String sql = "update t_cangku set del='yes' where cangku_id=?";
		Object[] params = { cangku_id };
		mydb.doPstm(sql, params);
		mydb.closed();

		changeParam(req);
		req.setAttribute("message", "ɾ���ɹ�");
		req.setAttribute("path", "cangku?type=cangkuMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	/**
	 * ���ݲֿ����ƽ���ģ����ѯ
	 * @param req
	 * @param res
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findCangkuByName(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Cangku> cangkuList = new ArrayList<>();
		String cangku_name=req.getParameter("cangku_name");
		String sql = "select * from t_cangku where cangku_name like '%"+cangku_name+"%' and del='no'";
		
		Object[] params = {};
		try {
			mydb.doPstm(sql, params);
			ResultSet rs = mydb.getRs();
			while (rs.next()) {
				Cangku cangku = new Cangku();

				cangku.setCangku_id(rs.getInt("cangku_id"));
				cangku.setCangku_name(rs.getString("cangku_name"));
				cangku.setCangku_master(rs.getString("cangku_master"));
				cangku.setCangku_tel(rs.getString("cangku_tel"));
				cangku.setCangku_addr(rs.getString("cangku_addr"));
				cangku.setCangku_size(rs.getInt("cangku_size"));
				cangku.setDel(rs.getString("del"));
				System.out.println(cangku);
				cangkuList.add(cangku);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("cangkuList", cangkuList);
		req.setAttribute("size", cangkuList.size());
		req.getRequestDispatcher("admin/cangku/cangkuMana.jsp").forward(req, res);
	}
	
	public void findById(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Integer cangku_id=Integer.parseInt(req.getParameter("id"));
		System.out.println("�ֿ�id:"+cangku_id);
		Cangku cangku=liuService.findCangkuById(cangku_id);
		req.setAttribute("cangku", cangku);
		req.getRequestDispatcher("admin/cangku/cangkuEdit.jsp").forward(req, res);
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
