package com.orm;
/**
 * �ͻ���
 * @author ljl
 *
 */
public class Customer {
	private String id;//�ͻ����
	private String cname;//�ͻ�����
	private String csex;//�ͻ��Ա�
	private String ctel;//��ϵ��ʽ
	private String ctype;//����
	private String del;//�Ƿ�ɾ��
	
	public Customer() {}
	
	public Customer(String id,String name,String sex,String tel,String type,String del) {
		this.setId(id);
		this.setCname(name);
		this.setCsex(sex);
		this.setCtel(tel);
		this.setCtel(type);
		this.setDel(del);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCsex() {
		return csex;
	}
	public void setCsex(String csex) {
		this.csex = csex;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", cname=" + cname + ", csex=" + csex + ", ctel=" + ctel + ", ctype=" + ctype
				+ ", del=" + del + "]";
	}
	
	
}
