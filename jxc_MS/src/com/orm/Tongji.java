package com.orm;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * ͳ���� ����ͳ�����|�����ܽ��
 * 
 * @author ljl
 *
 */
public class Tongji implements Serializable {

	private int month;// �·�
	private BigDecimal money;// �ܽ��

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
