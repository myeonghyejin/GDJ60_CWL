package com.team.cwl.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

//----------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getBoardList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<BoardDTO> ar = boardService.getBoardList(pagination);
		
		modelAndView.setViewName("board/list");
		modelAndView.addObject("list", ar);
		
		return modelAndView;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(BoardDTO boardDTO, ModelAndView modelAndView) throws Exception {
		boardDTO = boardService.getBoardDetail(boardDTO);
		
		boardService.setBoardHitUpdate(boardDTO);
		
		modelAndView.setViewName("board/detail");
		modelAndView.addObject("DTO", boardDTO);
		
		return modelAndView;	
	}
	
	/** INSERT **/
	//입력 폼으로 이동
	@GetMapping("add")
	public ModelAndView setBoardAdd(ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("board/add");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("add")
	public ModelAndView setBoardAdd(BoardDTO boardDTO, ModelAndView modelAndView) throws Exception {
		int result = boardService.setBoardAdd(boardDTO);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 0) {
			message = "등록에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	//입력 폼으로 이동
	//Overloading 하기 위해 매개 변수에 ModelAndView 빠짐
	@GetMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		boardDTO = boardService.getBoardDetail(boardDTO);
		
		modelAndView.setViewName("board/update");
		modelAndView.addObject("DTO", boardDTO);
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO, ModelAndView modelAndView) throws Exception {
		int result = boardService.setBoardUpdate(boardDTO);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./detail?boardNum="+boardDTO.getBoardNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setBoardDelete(BoardDTO boardDTO, ModelAndView modelAndView) throws Exception {
		int result = boardService.setBoardDelete(boardDTO);
		
		String message = "삭제에 실패했습니다.";
		
		if(result > 0) {
			message = "삭제에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}

}
