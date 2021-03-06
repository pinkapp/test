package com.sky.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.orm.jpa.support.JpaDaoSupport;

import com.sky.model.TAdmin;

public class LoginService extends JpaDaoSupport {
	public String login(String userName, String userPw, int userType) {
		String result = "no";

		if (userType == 0)// 系统管理员登陆
		{
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("userName", userName);
			params.put("userPw", userPw);
			String hql = "select admin from TAdmin admin where admin.userName = :userName and admin.userPw = :userPw";
			List users = getJpaTemplate().findByNamedParams(hql, params);
			if (users.isEmpty()) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				session.setAttribute("admin", users.get(0));
				session.setAttribute("userType", userType);
				result = "yes";
			}
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("loginname", userName);
			params.put("loginpw", userPw);
			params.put("type", userType);
			String hql = "select user from Tuser user where user.type = :type and user.loginname = :loginname and user.loginpw = :loginpw";
			List users = getJpaTemplate().findByNamedParams(hql, params);
			if (users.isEmpty()) {
				result = "no";
			} else {
				WebContext ctx = WebContextFactory.get();
				HttpSession session = ctx.getSession();
				session.setAttribute("user", users.get(0));
				session.setAttribute("userType", userType);
				result = "yes";
			}
		}
		return result;
	}

	public String adminPwEdit(String userPwNew) {

		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getSession();
		TAdmin admin = (TAdmin) session.getAttribute("admin");
		TAdmin model = getJpaTemplate().find(TAdmin.class, admin.getUserId());
		model.setUserPw(userPwNew);
		getJpaTemplate().merge(model);
		return "yes";
	}

	public List zhuanyeAll() {
		String hql = "select ze from Tzhuanye ze where ze.del = 'no'";
		return getJpaTemplate().find(hql);
	}

	public List banjiAll() {
		String hql = "select bj from Tbanji bj where bj.del = 'no'";
		return getJpaTemplate().find(hql);
	}

	public List stuAll() {
		String hql = "select t from Tstu t where t.del = 'no'";
		return getJpaTemplate().find(hql);
	}

	public List kechengAll() {
		String hql = "select t from Tkecheng t where t.del = 'no'";
		return getJpaTemplate().find(hql);
	}

	public List teaAll() {
		String hql = "select t from Ttea t where t.del = 'no'";
		return getJpaTemplate().find(hql);
	}
}
