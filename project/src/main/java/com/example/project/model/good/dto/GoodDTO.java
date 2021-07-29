package com.example.project.model.good.dto;

public class GoodDTO {
	private int good_idx;
	private String userid;
	private int rt_idx;
	private int good_check;
	private String writer;
	private String category;
	private String rt_name;
	private int ppp;
	private String picture_url;

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRt_name() {
		return rt_name;
	}

	public void setRt_name(String rt_name) {
		this.rt_name = rt_name;
	}

	public int getPpp() {
		return ppp;
	}

	public void setPpp(int ppp) {
		this.ppp = ppp;
	}

	public int getGood_idx() {
		return good_idx;
	}

	public void setGood_idx(int good_idx) {
		this.good_idx = good_idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getRt_idx() {
		return rt_idx;
	}

	public void setRt_idx(int rt_idx) {
		this.rt_idx = rt_idx;
	}

	public int getGood_check() {
		return good_check;
	}

	public void setGood_check(int good_check) {
		this.good_check = good_check;
	}

	@Override
	public String toString() {
		return "GoodDTO [good_idx=" + good_idx + ", userid=" + userid + ", rt_idx=" + rt_idx + ", good_check="
				+ good_check + "]";
	}

}
