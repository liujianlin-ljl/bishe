package com.orm;

import java.io.Serializable;

/**
 * œ˙¡ø≈≈––
 * @author ljl
 *
 */
public class XiaoLiangRank implements Serializable {
	private int id;
	private String catelogName;
	private String goodsName;
	private int xiaoLiang;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCatelogName() {
		return catelogName;
	}
	public void setCatelogName(String catelogName) {
		this.catelogName = catelogName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getXiaoLiang() {
		return xiaoLiang;
	}
	public void setXiaoLiang(int xiaoLiang) {
		this.xiaoLiang = xiaoLiang;
	}
	@Override
	public String toString() {
		return "XiaoLiangRank [id=" + id + ", catelogName=" + catelogName + ", goodsName=" + goodsName + ", xiaoLiang="
				+ xiaoLiang + "]";
	}
}
