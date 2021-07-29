package com.example.project.model.notice.dto;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;


public class NoticeDTO {
	private int notice_idx;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	private int readcount;
	private MultipartFile file; 
	private String filename;
	private int filesize;
	private int down;	//다운받은 수
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	@Override
	public String toString() {
		return "NoticeDTO [notice_idx=" + notice_idx + ", writer=" + writer + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + ", readcount=" + readcount + ", file=" + file + ", filename="
				+ filename + ", filesize=" + filesize + ", down=" + down + "]";
	}
	

}
