package com.orm;

import java.io.Serializable;

/**
 * ��Ӧ����
 * @author ljl
 *
 */
public class Gongyingshang implements Serializable{

	private int id;//��Ӧ��id
	private String mingcheng;//����
	private String dizhi;//��ַ
	private String lianxiren;//��ϵ��
	private String dianhua;//�绰
	private String youbian;//�ʱ�
	private String chuanzhen;//����
	private String youxiang;//����
	private String del;//ɾ��״̬

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
