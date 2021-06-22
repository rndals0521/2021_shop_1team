package com.ict.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ict.db.DAO;
import com.ict.db.VO;

public class Cart {
	static List<VO> cartList;	//카트에 담겨질 제품 리스트
	static int total;			//카트 전체 금액
	static {
		cartList = new ArrayList<VO>();
	}
	
	
	// 카트에 해당 제품이 있는지 없는지 검사하는 메소드
	public static VO findProduct(String idx) {
		VO cvo = null;
		Iterator<VO> it  = cartList.iterator();
		while(it.hasNext()) {
			VO vo = (VO) it.next();
			if(vo.getIdx().equalsIgnoreCase(idx)) {
				cvo = vo;
				break;
			}
		}
		
		return cvo;
	}

	// 카트에 제품을 담는 메소드
	// 카트에 담을 제품이 현재 카트에 존재하면 수량만 증가
	// 카트에 담을 제품이 현재 카트에 존재하지 않으면 카트에 추가
	public static void addProduct(String idx) {
		VO vo = findProduct(idx);
		if(vo == null) {
			// 현재 카트에 제품이 없다는 뜻(카트에 제품을 담는다.)
			vo = DAO.getOneList(idx);
			vo.setQuant(1); // 카트에 존재하는 제품의 수량
			cartList.add(vo);
		}else {
			// 카트에 존재하는 제품의 수량을 꺼내서 1 증가 시키니다.
			vo.setQuant(vo.getQuant()+1);
		}
		// 할인제품과 아닌 제품을 구별해야된다.
		total = total + vo.getP_saleprice();
	}
		
		
		
	// 카트보기에서 카트에 수량을 변경하는 메소드
	public static void setQuant(String idx, int su) {
		VO vo = findProduct(idx);
		total = total - vo.getTotalPrice();
		
		vo.setQuant(su);
		total = total + vo.getTotalPrice();
	}
		
	// 카트보기에서 카트에 제품을 삭제하는 메소드
	public static void setDelete(String idx) {
		VO vo = findProduct(idx);
		cartList.remove(vo);
		total = total - vo.getTotalPrice();
	}
}
