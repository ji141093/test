package com.kh.firstSpring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.firstSpring.member.model.service.MemberService;
import com.kh.firstSpring.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping("memberList.do")
	public String memberList(){
		return "member/memberList";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(Member member, HttpSession session){
		Member user = memberService.selectMember(member);
		System.out.println(user);
		if(null != user && user.getPassword().equals(member.getPassword())) {
			session.setAttribute("user", user);
		} else {
			System.out.println("비밀번호가 일치하지 않습니다.");
		}
//		member.setUsername("김정인");
//		session.setAttribute("user", member);
		/*return "home";*/
		return "redirect:index.do";
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:index.do";
	}
	
	@RequestMapping("memberJoinForm.do")
	public String memberJoinForm(){
		return "member/memberJoin";
	}
	
	@RequestMapping("join.do")
	public String memberJoin(Member member, @RequestParam String phone, @RequestParam String address){
		// 1. vo에 phone1, phone2, phone3, zipcode, address1, address2 속성 추가하는 방법
		// 2. requestParam으로 합쳐진 데이터 전달 받는 방법
		member.setPhone(phone);
		member.setAddress(address);
		
		int result = memberService.insertMember(member);
		if(0 < result) {
			System.out.println(member.toString());
		} else {
			System.out.println("가입실패");
		}
		return "redirect:index.do";
	}
	
	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm(){
		return "member/memberUpdate";
	}

	@RequestMapping("updateMember.do")
	public String memberUpdate(Member member, HttpSession session){
		int result = memberService.updateMember(member);
		if(0 < result) {
			session.setAttribute("user", memberService.selectMember(member));
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="idCheck.do", produces="application/text; charset=utf-8")
	public @ResponseBody String checkMemberId(String id){
//		System.out.println(id);
		Member member = new Member();
		member.setUserid(id);
		member = memberService.selectMember(member);
		
		return (member == null) ? "사용가능한 아이디" : "중복된 아이디";
	}
	
	@RequestMapping("deleteMember.do")
	public String deleteMember(HttpSession session){
		int result = memberService.deleteMember(((Member) session.getAttribute("user")).getUserid());
		if(0 < result) {
			session.invalidate();
		}
		return "redirect:index.do";
	}
}
