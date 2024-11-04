package com.security;

import javax.servlet.http.HttpServletRequest;

public enum UserRole {
	ADMIN, MEMBER;
	
	public synchronized static boolean adminValidation(HttpServletRequest req) {
		return req.getSession().getAttribute("role").equals(UserRole.ADMIN) ? true : false;
	}
}
