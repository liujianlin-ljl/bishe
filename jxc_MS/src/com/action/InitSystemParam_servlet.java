package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;

import com.dao.DB;
import com.orm.Cangku;
import com.orm.Tcatelog;
import com.orm.XiaoLiangRank;
import com.orm.YeJiRank;
import com.service.loginService;

/**
 * 获取系统初始化参数
 * @author ljl
 *
 */
public class InitSystemParam_servlet extends HttpServlet {
       
	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取所有仓库
		List<Cangku> cangkuList=new ArrayList<>();
		cangkuList=loginService.getCangkuAll();
		//获取所有商品分类
		List<Tcatelog> catelogList=new ArrayList<>();
		catelogList=loginService.catelogAll();
		//获取销量排名
		List<XiaoLiangRank> xiaoLiangList=new ArrayList<>();
		xiaoLiangList=getXiaoLiangRank();
		//获取员工业绩排名
		List<YeJiRank> yejiList=new ArrayList<>();
		yejiList=getYuanGongYeJi();
		
		HttpSession session=request.getSession();
		session.setAttribute("cangkuList", cangkuList);
		session.setAttribute("catelogList", catelogList);
		session.setAttribute("xiaoliangList", xiaoLiangList);
		session.setAttribute("yejiList", yejiList);
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		
	}
	/**
	 * 获取销量排名
	 * @return
	 */
	private List<XiaoLiangRank> getXiaoLiangRank(){
		List<XiaoLiangRank> rankList=new ArrayList<>();
		int id=1;
		String sql="SELECT l.`name` catelogName,g.`name` goodsName,c.shuliang xiaoliang FROM t_chukumingxi c,t_goods g,t_catelog l " + 
				"WHERE c.goods_id=g.id AND g.catelog_id  =l.id  ORDER BY c.shuliang DESC LIMIT 6";
		DB db=new DB();
		Object[] params= {};
		db.doPstm(sql, params);
		try {
			ResultSet rs=db.getRs();
			while(rs.next()){
				XiaoLiangRank rank=new XiaoLiangRank();
				rank.setId(id);
				rank.setCatelogName(rs.getString(1));
				rank.setGoodsName(rs.getString(2));
				rank.setXiaoLiang(rs.getInt(3));
				id++;
				rankList.add(rank);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return rankList;
	}
	
	public List<YeJiRank> getYuanGongYeJi(){
		List<YeJiRank> yejiRank=new ArrayList<>();
		String sql="SELECT y.id,y.`name`,SUM(c.shuliang*c.danjia) yeji FROM t_chukumingxi c,t_yuangong y,t_chuku k " + 
				"WHERE c.chuku_id=k.id AND k.jingshouren=y.`name` GROUP BY y.id  ORDER BY yeji DESC LIMIT 6";
		int id=1;
		Object[] params= {};
		DB db=new DB();
		db.doPstm(sql, params);
		try {
			ResultSet rs=db.getRs();
			while(rs.next()) {
				YeJiRank rank=new YeJiRank();
				rank.setId(id);
				rank.setYuangongId(rs.getInt(1));
				rank.setName(rs.getString(2));
				rank.setYeji(rs.getInt(3));
				id++;
				yejiRank.add(rank);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closed();
		return yejiRank;
	}
	@Test
	public void test() {//测试用的
		
	}

}
