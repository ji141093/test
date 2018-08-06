package com.kh.firstSpring.notice.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice {
	
	private int no;
	private String title;
	private String content;
	private String writer;
	private int count;
	private Date date;
	private String attach;
	
	public Notice() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", count="
				+ count + ", date=" + date + ", attach=" + attach + ", toString()=" + super.toString() + "]";
	}

	
}
