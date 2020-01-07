package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * �õ��������
 * 
 * @author ljl
 *
 */
public class GetID {
	/**
	 * ��UUID����ʮ��λ��Ψһ������ ����16λΨһ�ԵĶ�����s
	 */
	public static String getUID(String type) {
		// �������һλ����
		// int random = (int) (Math.random() * 9 + 1);
		// String valueOf = String.valueOf(random);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		// ����uuid��hashCodeֵ
		int hashCode = UUID.randomUUID().toString().hashCode();
		// ����Ϊ����
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		// 0 ����ǰ�油��0
		// 4 ������Ϊ4
		// d �������Ϊ������
		return type + date + String.format("%04d", hashCode);
	}

	public static String getCustomerId() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		// ����uuid��hashCodeֵ
		int hashCode = UUID.randomUUID().toString().hashCode();
		// ����Ϊ����
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		return date.substring(2) + hashCode;
	}

	public static String getUserName() {
		// �������һλ����
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
		// ����uuid��hashCodeֵ
		int hashCode = UUID.randomUUID().toString().hashCode();
		// ����Ϊ����
		if (hashCode < 0) {
			hashCode = -hashCode;
		}
		return "G"+date+String.valueOf(hashCode).substring(0, 5);
	}

	public static void main(String[] args) {
		// System.out.println(getUserName());
		// String str="[Tgoods [id=24, catelog_id=24, name=ƻ��MacBook Pro, chandi=�����Ͼ�,
		// danwei=ƻ���Ƽ����޹�˾, guige=15Ӣ��, beizhu=��, del=null, catelog_name=null], Tgoods
		// [id=25, catelog_id=24, name=ƻ��MQD42CH/A, chandi=�㽭����, danwei=ƻ���Ƽ����޹�˾,
		// guige=16YINGCUN , beizhu=��, del=null, catelog_name=null], Tgoods [id=26,
		// catelog_id=24, name=ƻ��MR962CH/A, chandi=�㶫����, danwei=ƻ���Ƽ����޹�˾, guige=13.3Ӣ��,
		// beizhu=��, del=null, catelog_name=null], Tgoods [id=27, catelog_id=24,
		// name=ƻ��MPXQ2CH/A, chandi=�㶫����, danwei=ƻ���Ƽ����޹�˾, guige=13Ӣ��, beizhu=��,
		// del=null, catelog_name=null]]";
		// System.out.println(str.length());
		System.out.println(getGoodsId());
	}

}
