package com.hs.app.controller.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hs.common.service.FileService;

@RestController
@RequestMapping(value = "/api/files")
public class FileRestController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired private FileService fileService;

	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public List<String> upload(MultipartHttpServletRequest mRequest, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		response.setHeader("X-Frame-Options", "SAMEORIGIN"); // only same domain 
		System.out.println("Try upload files..."+request.getParameter("numb"));
		
		String numb = null;
		if(request.getParameter("numb")!=null) {
			numb = request.getParameter("numb").toString();
		}
		
		List<String> fileNames = fileService.upload(mRequest, "/resources/img/", false, numb);
		if(fileNames!=null && fileNames.size()>0) {
			return fileNames;
		}
//		if(fileResult.isSuccess()){
//			return (fileResult.getFilePath() + fileResult.getFileName());		
//		}
		return null;
	}

}
