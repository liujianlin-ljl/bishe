package com.orm;

import java.io.Serializable;

/**
 * 分类 类
 * @author ljl
 *
 */
public class Tcatelog implements Serializable {
	private int id;//分类id
	private String name;//分类名
	private String del;//删除状态

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
