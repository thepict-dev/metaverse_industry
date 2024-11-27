package com.utill;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.ObjectUtils;

import com.security.UserRole;

public class SessionHandler {
	public static void deleteAdmin(HttpServletRequest req) {
		Optional.ofNullable(req.getSession())
				.filter(session -> !ObjectUtils.isEmpty(session.getAttribute("role")))
				.filter(session -> session.getAttribute("role").equals(UserRole.ADMIN));
		/**
		 * 세션 유지시간 체크(세션이 너무 자주 끊김)
		 * 세션이 금방 종료되는 느낌의 이슈로 Admin -> Portal 접근 시 세션 삭제 취소
		 */
//				.ifPresent(session -> {
//					session.setAttribute("id", null);
//					session.setAttribute("name", null);
//					session.setAttribute("role", null);
//				});
	}
}
