package com.ict.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	
	private static SqlSession ss;
	
	private synchronized static SqlSession getSession() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(false);
		}
		
		return ss;
	}
	
	
	// 리스트
	public static List<VO> getList(String category){
		
		List<VO> list = null;
		list = getSession().selectList("list",category);
		return list;
	}

	// 상세조회
	public static VO getOneList(String idx) {
		VO vo = null;
		vo = getSession().selectOne("onelist",idx);
		return vo;
		
	}
	
	//로그인
	public static MVO getLogIn(MVO m_vo) {
		MVO mvo = null;
		mvo = getSession().selectOne("login",m_vo);
		return mvo;
	}
	
	//상품등록
	public static int getProductInsert(VO vo) {
		int result = 0 ;
		try {
			result = getSession().insert("product_add", vo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	// 카트 유무 검색
	public static CVO findProduct(CVO cvo) {
		
		CVO cvo_1 = null;
		cvo_1 = getSession().selectOne("find_cart",cvo);
		return cvo_1;
		
	}
	
	// 카트 삽입
	public static int addProduct(CVO cvo) {
		int result =0;
		result = getSession().insert("insert_cart",cvo);
		ss.commit();
		return result;
	}
	
	// 카트에 존재하는 제품 수량 증가
	public static int setQuant(CVO cvo) {
		int result = 0;
		result = getSession().update("update_su",cvo);
		ss.commit();
		return result;
		
		
	}
	
	// 카트 제품 삭제 
	public static int getDelete(String idx) {
		int result = 0;
		result = getSession().delete("delete_cart",idx);
		ss.commit();
		return result;
	}
	
	// id로 불러오는 cart
	public static List<CVO> getCartList(String id){
		
		List<CVO> list = null;
		list = getSession().selectList("cartlist",id);
		return list;
	}
	
	public static int getSuUpdate(CVO cvo) {
		
		int result = 0;
		
		result = getSession().update("SuUpdate",cvo);
		ss.commit();
		return result;
		
	}
	
	public static CVO getCartOne(String idx) {
		CVO cvo = null;
		cvo = getSession().selectOne("cartone",idx);
		return cvo;
		
	}
}