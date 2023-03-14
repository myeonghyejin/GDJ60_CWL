package com.team.cwl.board.review;

import com.team.cwl.board.comment.BoardCommentDTO;

public class BoardReviewDTO extends BoardCommentDTO {
	
	private Integer lessonRating;
	
	public Integer getLessonRating() {
		return lessonRating;
	}

	public void setLessonRating(Integer lessonRating) {
		this.lessonRating = lessonRating;
	}

}