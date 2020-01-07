package com.orm;

import java.io.Serializable;

/**
 * 员工业绩排行
 * @author ljl
 *
 */
public class YeJiRank implements Serializable {
	private int id;
	private int yuangongId;
	private String name;
	private int yeji;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getYuangongId() {
		return yuangongId;
	}
	public void setYuangongId(int yuangongId) {
		this.yuangongId = yuangongId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYeji() {
		return yeji;
	}
	public void setYeji(int yeji) {
		this.yeji = yeji;
	}
	@Override
	public String toString() {
		return "YeJiRank [id=" + id + ", yuangongId=" + yuangongId + ", name=" + name + ", yeji=" + yeji + "]";
	}
	
	
}
