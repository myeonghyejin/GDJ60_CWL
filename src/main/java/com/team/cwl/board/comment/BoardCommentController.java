package com.team.cwl.board.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.util.Pagination;

@Controller("/boardComment/*")
public class BoardCommentController {
	
	@Autowired
	private BoardCommentService boardCommentService;
	
//--------------------------------------------
	
	@GetMapping("list")
	public ModelAndView getBoardCommentList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<BoardCommentDTO> ar = boardCommentService.getBoardCommentList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("boardComment/list");
		
		return modelAndView;
	}
	
}
