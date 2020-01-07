package com.ljl.dao;

import java.util.List;

/**
 * ����DAO�ӿ����
 * @author ljl
 * @version 1.0
 */
public interface BaseDao<T> {
	/**
	 * ����
	 * @param entity
	 * @return
	 */
	int save(T entity) throws Exception;
	/**
	 * ����
	 * @param entity
	 * @return
	 */
	int update(T entity) throws Exception;
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
	int delete(Object id) throws Exception;
	/**
	 * ��ѯȫ��
	 * @return
	 */
	List<T> findAll() throws Exception;
	/**
	 * ����������ѯ
	 * @param id
	 * @return
	 */
	T findById(Object id) throws Exception;

}
