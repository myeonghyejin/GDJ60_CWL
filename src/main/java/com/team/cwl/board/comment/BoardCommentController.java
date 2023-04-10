package com.team.cwl.board.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/board/comment/*")
public class BoardCommentController {
	
	@Autowired
	private BoardCommentService boardCommentService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getBoardCommentList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<BoardCommentDTO> ar = boardCommentService.getBoardCommentList(pagination);
		
		modelAndView.setViewName("board/comment/comment");
		modelAndView.addObject("list", ar);
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setBoardCommentAdd(BoardCommentDTO boardCommentDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		boardCommentDTO.setMemberId(memberDTO.getMemberId());
		
		int result = boardCommentService.setBoardCommentAdd(boardCommentDTO, null);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	@PostMapping("reply")
	public ModelAndView setBoardCommentReplyAdd(BoardCommentDTO boardCommentDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		boardCommentDTO.setMemberId(memberDTO.getMemberId());
		
		int result = boardCommentService.setBoardCommentReplyAdd(boardCommentDTO, null);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@PostMapping("update")
	public ModelAndView setBoardCommentUpdate(BoardCommentDTO boardCommentDTO, ModelAndView modelAndView) throws Exception {
		int result = boardCommentService.setBoardCommentUpdate(boardCommentDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setBoardCommentDelete(BoardCommentDTO boardCommentDTO, ModelAndView modelAndView) throws Exception {
		int result = boardCommentService.setBoardCommentDelete(boardCommentDTO, null);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}
