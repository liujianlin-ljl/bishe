package com.orm;

import java.io.Serializable;

/**
 * ���� ��
 * @author ljl
 *
 */
public class Tcatelog implements Serializable {
	private int id;//����id
	private String name;//������
	private String del;//ɾ��״̬

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
