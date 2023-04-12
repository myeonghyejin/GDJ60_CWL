package com.team.cwl.lesson;

import java.sql.Date;
import java.util.List;

public class LessonDTO {
	
	private Long lessonNum;
	private String memberId;
	private String lessonUrl;
	private String lessonTitle;
	private String lessonTeacher;
	private String lessonContents;
	private Long lessonHit;
	private Date lessonDate;
	
	private LessonImgDTO lessonImgDTOs;
	
	public Long getLessonNum() {
		return lessonNum;
	}
	public void setLessonNum(Long lessonNum) {
		this.lessonNum = lessonNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getLessonUrl() {
		return lessonUrl;
	}
	public void setLessonUrl(String lessonUrl) {
		this.lessonUrl = lessonUrl;
	}
	public String getLessonTitle() {
		return lessonTitle;
	}
	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}
	public String getLessonTeacher() {
		return lessonTeacher;
	}
	public void setLessonTeacher(String lessonTeacher) {
		this.lessonTeacher = lessonTeacher;
	}
	public String getLessonContents() {
		return lessonContents;
	}
	public void setLessonContents(String lessonContents) {
		this.lessonContents = lessonContents;
	}
	public Long getLessonHit() {
		return lessonHit;
	}
	public void setLessonHit(Long lessonHit) {
		this.lessonHit = lessonHit;
	}
	public Date getLessonDate() {
		return lessonDate;
	}
	public void setLessonDate(Date lessonDate) {
		this.lessonDate = lessonDate;
	}
	public LessonImgDTO getLessonImgDTOs() {
		return lessonImgDTOs;
	}
	public void setLessonImgDTOs(LessonImgDTO lessonImgDTOs) {
		this.lessonImgDTOs = lessonImgDTOs;
	}

}
