package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * 加密算法
 * @author ljl
 *
 */
public class md5{

	public static String md5s(String plainText)
	{
		String str=null;
		try
		{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++)
			{
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
			
			
		} catch (NoSuchAlgorithmException e)
		{
			e.printStackTrace();

		}
		return str;
	}

	public static void main(String agrs[])
	{
		String s=md5.md5s("admin");
		System.out.println("admin加密后："+s);
		System.out.println("123加密后："+md5.md5s("123"));
		System.out.println("admin加密后："+md5.md5s("admin"));
		System.out.println("123加密后："+md5.md5s("123"));
	}

}