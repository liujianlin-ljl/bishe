package com.action;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.orm.Customer;
import com.orm.Tgoods;
import com.service.CustomerService;
import com.service.liuService;
import com.service.loginService;
/**
 * 客户Servlet
 * @author ljl
 *
 */
public class customer_servlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//获取请求参数
		String type = req.getParameter("type");
		
		String id=req.getParameter("id");
		String cname=req.getParameter("c_name");
		String csex=req.getParameter("c_sex");
		String ctel=req.getParameter("c_tel");
		String ctype=req.getParameter("c_type");
		String del="no";
		Customer cus=new Customer(id,cname,csex,ctel,ctype,del);
		System.out.println("请求参数："+type);
		System.out.println("参数信息："+cus);
		System.out.println("----------------------");

		if (type.endsWith("customerAdd")) {
			customerAdd(req, res,cus);//添加客户
		}
		if (type.endsWith("customerEdit")) {
			customerEdit(req, res,cus);//更新客户信息
		}
		if (type.endsWith("customerDel")) {
			customerDel(req, res,cus);//删除删除
		}
		if(type.endsWith("stopTrade")) {//停止交易
			stopTrade(req,res,id);
		}
		if(type.endsWith("reTrade")) {//停止交易
			reTrade(req,res,id);
		}
		if(type.endsWith("getAllCustomer")) {
			getAllCustomer(req,res);
		}
		if (type.endsWith("customerMana")) {
			customerMana(req, res);//查看客户信息
		}
		if (type.endsWith("findCustomerByName")) {
			findCustomerByName(req, res,cname);//根据客户名称查找
		}
		if(type.endsWith("findCustomerById")) {//根据编号查找
			findCustomerById(req,res,id);
		}
		if(type.endsWith("findCustomerToEdit")) {
			findCustomerToEdit(req,res,id);
		}
		if(type.endsWith("findCustomerByType")) {
			findCustomerByType(req,res,ctype);
		}
		if(type.endsWith("findCustomerByNameAndType")) {
			findCustomerByNameAndType(req,res,cname,ctype);
		}
	}
	
	private void getAllCustomer(HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<Customer> cusList=new ArrayList<>();
		try {
			cusList=CustomerService.getAllCustomer("getCustomer");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		res.setCharacterEncoding("utf-8");
        PrintWriter out = res.getWriter();
        //将数据流入输出流
        StringBuilder json = new StringBuilder();

        if (cusList != null || cusList.size() != 0) {
        	json.append("[");
            for (Customer cus : cusList) {
            	 json.append("{");
            	 json.append("\"id" + "\":\"" + cus.getId() + "\",\"name" + "\":\"" + cus.getCname() + "\"}");
	             json.append(",");
			}
            json.deleteCharAt(json.length()-1);
            json.append("]");
        }
        out.print(json);
		
	}

	private void reTrade(HttpServletRequest req, HttpServletResponse res, String id) {
		CustomerService.updateDel("no", id);
		dispatch("/customer?type=customerMana", req, res);
		
	}

	private void findCustomerToEdit(HttpServletRequest req, HttpServletResponse res, String id) {
		try {
			List<Customer> cusList=CustomerService.findById(id);
			req.setAttribute("customer", cusList.get(0));
			dispatch("/admin/customer/customerEdit.jsp",req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	private void stopTrade(HttpServletRequest req, HttpServletResponse res, String id) {
		CustomerService.updateDel("yes", id);
		dispatch("/customer?type=customerMana", req, res);
	}

	private void findCustomerByNameAndType(HttpServletRequest req, HttpServletResponse res,String cname,String type) {
		try {
			List<Customer> cusList=CustomerService.findByNameAndType(cname, cname);
			req.setAttribute("customerList", cusList);
			dispatch("/admin/customer/customerMana.jsp", req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void findCustomerByType(HttpServletRequest req, HttpServletResponse res,String type) {
		try {
			List<Customer> cusList=CustomerService.findByType(type);
			req.setAttribute("customerList", cusList);
			if(cusList.size()!=0) {
				req.setAttribute("type", cusList.get(0).getCtype());
			}
			dispatch("/admin/customer/customerMana.jsp", req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void findCustomerById(HttpServletRequest req, HttpServletResponse res,String id) {
		try {
			List<Customer> cusList=CustomerService.findById(id);
			req.setAttribute("customerList", cusList);
			if(cusList.size()!=0) {
				req.setAttribute("id", cusList.get(0).getId());
			}
			dispatch("/admin/customer/customerMana.jsp", req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void findCustomerByName(HttpServletRequest req, HttpServletResponse res, String cname) {
		try {
			List<Customer> cusList=CustomerService.findByName(cname);
			req.setAttribute("customerList", cusList);
			if(cusList.size()!=0) {
				req.setAttribute("name", cusList.get(0).getCname());
			}
			dispatch("/admin/customer/customerMana.jsp", req, res);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	private void customerMana(HttpServletRequest req, HttpServletResponse res)  {
		List<Customer> cusList=new ArrayList<>();
		try {
			cusList=CustomerService.getAllCustomer("customerMana");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("customerList", cusList);
		for (Customer customer : cusList) {
			System.out.println("客户列表"+customer);
		}
		req.setAttribute("size", cusList.size());
		dispatch("/admin/customer/customerMana.jsp", req, res);
		
	}

	private void customerDel(HttpServletRequest req, HttpServletResponse res,Customer cus) {
		CustomerService.delCustomer(cus.getId());
		forwordPage(req, res, "删除成功", "customer?type=customerMana");
	}

	private void customerEdit(HttpServletRequest req, HttpServletResponse res, Customer cus) {
		String ctel=req.getParameter("c_tel");
		String ctype=req.getParameter("c_type");
		System.out.println("电话"+ctel+",类型"+ctype);
		cus.setCtel(ctel);
		cus.setCtype(ctype);
		CustomerService.updateCustomer(cus);
		forwordPage(req, res, "修改成功", "customer?type=customerMana");
	}

	private void customerAdd(HttpServletRequest req, HttpServletResponse res, Customer cus) {
		String ctel=req.getParameter("c_tel");
		String ctype=req.getParameter("c_type");
		System.out.println("电话"+ctel+",类型"+ctype);
		cus.setCtel(ctel);
		cus.setCtype(ctype);
		CustomerService.addCustomer(cus);
		System.out.println("添加的客户信息："+cus);
		forwordPage(req, res,"添加成功","customer?type=customerMana");
	}

	public void forwordPage(HttpServletRequest req, HttpServletResponse res,String message,String path) {
		req.setAttribute("message", message);
		req.setAttribute("path", path);
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
