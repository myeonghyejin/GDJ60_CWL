package com.team.cwl.lesson.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class LessonReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.lesson.review.LessonReviewDAO.";
	
//--------------------------------------------
	
	/** SELECT **/
	public List<LessonReviewDTO> getLessonReviewList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getLessonReviewList", pagination);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}

	/** INSERT **/
	public int setLessonReviewAdd(LessonReviewDTO lessonReviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setLessonReviewAdd", lessonReviewDTO);
	}
	
	/** UPDATE **/
	public int setLessonReviewUpdate(LessonReviewDTO lessonReviewDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setLessonReviewUpdate", lessonReviewDTO);
	}
	
	/** DELETE **/
	public int setLessonReviewDelete(LessonReviewDTO lessonReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setLessonReviewDelete", lessonReviewDTO);
	}

}
