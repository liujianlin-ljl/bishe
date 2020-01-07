package com.orm;

import java.io.Serializable;

public class Cangku implements Serializable {
	private int cangku_id;
	private String cangku_name;
	private String cangku_master;
	private String cangku_tel;
	private String cangku_addr;
	private int cangku_size;
	private String del;
	private String beizhu;
	
	public Cangku() {}
	
	public Cangku(int cangku_id, String cangku_name, String cangku_master, String cangku_tel, String cangku_addr,
			int cangku_size, String del) {
		super();
		this.cangku_id = cangku_id;
		this.cangku_name = cangku_name;
		this.cangku_master = cangku_master;
		this.cangku_tel = cangku_tel;
		this.cangku_addr = cangku_addr;
		this.cangku_size = cangku_size;
		this.del = del;
	}
	public int getCangku_id() {
		return cangku_id;
	}
	public void setCangku_id(int cangku_id) {
		this.cangku_id = cangku_id;
	}
	public String getCangku_name() {
		return cangku_name;
	}
	public void setCangku_name(String cangku_name) {
		this.cangku_name = cangku_name;
	}
	public String getCangku_master() {
		return cangku_master;
	}
	public void setCangku_master(String cangku_master) {
		this.cangku_master = cangku_master;
	}
	public String getCangku_tel() {
		return cangku_tel;
	}
	public void setCangku_tel(String cangku_tel) {
		this.cangku_tel = cangku_tel;
	}
	public String getCangku_addr() {
		return cangku_addr;
	}
	public void setCangku_addr(String cangku_addr) {
		this.cangku_addr = cangku_addr;
	}
	public int getCangku_size() {
		return cangku_size;
	}
	public void setCangku_size(int cangku_size) {
		this.cangku_size = cangku_size;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "Cangku [cangku_id=" + cangku_id + ", cangku_name=" + cangku_name + ", cangku_master=" + cangku_master
				+ ", cangku_tel=" + cangku_tel + ", cangku_addr=" + cangku_addr + ", cangku_size=" + cangku_size
				+ ", del=" + del + "]";
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
}
