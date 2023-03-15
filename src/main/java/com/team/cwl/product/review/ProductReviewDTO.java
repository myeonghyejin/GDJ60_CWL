package com.team.cwl.product.review;

import com.team.cwl.board.comment.BoardCommentDTO;

public class ProductReviewDTO extends BoardCommentDTO {
	
	private Integer lessonRating;
	
	public Integer getLessonRating() {
		return lessonRating;
	}

	public void setLessonRating(Integer lessonRating) {
		this.lessonRating = lessonRating;
	}

}