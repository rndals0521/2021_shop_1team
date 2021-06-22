package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.MVO;

public class Login_okCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		MVO m_vo = new MVO();
		m_vo.setId(request.getParameter("id"));
		m_vo.setPw(request.getParameter("pw"));
		
		MVO mvo = DAO.getLogIn(m_vo);
		
		if(mvo==null) {
			return "MyController?cmd=login";
		}else {
			
			request.getSession().setAttribute("mvo", mvo);
			request.getSession().setAttribute("login", "ok");
			
			// 관리자인지 일반유저인지 검사
			// 관리자는 상품추가가능한 페이지로 이동, 일반 유저는 product_list.jsp로 이동
			if(mvo.getId().equals("admin")) {
				request.getSession().setAttribute("admin", "ok");
				return "MyController?cmd=admin";
			}
			return "view/product_list.jsp";
		}
	}
}
