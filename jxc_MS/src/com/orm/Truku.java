package com.orm;

import java.io.Serializable;

/**
 * �����
 * @author ljl
 *
 */
public class Truku implements Serializable{
	private int id;//���id
	private int gongyingshang_id;//��Ӧ��id
	private String danjuhao;//���ݺ�
	private String shijian;//ʱ��
	// private int zongjiage;
	private String jingshouren;//������
	private String beizhu;//��ע
	private String del;//ɾ��״̬

	private Gongyingshang gongyingshang;

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

	public Gongyingshang getGongyingshang() {
		return gongyingshang;
	}

	public void setGongyingshang(Gongyingshang gongyingshang) {
		this.gongyingshang = gongyingshang;
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

	public int getGongyingshang_id() {
		return gongyingshang_id;
	}

	public void setGongyingshang_id(int gongyingshang_id) {
		this.gongyingshang_id = gongyingshang_id;
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
}
