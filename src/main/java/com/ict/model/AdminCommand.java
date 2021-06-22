package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "view/admin.jsp";
	}
}
