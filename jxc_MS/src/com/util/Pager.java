package com.util;

import java.util.ArrayList;
import java.util.List;

import com.orm.Cangku;

/**
 * ��ҳ��
 * @author ljl
 *
 * @param <T>
 */
public class Pager<T> {
	private Integer pageNow=1;//��ǰҳ��Ĭ��Ϊ��1ҳ
	private Integer pageSize=5;//ÿҳ��ʾ��������Ĭ��ÿҳ��ʾ5��
	private Integer prePage;//��һҳ
	private Integer nextPage;//��һҳ
	private Integer totalPage;//��ҳ��
	private Integer startIndex;//��ʼλ��
	private Integer endIndex;//����λ��
	private List<T> dataList;//�����б�
	
	public Pager() {}
	
	public Pager(Integer currentPage, Integer pageSize, Integer totalCount){
		this.pageNow = currentPage;
        this.pageSize = (pageSize == null ? this.pageSize : pageSize);
        this.totalPage = totalCount;
        this.prePage = (currentPage == 1 ? 1 : currentPage-1);
        this.totalPage = (totalCount % this.pageSize == 0 ? totalCount / this.pageSize : totalCount / this.pageSize + 1);
        this.nextPage = (currentPage == totalPage) ? totalPage : (currentPage + 1);
        this.startIndex =(currentPage - 1) * this.pageSize + 1;
        this.endIndex = currentPage * this.pageSize;
    }
	
	public Integer getPageNow() {
		return pageNow;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPrePage() {
		return prePage;
	}
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}
	public Integer getNextPage() {
		return nextPage;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	public Integer getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	public static void main(String[] args) {
		Pager<Cangku> pager=new Pager<>(1,2,5);
		pager.setStartIndex(1);
		//System.out.println("��ʼ��"+pager.getStartIndex());
		pager.setEndIndex(3);
		//System.out.println("��һҳ��ʼ"+pager.getStartIndex());
		pager.setStartIndex(pager.getStartIndex()+pager.getPageSize());
		pager.setEndIndex(pager.getEndIndex()+pager.getPageSize());
		List<Cangku> list=new ArrayList<>();
		list.add(new Cangku(2, "һ�Ųֿ�", "����", "123456", "nanchangshi", 200, "no"));
		list.add(new Cangku(4, "���Ųֿ�", "����", "123456", "nanchangshi", 200, "no"));
		list.add(new Cangku(33, "���Ųֿ�", "����", "123456", "nanchangshi", 200, "no"));
		list.add(new Cangku(11, "�ĺŲֿ�", "����", "123456", "nanchangshi", 200, "no"));
		list.add(new Cangku(66, "�޺Ųֿ�", "����", "123456", "nanchangshi", 200, "no"));
		pager.setDataList(list);
		System.out.println("ÿҳ��ʾ����"+pager.getPageSize());
		System.out.println("��һҳ"+pager.getPrePage());
		System.out.println("��һҳ"+pager.getNextPage());
		System.out.println("��ҳ��"+pager.getTotalPage());
		System.out.println("��ǰҳ"+pager.getPageNow());
		for (int i=pager.getStartIndex()-1;i<=pager.getEndIndex();i++) {
			System.out.println(pager.getDataList().get(i));
		}
	}
	
}
