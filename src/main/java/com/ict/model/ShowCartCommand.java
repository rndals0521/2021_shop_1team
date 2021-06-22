package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;
import com.ict.db.MVO;
import com.ict.db.VO;

public class ShowCartCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		MVO mvo = (MVO)request.getSession().getAttribute("mvo");
		
		List<CVO> cartList = DAO.getCartList(mvo.getId());
		
		
		
		int sum = 0;
		int total = 0;
		for (CVO cvo : cartList) {
			sum = cvo.getP_saleprice()*cvo.getP_su();
			total += sum;
			
		}
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("total", total);
		
		/* request.setAttribute("total", Cart.total); */
		
		return "view/viewcart.jsp";
	}

}
