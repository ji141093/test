package com.kh.firstSpring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstSpring.member.model.service.MemberService;
import com.kh.firstSpring.notice.model.service.NoticeService;
import com.kh.firstSpring.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("paramTest.do")
	public String paramTest(int no, String title){
		System.out.println(no);
		System.out.println(title);

		return "home";
	}
	
	@RequestMapping("paramTest1.do")
	public String paramTest1(@RequestParam("no") int number, @RequestParam("title") String title){
		System.out.println(number);
		System.out.println(title);

		return "home";
	}

	@RequestMapping("paramTest2.do")
	public String paramTest2(Notice notice/*, HttpServletRequest request, HttpSession session*/){
//		request.getParameter("no");
//		session.setAttribute("user", user);
		
		System.out.println(notice);
		return "home";
	}
	
	@RequestMapping("returnParam.do")
	public String retrunParameter(Notice notice, Model model){
		model.addAttribute("notice", notice);
		return "param/printParam";
	}

	@RequestMapping("returnParam1.do")
	public ModelAndView retrunParameter1(Notice notice, ModelAndView mv){
		mv.addObject("notice", notice);
		mv.setViewName("param/printParam");
		return mv;
	}
	
	@RequestMapping("printNotice.do")
	public ModelAndView printNotice(Notice notice, ModelAndView mv){
		mv.addObject("notice", notice);
		mv.setViewName("param/printParam1");
		return mv;
	}
	
	@RequestMapping("noticeList.do")
	public String selectNoticeList(Model model){
		List<Notice> list = noticeService.selectNoticeList();
		model.addAttribute("list", list);
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeDetail.do")
	public ModelAndView noticeDetail(int no, ModelAndView mv){
		Notice notice = noticeService.selectNotice(no);
		if(null != notice){
			mv.addObject("notice", notice);
			mv.setViewName("notice/noticeDetail");
		}
		return mv;
	}
	
	@RequestMapping("writeNoticeForm.do")
	public String writeNoticeForm(){
		return "notice/noticeForm";
	}
	
	@RequestMapping("writeNotice.do")
	public String writeNotice(Notice notice, @RequestParam("file") MultipartFile file, HttpServletRequest request){
//		System.out.println(notice);
//		System.out.println(file.getOriginalFilename());
		
		// 파일 업로드/다운로드 -> cos.jar 이용해야 함.
		// 3. 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path = root + "\\upload";
		String filePath = "";
		File folder = new File(path);
		if(! folder.exists()){
			folder.mkdir();
		}
		
		filePath = folder + "\\" + file.getOriginalFilename();
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		notice.setAttach(file.getOriginalFilename());
		
		String view = "redirect:noticeList.do";
		try{
			int result = noticeService.insertNotice(notice);
		} catch(Exception e) {
			view = "error";
		}
		
		return view;
	}
	
	@RequestMapping("updateNoticeForm.do")
	public String updateNoticeForm(int no, Model model){
		Notice notice = noticeService.selectNotice(no);
		model.addAttribute("notice", notice);
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("updateNotice.do")
	public String updateNotice(Notice notice, @RequestParam("addedFile") MultipartFile file, HttpServletRequest request){
		// 기존 파일 삭제
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path = root + "\\upload";
		String filePath = "";
		File folder = new File(path);
		
		filePath = folder + "\\" + notice.getAttach();
		File oldFile = new File(filePath);
		if(oldFile.exists()){
			oldFile.delete();
		}
		
		// 새로운 파일 저장
		String newFilePath = folder + "\\" + file.getOriginalFilename();
		try {
			file.transferTo(new File(newFilePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		notice.setAttach(file.getOriginalFilename());
		int result = noticeService.updateNotice(notice);
		
		return "redirect:noticeDetail.do?no=" + notice.getNo();
	}
	
	@RequestMapping("deleteNotice.do")
/*	public String deleteNotice(int no, HttpServletRequest request){*/	
	public String deleteNotice(Notice notice, HttpServletRequest request){
		String root = request.getSession().getServletContext().getRealPath("resources");
		String path = root + "\\upload";
		String filePath = "";
		File folder = new File(path);
		
		if(null != notice.getAttach()) {
			filePath = folder + "\\" + notice.getAttach();
			File oldFile = new File(filePath);
			if(oldFile.exists()){
				oldFile.delete();
			}
		}
		
		int result = noticeService.deleteNotice(notice);
		
		return "redirect:noticeList.do";
	}
	
}
