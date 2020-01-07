package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.DB;
import com.orm.Cangku;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.orm.Yuangong;
/**
 * 登录service
 * @author ljl
 *
 */
public class loginService{
	static DB mydb=null;
	static {
		mydb=new DB();
	}
	/**
	 * 登录方法
	 * @param userName 用户名
	 * @param userPw 密码
	 * @param userType 用户类型：0表示管理员，1表示操作员
	 * @return 返回登录结果result:yes/no
	 */
	public String login(String userName,String userPw,int userType){
		System.out.println("userType:"+userType);
		try{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		String result="no";//记录是否登录成功，默认登录失败
		
		if(userType==0) {//系统管理员登陆
			String sql="select * from t_admin where userName=? and userPw=?";
			Object[] params={userName,userPw};
			//DB mydb=new DB();
			mydb.doPstm(sql, params);
			try{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false) {//登录失败
					 result="no";
				}else {//登录成功
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 0);//将登录信息保存到session中
		             session.setAttribute("admin", admin);
				}
				rs.close();
			}catch (SQLException e)
			{ 
				System.out.println("登录失败！");
				e.printStackTrace();
			}finally{
				mydb.closed();
			}
		}
		
		if(userType==1){//操作员
			System.out.println("ddddddddddd");
			String sql="select * from t_yuangong where del='no' and loginName=? and loginPw=?";
			Object[] params={userName,userPw};
			mydb.doPstm(sql, params);
			try{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false){
					 result="no";
				}
				else{
					 result="yes";
					 
					 Yuangong yuangong=new Yuangong();
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
					 
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", 1);
		             session.setAttribute("yuangong", yuangong);
				}
				rs.close();
			} catch (SQLException e){
				System.out.println("登录失败！");
				e.printStackTrace();
			}finally{
				mydb.closed();
			}
		}
		if(userType==2)//普通员工
		{
			
		}
		return result;//返回登录结果
	}
	/**
	 * 管理员修改密码
	 * @param userPwNew
	 * @return
	 */
    public String adminPwEdit(String userPwNew){
		System.out.println("修改密码");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		//DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    /**
     * 获取出库时仓库中全部商品分类
     */
    public List<Tcatelog> getCatelogByCangkuId(int cangku_id){
    	try{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
    	List<Tcatelog> catelogList=new ArrayList<>();
    	//获取仓库所有商品分类
		String sql="SELECT DISTINCT c.* FROM t_catelog c,t_goods g WHERE c.id=g.catelog_id AND g.id IN(" + 
				"SELECT r.goods_id FROM t_rukumingxi r WHERE cangku_id="+cangku_id+")";
		Object[] params={};
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
    }
    /**
     * 获取所有的分类
     * @return
     */
    public static List<Tcatelog> catelogAll(){
    	try{
    		Thread.sleep(700);
    	} catch (InterruptedException e)
    	{
    		e.printStackTrace();
    	}
    	List<Tcatelog> catelogList=new ArrayList<>();
    	//获取仓库所有商品分类
    	String sql="SELECT * FROM t_catelog WHERE del='no'";
    	Object[] params={};
    	try{
    		mydb.doPstm(sql, params);
    		ResultSet rs=mydb.getRs();
    		while(rs.next())
    		{
    			Tcatelog catelog=new Tcatelog();
    			catelog.setId(rs.getInt("id"));
    			catelog.setName(rs.getString("name"));
    			catelog.setDel(rs.getString("del"));
    			catelogList.add(catelog);
    		}
    		rs.close();
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	mydb.closed();
    	return catelogList;
    }
    /**
     * 获取所有商品
     * @return
     */
    public List<Tgoods> goodsAll(){
    	try{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
    	List<Tgoods> goodsList=new ArrayList<>();
		String sql="select * from t_goods where del='no'";
		Object[] params={};
		//DB mydb=new DB();
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goodsList;
    }
    
    /**
     * 获取所有仓库
     * @return
     */
    public static List<Cangku> getCangkuAll(){
    	try{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
    	List<Cangku> cangkuList=new ArrayList<>();
		String sql="select * from t_cangku where del='no'";
		Object[] params={};
		//DB mydb=new DB();
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Cangku cangku=new Cangku();
				cangku.setCangku_id(rs.getInt("cangku_id"));
				cangku.setCangku_name(rs.getString("cangku_name"));
				cangku.setCangku_master(rs.getString("cangku_master"));
				cangku.setCangku_tel(rs.getString("cangku_tel"));
				cangku.setCangku_addr(rs.getString("cangku_addr"));
				cangku.setCangku_size(rs.getInt("cangku_size"));
				
				cangkuList.add(cangku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return cangkuList;
    }
    /**
     * 根据仓库id获取一个仓库
     * @param cangku_id
     * @return
     */
    public static Cangku getCangku(int cangku_id) {
    	Cangku cangku=new Cangku();
    	String sql="select * from t_cangku where cangku_id="+cangku_id;
		Object[] params={};
		//DB mydb=new DB();
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next()){
				cangku.setCangku_id(rs.getInt("cangku_id"));
				cangku.setCangku_name(rs.getString("cangku_name"));
				cangku.setCangku_master(rs.getString("cangku_master"));
				cangku.setCangku_tel(rs.getString("cangku_tel"));
				cangku.setCangku_addr(rs.getString("cangku_addr"));
				cangku.setCangku_size(rs.getInt("cangku_size"));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return cangku;
    }
    /**
     * 获取所有仓容的大小之和
     * @return
     */
    public static int getCangkuSize() {
    	int cangku_size=0;
    	String sql="SELECT sum(cangku_size) FROM t_cangku";
		Object[] params={};
		//DB mydb=new DB();
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next()){
				cangku_size=rs.getInt(1);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return cangku_size;
    }
    
    /**
     * 根据分类id获取商品
     * @param catelog_id
     * @return
     */
    public static List<Tgoods> getGoodsByCatelogId(int catelog_id){
    	try{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
    	List<Tgoods> goodsList=new ArrayList<>();
		String sql="select * from t_goods where del='no' and catelog_id="+catelog_id;
		Object[] params={};
		//DB mydb=new DB();
		try{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setGuige(rs.getString("guige"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goodsList;
    }
}
