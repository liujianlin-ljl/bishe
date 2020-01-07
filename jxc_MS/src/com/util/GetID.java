package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 得到随机单号
 * 
 * @author ljl
 *
 */
public class GetID {
	/**
	 * 用UUID生成十六位数唯一订单号 生成16位唯一性的订单号s
	 */
	public static String getUID(String type) {
		// 随机生成一位整数
		// int random = (int) (Math.random() * 9 + 1);
		// String valueOf = String.valueOf(random);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		// 生成uuid的hashCode值
		int hashCode = UUID.randomUUID().toString().hashCode();
		// 可能为负数
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		// 0 代表前面补充0
		// 4 代表长度为4
		// d 代表参数为正数型
		return type + date + String.format("%04d", hashCode);
	}

	public static String getCustomerId() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		// 生成uuid的hashCode值
		int hashCode = UUID.randomUUID().toString().hashCode();
		// 可能为负数
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		return date.substring(2) + hashCode;
	}

	public static String getUserName() {
		// 随机生成一位整数
		int length = (int) (Math.random() * 9 + 1);
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

	public static String getGoodsId() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		// 生成uuid的hashCode值
		int hashCode = UUID.randomUUID().toString().hashCode();
		// 可能为负数
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		return "G"+date+String.valueOf(hashCode).substring(0, 5);
	}

	public static void main(String[] args) {
		// System.out.println(getUserName());
		// String str="[Tgoods [id=24, catelog_id=24, name=苹果MacBook Pro, chandi=江苏南京,
		// danwei=苹果科技有限公司, guige=15英寸, beizhu=无, del=null, catelog_name=null], Tgoods
		// [id=25, catelog_id=24, name=苹果MQD42CH/A, chandi=浙江杭州, danwei=苹果科技有限公司,
		// guige=16YINGCUN , beizhu=无, del=null, catelog_name=null], Tgoods [id=26,
		// catelog_id=24, name=苹果MR962CH/A, chandi=广东深圳, danwei=苹果科技有限公司, guige=13.3英寸,
		// beizhu=无, del=null, catelog_name=null], Tgoods [id=27, catelog_id=24,
		// name=苹果MPXQ2CH/A, chandi=广东广州, danwei=苹果科技有限公司, guige=13英寸, beizhu=无,
		// del=null, catelog_name=null]]";
		// System.out.println(str.length());
		System.out.println(getGoodsId());
	}

}
