package com.team.cwl.lesson;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		
		return lessonDAO.getLessonList(pagination);
	}

	public LessonDTO getLessonDetail(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.getLessonDetail(lessonDTO);
	}

	/** INSERT **/
	public int setLessonAdd(LessonDTO lessonDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception {
		int result = lessonDAO.setLessonAdd(lessonDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");

		System.out.println(realPath);
		
		for(MultipartFile multipartFile : multipartFiles) {
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
	public int setLessonUpdate(LessonDTO lessonDTO, MultipartFile [] multipartFiles, HttpSession session, Long [] imgNums) throws Exception {
		int result = lessonDAO.setLessonAdd(lessonDTO);
		
		if(imgNums != null) {
			for(Long imgNum : imgNums) {
				lessonDAO.setLessonImgDelete(imgNum);
			}
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");

		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
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
		List<LessonImgDTO> ar = lessonDAO.getLessonImgList(lessonDTO);
		
		int result = lessonDAO.setLessonDelete(lessonDTO);
		
		if(result > 0) {			
			String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");
			
			for(LessonImgDTO lessonImgDTO : ar) {
				boolean check = fileManager.fileDelete(realPath, lessonImgDTO.getImgName());
			}
			
		}
		return lessonDAO.setLessonDelete(lessonDTO);
	}
	
	public int setLessonImgDelete(Long imgNum) throws Exception {
		return lessonDAO.setLessonImgDelete(imgNum);
	}
	
}