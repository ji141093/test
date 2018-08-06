package com.kh.firstSpring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.firstSpring.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectMember(Member member) {
		System.out.println("dao 호출 확인");
		
		return sqlSession.selectOne("MemberMapper.selectMemberId", member);
	}

	public int insertMember(Member member) {
		return sqlSession.insert("MemberMapper.insertMember", member);
	}

	public int updateMember(Member member) {
		return sqlSession.update("MemberMapper.updateMember", member);
	}

	public int deleteMember(String userid) {
		return sqlSession.delete("MemberMapper.deleteMember", userid);
	}

}
