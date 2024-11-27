package com.security;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

public enum UserRole {
	ADMIN, MEMBER;
	
	public synchronized static boolean adminValidation(HttpServletRequest req) {
		return req.getSession().getAttribute("role").equals(UserRole.ADMIN) ? true : false;
	}
	
	public synchronized static boolean adminValidationOptional(HttpServletRequest req) {
		Optional<Object> role = Optional.ofNullable(req.getSession().getAttribute("role"));
		if(role.isPresent()) {
			return role.get().equals(UserRole.ADMIN) ? true : false;
		} else {
			return false;
		}
	}
}
