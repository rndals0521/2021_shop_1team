package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;

public class EditCartCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		int su = Integer.parseInt(request.getParameter("su"));
		String idx = request.getParameter("idx");
		
		CVO cvo = new CVO();
		cvo = DAO.getCartOne(idx);
		cvo.setP_su(su);
		
		int result = DAO.getSuUpdate(cvo);
		
		return "MyController?cmd=showCart";
	}

}
