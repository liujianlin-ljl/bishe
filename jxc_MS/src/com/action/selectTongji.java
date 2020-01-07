package com.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.jupiter.api.Test;

import com.dao.DB;
import com.orm.Tongji;
import com.service.liuService;

/**
 * 查询统计
 * @author ljl
 *
 */
public class selectTongji extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {

	}

	/**
	 * 根据年份获取本年份的每个月的入库总额、出库总额与计算利润总额
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Tongji> tongjiRukuList=new ArrayList<Tongji>();//入库统计列表
		List<Tongji> tongjiChukuList=new ArrayList<Tongji>();//出库统计列表
		List<Tongji> moneyList=new ArrayList<Tongji>(); //利润列表
		
		int year = Integer.parseInt(request.getParameter("year"));//获取年份参数
		int cangku_id=Integer.parseInt(request.getParameter("cangku_id"));
		System.out.println("cangkuID:"+cangku_id);
		System.out.println(year);
		//获取入库、出入统计月份与金额
		tongjiRukuList=liuService.getRukuMoney(year,cangku_id);
		tongjiChukuList=liuService.getChukuMoney(year,cangku_id);
		//获取利润列表：出库总额-入库总额
		for(int i=0;i<tongjiRukuList.size();i++) {
			moneyList.add(new Tongji(tongjiRukuList.get(i).getMonth(),tongjiChukuList.get(i).getMoney().subtract(tongjiRukuList.get(i).getMoney())));
		}
		if(cangku_id==0) {
			request.setAttribute("cangku_name", "总仓库");
		}else {
			request.setAttribute("cangku_name", liuService.findCangkuById(cangku_id).getCangku_name());
		}
		request.setAttribute("year", year);
		request.setAttribute("tongjiRukuList", tongjiRukuList);
		request.setAttribute("tongjiChukuList", tongjiChukuList);
		request.setAttribute("moneyList", moneyList);
		request.getRequestDispatcher("admin/tongji/selectTongji.jsp").forward(request, response);
		
	}
	@Test
	public void test() {//测试用的
		List<BigDecimal> moneyList=new ArrayList<BigDecimal>(); 
		List<Tongji> tongjiRukuList=liuService.getRukuMoney(2019,3);
		List<Tongji> tongjiChukuList=liuService.getChukuMoney(2019,3);
		
		
		System.out.println("入库月份\t入库金额\t\t出库月份\t出库金额");
		for(int i=0;i<tongjiRukuList.size();i++) {
			System.out.println(tongjiRukuList.get(i).getMonth()+"\t"+tongjiRukuList.get(i).getMoney()+"\t\t"+tongjiChukuList.get(i).getMonth()+"\t"+tongjiChukuList.get(i).getMoney());
			moneyList.add(tongjiChukuList.get(i).getMoney().subtract(tongjiRukuList.get(i).getMoney()));
		}
		System.out.println("每月利润：");
		for(int i=0;i<moneyList.size();i++) {
			System.out.print(moneyList.get(i)+"\t");
		}
	}

}
