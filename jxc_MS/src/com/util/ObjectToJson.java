package com.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import com.orm.Tgoods;

public class ObjectToJson {
	
	 public static <T> String fromList(List<T> list) throws Throwable {
	        StringBuilder json = new StringBuilder();

	        if (list == null || list.size() == 0) {
	            return null;
	        }

	        json.append("[");

	        for(int i = 0; i < list.size(); i++) {
	            json.append("{");
	            T t = list.get(i);
	            Class clazz = t.getClass();
	            Field[] fields = t.getClass().getFields();
	            for(int j=0; j<fields.length; j++) {
	                Field field = fields[j];
	                String strFields = field.getName();
	                System.out.println(strFields);
	                String getMethodName = "get"+ strFields.substring(0, 1).toUpperCase() + strFields.substring(1);
	                Method method =clazz.getMethod(getMethodName, new Class[]{});
	                Object value = method.invoke(t, new Object[]{});
	                json.append("\"" + strFields + "\"" + ":" + "\"" + value + "\"");

	                if (j < fields.length - 1) {
	                    json.append(",");
	                }
	            }
	            json.append("}");
	            if (i < list.size() - 1) {
	                json.append(",");
	            }
	        }

	        json.append("]");

	        return json.toString();
	    }

	public static void main(String[] args) {
		List<Tgoods> list=new ArrayList<>();
		Tgoods good=new Tgoods();
		good.setId("2");
		good.setName("С��");
		list.add(good);
		Tgoods good2=new Tgoods();
		good2.setId("5");
		good2.setName("��Ϊ");
		list.add(good);
//		try {
//			System.out.println(fromList(list));
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
		//[{"id":"19","name":"С�ױʼǱ�Pro"},{"id":"21","name":"С�ױʼǱ�Pro GTX��"},{"id":"22","name":"С����Ϸ��"},{"id":"23","name":"С����Ϸ��2019��"},{"id":"36","name":"da"}]
		
	}

}
