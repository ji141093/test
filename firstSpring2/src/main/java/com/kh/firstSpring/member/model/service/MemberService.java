package com.kh.firstSpring.member.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstSpring.member.model.dao.MemberDao;
import com.kh.firstSpring.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	MemberDao dao;
	
	public Member selectMember(Member member) {
		System.out.println("service 호출 확인");
		
		return dao.selectMember(member);
	}

	public int insertMember(Member member) {
		return dao.insertMember(member);
	}

	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	public int deleteMember(String userid) {
		return dao.deleteMember(userid);
	}

}
