package com.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TchukuMingxi;
import com.orm.TrukuMingxi;
import com.service.MingxiService;

/**
 * 仓库Servlet
 * 
 * @author ljl
 *
 */
public class pancun_servlet extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 获取请求参数
		String type = req.getParameter("type");
		if (type.endsWith("pancunMingxi")) {
			pancunMingxi(req, res);
		}

	}


	private void pancunMingxi(HttpServletRequest req, HttpServletResponse res) {
		List<TrukuMingxi> rk=new ArrayList<>();
		List<TchukuMingxi> ck=new ArrayList<>();
		String goodsName=req.getParameter("goodsName");
		String cangkuName=req.getParameter("cangkuName");
		
		try {
			rk=MingxiService.getRukuMingxiByGoodsNameAndCangkuName(goodsName, cangkuName);
			ck=MingxiService.getChukuMingxiByGoodsNameAndCangkuName(goodsName, cangkuName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("rukuMingxiList", rk);
		req.setAttribute("chukuMingxiList", ck);
		req.setAttribute("rsize", rk.size());
		req.setAttribute("csize", ck.size());
		req.setAttribute("goodsName", goodsName==""?"无":goodsName);
		req.setAttribute("cangkuName", cangkuName==""?"无":cangkuName);
		try {
			req.getRequestDispatcher("admin/kucun/pancunMingxi.jsp").forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
