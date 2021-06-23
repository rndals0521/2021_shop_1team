package com.ict.model;


import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class DeleteCartCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String[] result = request.getParameterValues("result");
		String result_v = result[0];
		String[] result_v2 = result_v.split(",");
		
		for (int i = 0; i < result_v2.length; i++) {
			
			int result2 = DAO.getDelete(result_v2[i]);
		}
		
		
		return "MyController?cmd=showCart";
	}
}
