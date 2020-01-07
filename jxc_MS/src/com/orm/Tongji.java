package com.orm;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 统计类 用于统计入库|出库总金额
 * 
 * @author ljl
 *
 */
public class Tongji implements Serializable {

	private int month;// 月份
	private BigDecimal money;// 总金额

	public Tongji() {
		super();
	}

	public Tongji(int month, BigDecimal money) {
		super();
		this.month = month;
		this.money = money;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

}
