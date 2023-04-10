package com.team.cwl.lesson;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.cwl.product.ProductDTO;
import com.team.cwl.util.FileManager;
import com.team.cwl.util.Pagination;

@Service
public class LessonService {

	@Autowired
	private LessonDAO lessonDAO;
	
	@Autowired
	private FileManager fileManager;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<LessonDTO> getLessonList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(lessonDAO.getTotalCount(pagination));
		
		List<LessonDTO> ar = lessonDAO.getLessonList(pagination);
		ArrayList<LessonDTO> ar2 = new ArrayList<LessonDTO>();
		
		for(LessonDTO lessonDTO: ar) {
			lessonDTO = lessonDAO.getLessonDetail(lessonDTO);
			ar2.add(lessonDTO);
		}
		
		if(lessonDAO.getTotalCount(pagination) == 0) {
			pagination.setLastNum(1L);
		}
		
		return ar2;
	}

	public LessonDTO getLessonDetail(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.getLessonDetail(lessonDTO);
	}

	/** INSERT **/
	public int setLessonAdd(LessonDTO lessonDTO, MultipartFile multipartFile, HttpSession session) throws Exception {
		int result = lessonDAO.setLessonAdd(lessonDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");

		System.out.println(realPath);
		
		if(!multipartFile.isEmpty()) {
			
			String imgName = fileManager.fileSave(multipartFile, realPath);

			LessonImgDTO lessonImgDTO = new LessonImgDTO();
			lessonImgDTO.setLessonNum(lessonDTO.getLessonNum());
			lessonImgDTO.setImgName(imgName);
			lessonImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = lessonDAO.setLessonImgAdd(lessonImgDTO);	
		}
		return result;
	}

	/** UPDATE **/
	public int setLessonUpdate(LessonDTO lessonDTO, MultipartFile multipartFile, HttpSession session, Long imgNum) throws Exception {
		int result = lessonDAO.setLessonUpdate(lessonDTO);
		
		if(imgNum != null) {
			lessonDAO.setLessonImgDelete(imgNum);
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");
		
		if(!multipartFile.isEmpty()) {
			
			String imgName = fileManager.fileSave(multipartFile, realPath);

			LessonImgDTO lessonImgDTO = new LessonImgDTO();
			lessonImgDTO.setLessonNum(lessonDTO.getLessonNum());
			lessonImgDTO.setImgName(imgName);
			lessonImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = lessonDAO.setLessonImgAdd(lessonImgDTO);	
		}
		
		return result;
	}
	
	public int setLessonHitUpdate(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.setLessonHitUpdate(lessonDTO);
	}

	/** DELETE **/
	public int setLessonDelete(LessonDTO lessonDTO, HttpSession session) throws Exception {
		return lessonDAO.setLessonDelete(lessonDTO);
	}
	
}