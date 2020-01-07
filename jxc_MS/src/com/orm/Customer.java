package com.orm;
/**
 * 客户类
 * @author ljl
 *
 */
public class Customer {
	private String id;//客户编号
	private String cname;//客户姓名
	private String csex;//客户性别
	private String ctel;//联系方式
	private String ctype;//类型
	private String del;//是否删除
	
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
