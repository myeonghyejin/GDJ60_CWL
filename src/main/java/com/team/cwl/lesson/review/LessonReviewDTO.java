package com.team.cwl.lesson.review;

import java.sql.Date;

public class LessonReviewDTO {
	
	private Long lessonReviewNum;
	private Long lessonNum;
	private String memberId;
	private String lessonReviewContents;
	private Date lessonReviewDate;
	private Integer lessonRating;
	
	public Long getLessonReviewNum() {
		return lessonReviewNum;
	}
	public void setLessonReviewNum(Long lessonReviewNum) {
		this.lessonReviewNum = lessonReviewNum;
	}
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
	public String getLessonReviewContents() {
		return lessonReviewContents;
	}
	public void setLessonReviewContents(String lessonReviewContents) {
		this.lessonReviewContents = lessonReviewContents;
	}
	public Date getLessonReviewDate() {
		return lessonReviewDate;
	}
	public void setLessonReviewDate(Date lessonReviewDate) {
		this.lessonReviewDate = lessonReviewDate;
	}
	public Integer getLessonRating() {
		return lessonRating;
	}
	public void setLessonRating(Integer lessonRating) {
		this.lessonRating = lessonRating;
	}
	
}
