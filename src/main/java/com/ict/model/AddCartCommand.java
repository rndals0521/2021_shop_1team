package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;
import com.ict.db.MVO;
import com.ict.db.VO;

public class AddCartCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String idx = request.getParameter("idx");
		String p_num = request.getParameter("p_num");
		
		
		/* Cart.addProduct(idx); */
		MVO mvo = (MVO)request.getSession().getAttribute("mvo");

		CVO cvo = new CVO();
		VO vo = DAO.getOneList(idx);
		
		
		cvo.setP_num(p_num);
		cvo.setP_name(vo.getP_name());
		cvo.setP_price(vo.getP_price());
		cvo.setP_saleprice(vo.getP_saleprice());
		/* cvo.setP_su(1); */
		cvo.setId(mvo.getId());

		CVO c_vo = DAO.findProduct(cvo);
		

		if(c_vo == null ) {
			int result = DAO.addProduct(cvo);

		}else 
		{ 
			int result2 = DAO.setQuant(cvo);
		}


		return "MyController?cmd=onelist&idx="+idx;
	}

}
