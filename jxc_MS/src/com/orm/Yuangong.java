package com.orm;

import java.io.Serializable;

/**
 * Ա����
 * @author ljl
 *
 */
public class Yuangong implements Serializable {
	
	private int id;//Ա��id
	private String name;//����
	private String sex;//�Ա�
	private String age;//����
	private String tel;//�绰
	private String address;//��ַ
	private String zhiwei;//ְλ
	private int quanxian;// 0û��Ȩ��,1�ֿ����Ա
	private String loginName;//��¼��
	private String loginPw;//��¼����
	private String del;//״̬

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPw() {
		return loginPw;
	}

	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuanxian() {
		return quanxian;
	}

	public void setQuanxian(int quanxian) {
		this.quanxian = quanxian;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZhiwei() {
		return zhiwei;
	}

	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

}