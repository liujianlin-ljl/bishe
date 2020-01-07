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
 * ��ѯͳ��
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
	 * ������ݻ�ȡ����ݵ�ÿ���µ�����ܶ�����ܶ�����������ܶ�
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Tongji> tongjiRukuList=new ArrayList<Tongji>();//���ͳ���б�
		List<Tongji> tongjiChukuList=new ArrayList<Tongji>();//����ͳ���б�
		List<Tongji> moneyList=new ArrayList<Tongji>(); //�����б�
		
		int year = Integer.parseInt(request.getParameter("year"));//��ȡ��ݲ���
		int cangku_id=Integer.parseInt(request.getParameter("cangku_id"));
		System.out.println("cangkuID:"+cangku_id);
		System.out.println(year);
		//��ȡ��⡢����ͳ���·�����
		tongjiRukuList=liuService.getRukuMoney(year,cangku_id);
		tongjiChukuList=liuService.getChukuMoney(year,cangku_id);
		//��ȡ�����б������ܶ�-����ܶ�
		for(int i=0;i<tongjiRukuList.size();i++) {
			moneyList.add(new Tongji(tongjiRukuList.get(i).getMonth(),tongjiChukuList.get(i).getMoney().subtract(tongjiRukuList.get(i).getMoney())));
		}
		if(cangku_id==0) {
			request.setAttribute("cangku_name", "�ֿܲ�");
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
	public void test() {//�����õ�
		List<BigDecimal> moneyList=new ArrayList<BigDecimal>(); 
		List<Tongji> tongjiRukuList=liuService.getRukuMoney(2019,3);
		List<Tongji> tongjiChukuList=liuService.getChukuMoney(2019,3);
		
		
		System.out.println("����·�\t�����\t\t�����·�\t������");
		for(int i=0;i<tongjiRukuList.size();i++) {
			System.out.println(tongjiRukuList.get(i).getMonth()+"\t"+tongjiRukuList.get(i).getMoney()+"\t\t"+tongjiChukuList.get(i).getMonth()+"\t"+tongjiChukuList.get(i).getMoney());
			moneyList.add(tongjiChukuList.get(i).getMoney().subtract(tongjiRukuList.get(i).getMoney()));
		}
		System.out.println("ÿ������");
		for(int i=0;i<moneyList.size();i++) {
			System.out.print(moneyList.get(i)+"\t");
		}
	}

}
