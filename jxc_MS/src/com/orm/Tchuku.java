package com.orm;

import java.io.Serializable;

/**
 * ������
 * @author ljl
 *
 */
public class Tchuku implements Serializable {
	private int id;//����id
	private String danjuhao;//���ݺ�
	private String shijian;//ʱ��
	// private int zongjiage;
	private String jingshouren;//������
	private String beizhu;//��ע

	
	private String del;//ɾ��״̬
	
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
