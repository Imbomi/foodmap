package com.example.project.model.restaurant.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class RestaurantDTO {
	private int rt_idx;
	private String rt_name;
	private String rt_summary;
	private String category;
	private String writer;
	private int ppp;
	private String rt_content;
	private String picture_url;
	private MultipartFile file;
	private Date regdate;
	private int readcount;
	private int goodcount;
	private int postcode;
	private String address1;
	private String address2;

	public int getPostcode() {
		return postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPpp() {
		return ppp;
	}

	public void setPpp(int ppp) {
		this.ppp = ppp;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getRt_idx() {
		return rt_idx;
	}

	public void setRt_idx(int rt_idx) {
		this.rt_idx = rt_idx;
	}

	public String getRt_name() {
		return rt_name;
	}

	public void setRt_name(String rt_name) {
		this.rt_name = rt_name;
	}

	public String getRt_summary() {
		return rt_summary;
	}

	public void setRt_summary(String rt_summary) {
		this.rt_summary = rt_summary;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRt_content() {
		return rt_content;
	}

	public void setRt_content(String rt_content) {
		this.rt_content = rt_content;
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
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

	public int getGoodcount() {
		return goodcount;
	}

	public void setGoodcount(int goodcount) {
		this.goodcount = goodcount;
	}

	@Override
	public String toString() {
		return "RestaurantDTO [rt_idx=" + rt_idx + ", rt_name=" + rt_name + ", rt_summary=" + rt_summary + ", writer="
				+ writer + ", ppp=" + ppp + ", rt_content=" + rt_content + ", picture_url=" + picture_url + ", file="
				+ file + ", regdate=" + regdate + ", readcount=" + readcount + ", goodcount=" + goodcount + "]";
	}

}
