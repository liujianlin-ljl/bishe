package com.orm;

import java.io.Serializable;

/**
 * 商品类
 * @author ljl
 *
 */
public class Tgoods implements Serializable {
	private String id;//商品id
	private int catelog_id;//分类id
	private String name;//名称
	private int danjia;//单价
	private String chandi;//产地
	private String danwei;//单位
	private String guige;//规格
	private String beizhu;//备注
	private String del;//删除状态
	private String catelog_name;//分类名称

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getChandi() {
		return chandi;
	}

	public void setChandi(String chandi) {
		this.chandi = chandi;
	}

	public String getDanwei() {
		return danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}

	public String getGuige() {
		return guige;
	}

	public void setGuige(String guige) {
		this.guige = guige;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public String getCatelog_name() {
		return catelog_name;
	}

	public void setCatelog_name(String catelog_name) {
		this.catelog_name = catelog_name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDel() {
		return del;
	}

	public int getCatelog_id() {
		return catelog_id;
	}

	public void setCatelog_id(int catelog_id) {
		this.catelog_id = catelog_id;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public int getDanjia() {
		return danjia;
	}

	public void setDanjia(int danjia) {
		this.danjia = danjia;
	}

	@Override
	public String toString() {
		return "Tgoods [id=" + id + ", catelog_id=" + catelog_id + ", name=" + name + ", danjia=" + danjia + ", chandi="
				+ chandi + ", danwei=" + danwei + ", guige=" + guige + ", beizhu=" + beizhu + ", del=" + del
				+ ", catelog_name=" + catelog_name + "]";
	}
	
	
}
