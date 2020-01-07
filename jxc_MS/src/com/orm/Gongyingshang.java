package com.orm;

import java.io.Serializable;

/**
 * 供应商类
 * @author ljl
 *
 */
public class Gongyingshang implements Serializable{

	private int id;//供应商id
	private String mingcheng;//名称
	private String dizhi;//地址
	private String lianxiren;//联系人
	private String dianhua;//电话
	private String youbian;//邮编
	private String chuanzhen;//传真
	private String youxiang;//邮箱
	private String del;//删除状态

	public String getChuanzhen(){
		return chuanzhen;
	}

	public void setChuanzhen(String chuanzhen){
		this.chuanzhen = chuanzhen;
	}

	public String getDel(){
		return del;
	}

	public void setDel(String del){
		this.del = del;
	}

	public String getDianhua(){
		return dianhua;
	}

	public void setDianhua(String dianhua){
		this.dianhua = dianhua;
	}

	public String getDizhi(){
		return dizhi;
	}

	public void setDizhi(String dizhi){
		this.dizhi = dizhi;
	}

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id = id;
	}

	public String getLianxiren(){
		return lianxiren;
	}

	public void setLianxiren(String lianxiren){
		this.lianxiren = lianxiren;
	}

	public String getMingcheng(){
		return mingcheng;
	}

	public void setMingcheng(String mingcheng){
		this.mingcheng = mingcheng;
	}

	public String getYoubian(){
		return youbian;
	}

	public void setYoubian(String youbian){
		this.youbian = youbian;
	}

	public String getYouxiang(){
		return youxiang;
	}

	public void setYouxiang(String youxiang){
		this.youxiang = youxiang;
	}
	
}
