package com.orm;

import java.io.Serializable;

/**
 * 出库类
 * @author ljl
 *
 */
public class Tchuku implements Serializable {
	private int id;//出库id
	private String danjuhao;//单据号
	private String shijian;//时间
	// private int zongjiage;
	private String jingshouren;//经手人
	private String beizhu;//备注

	
	private String del;//删除状态
	
	private String customerName;
	private String customerTel;

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getDanjuhao() {
		return danjuhao;
	}

	public void setDanjuhao(String danjuhao) {
		this.danjuhao = danjuhao;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getJingshouren() {
		return jingshouren;
	}

	public void setJingshouren(String jingshouren) {
		this.jingshouren = jingshouren;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	/*
	 * public int getZongjiage() { return zongjiage; } public void setZongjiage(int
	 * zongjiage) { this.zongjiage = zongjiage; }
	 */

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerTel() {
		return customerTel;
	}

	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

}
