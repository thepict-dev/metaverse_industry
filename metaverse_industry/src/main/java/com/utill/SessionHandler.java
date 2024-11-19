package com.utill;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.ObjectUtils;

import com.security.UserRole;

public class SessionHandler {
	public static void deleteAdmin(HttpServletRequest req) {
		Optional.ofNullable(req.getSession())
				.filter(session -> !ObjectUtils.isEmpty(session.getAttribute("role")))
				.filter(session -> session.getAttribute("role").equals(UserRole.ADMIN))
				.ifPresent(session -> {
					session.setAttribute("id", null);
					session.setAttribute("name", null);
					session.setAttribute("role", null);
				});
	}
}
