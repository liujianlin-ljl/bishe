package com.orm;

import java.io.Serializable;

/**
 * �����ϸ��
 * @author ljl
 *
 */
public class TrukuMingxi implements Serializable{
	private int id;//�����ϸid
	private int ruku_id;//���id
	private String goods_id;//��Ʒid
	private int danjia;//����
	private int shuliang;//����
	private int jine;
	private String beizhu;//��ע
	private String time;

	private String goods_name;
	private String cangku_name;
	private String danjuhao;

	public int getJine() {
		return jine;
	}

	public void setJine(int jine) {
		this.jine = jine;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public int getRuku_id() {
		return ruku_id;
	}

	public void setRuku_id(int ruku_id) {
		this.ruku_id = ruku_id;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDanjia() {
		return danjia;
	}

	public void setDanjia(int danjia) {
		this.danjia = danjia;
	}

	public int getShuliang() {
		return shuliang;
	}

	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public void setCangku_name(String cangku_name) {
		this.cangku_name = cangku_name;
	}
	public String getCangku_name() {
		return cangku_name;
	}

	public String getDanjuhao() {
		return danjuhao;
	}

	public void setDanjuhao(String danjuhao) {
		this.danjuhao = danjuhao;
	}

}
