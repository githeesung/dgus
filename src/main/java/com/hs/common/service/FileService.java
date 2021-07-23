package com.hs.common.service;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hs.common.vo.FileResult;


public class FileService {
	
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);
	
	private void resizeImg(String path, String name, String type) {
		
//		System.out.println("패스: "+path);
//		System.out.println("이름: "+name);
//		System.out.println("확장자: "+type);
		
		
		String imgOriginalPath= path + name;// "C:/dev/temp/test.png";           // 원본 이미지 파일명
        String imgTargetPath= path + name;// "C:/dev/temp/test_resize.png";    // 새 이미지 파일명
        String imgFormat = type;//"png";                             // 새 이미지 포맷. jpg, gif 등
        int newWidth = 1400;                                  // 변경 할 넓이
        int newHeight = 9000;                                 // 변경 할 높이
        String mainPosition = "W";                             // W:넓이중심, H:높이중심, X:설정한 수치로(비율무시)
 
        Image image;
        int imageWidth;
        int imageHeight;
        double ratio;
        int w;
        int h;
 
        try{
            // 원본 이미지 가져오기
            image = ImageIO.read(new File(imgOriginalPath));
 
            // 원본 이미지 사이즈 가져오기
            imageWidth = image.getWidth(null);
            imageHeight = image.getHeight(null);
 
            if(mainPosition.equals("W")){    // 넓이기준
 
                ratio = (double)newWidth/(double)imageWidth;
                w = (int)(imageWidth * ratio);
                h = (int)(imageHeight * ratio);
 
            }else if(mainPosition.equals("H")){ // 높이기준
 
                ratio = (double)newHeight/(double)imageHeight;
                w = (int)(imageWidth * ratio);
                h = (int)(imageHeight * ratio);
 
            }else{ //설정값 (비율무시)
 
                w = newWidth;
                h = newHeight;
            }
 
            // 이미지 리사이즈
            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
            Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);
 
            // 새 이미지  저장하기
            BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
            Graphics g = newImage.getGraphics();
            g.drawImage(resizeImage, 0, 0, null);
            g.dispose();
            ImageIO.write(newImage, imgFormat, new File(imgTargetPath));
 
        }catch (Exception e){
 
            e.printStackTrace();
 
        }
	}
	
	/** 파일로 파일 업로드&덮어쓰기*/
	public boolean copyFile(File resource, File dest) {
		
		try {
			
			FileUtils.copyFile(resource, dest);
			
			return true;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	/** 문자열로 파일(텍스트형식) 업로드&덮어쓰기*/
	public boolean overwriteTxtFile(HttpServletRequest request, String filePath, String fileName, String note){
		
		// 파일을 업로드할 경로
		String uploadPath = request.getSession().getServletContext().getRealPath(filePath);
		File dir = new File(uploadPath);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		
	
		FileOutputStream fileOutputStream = null;
		OutputStreamWriter outputStreamWriter = null;
		BufferedWriter writer = null;
		
		
		// 이미 존재하는 파일일경우 파일을 먼저 선 삭제처리한다.
		File file = new File(uploadPath+fileName);
		if(file.exists()==true){
			logger.debug("파일이 중복입니다. 경로 : " + uploadPath + fileName);
			if(file.delete()){
				logger.debug("파일이 정상적으로 삭제되었습니다. 경로 : " + uploadPath + fileName);
			} 
		}else{
			logger.debug("파일이 중복이 아닙니다. 경로 : " + uploadPath + fileName);
		}
		
		
		try {
			
			fileOutputStream = new FileOutputStream(uploadPath+fileName);
			outputStreamWriter = new OutputStreamWriter(fileOutputStream, "utf-8");
			writer = new BufferedWriter(outputStreamWriter);
			
			writer.write(note);
			writer.flush();
			
		} catch (Exception e) {			
			logger.error(e.getMessage());						
			return false;
		} finally {			
			try {
				if(fileOutputStream!=null)			
					fileOutputStream.close();								
				if(fileOutputStream!=null)
					outputStreamWriter.close();				
				if(writer!=null)
					writer.close();					
			} catch (Exception e2) {}			
		}
		
		
		return true;
	}
	
	
	
	/**
	 * 파일풀패스를 리턴한다.(중복을 방지한다.)
	 * 
	 * @params
	 * 		isAutoName : 파일이름자동생성여부
	 * 		uploadPath : 서버업로드경로
	 * 		originName : 원본파일이름
	 * @returns	
	 * 		[0] : 서버업로드경로
	 * 		[1] : 서버업로드파일이름
	 */
	private String getFileNameForUpload(boolean isAutoName, String uploadPath, String originName, String numb){
		
		String uploadName = "";		// 업로드할 파일이름

		String type = originName.substring(originName.lastIndexOf(".") + 1, originName.length()); // 확장자
		
		
		if(isAutoName)	{
			if(numb!=null) {
				uploadName = "img_" + numb + "_" + UUID.randomUUID() + "." + type;
			}else {
				uploadName = "img_" + UUID.randomUUID() + "." + type;
			}
			
		}else {
			uploadName = originName;
		}
		
		
		// 중복이름방지
		int i = 1;
		String nm = uploadName;
		while (true) {
			if(new File(uploadPath + nm + "." + type).exists()) 
				nm = uploadName + "("+i+")";
			else
				break;				
			i++;
		}
		
		return nm;
		
	}
	

	/**
	 * 파일업로드
	 * 회원들이 업로드하는 파일들의 디렉터리는 /resources/upload/user/ 하위에 배치한다.
	 * 업로가능한확장자목록:jpeg,jpg,png,gif,xls,xlsx,
	 * 만약 중복을 허용하지않고 파일이름을 직접 지정했는데 이미 중복파일명이 있으면 파일명을 자동으로 생성 후 저장한다.
	 * 
	 * @param mRequest       : 파일정보
	 * @param directoryPath  : 업로드할디렉터리경로(예: "/resources/upload/temp/"), null이면 /resources/upload/temp 경로에 저장된다.
	 * @param isFileOverlap  : 파일을 덮어쓰기할지여부
	 */
	public List<String> upload(MultipartHttpServletRequest mRequest, String directoryPath, boolean isFileOverlap, String numb) {
		
		logger.debug("{}{}{}{}{}", new Object[]{"파일업로드시작.. 업로드디렉터리경로:",directoryPath,",파일덮어쓰기여부:",isFileOverlap,",파일이름(직접지정안할시null):"});
		List<String> fileNames = new ArrayList<String>();
		
		List<String> extension = new ArrayList<String>();
		extension.add("jpeg");extension.add("JPEG");
		extension.add("png");extension.add("PNG");
		extension.add("gif");extension.add("GIF"); 
		extension.add("jpg");extension.add("JPG"); 
		extension.add("xls");extension.add("XLS");
		extension.add("xlsx");extension.add("XLSX");
		extension.add("mp4");extension.add("MP4");
		extension.add("avi");extension.add("AVI");
		extension.add("mpeg");extension.add("MPEG");
		extension.add("wmv");extension.add("WMV");
		extension.add("mkv");extension.add("MKV");
		
		String file_type = null;
		
		// 파일을 업로드할 경로
		String uploadPath = mRequest.getSession().getServletContext().getRealPath(directoryPath) + File.separator;
		File dir = new File(uploadPath);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		Iterator<String> iter = mRequest.getFileNames();

		while (iter.hasNext()) {
			
			MultipartFile mFile = mRequest.getFile(iter.next());// 파일정보를 가져옴
			if (mFile.isEmpty()) {logger.info("파일 없음");return null;}// 파일 존재 유뮤 검사
			String originalFileName = mFile.getOriginalFilename();// 최초 클라이언트 파일패스를 가져옴
			
			// 확장자 가져옴
			String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1, originalFileName.length());
			file_type = type;
			
			// 확장자 검사
			boolean isAvaliableExtension = false;
			for (int i = 0; i < extension.size(); i++) {
				if (type.toString().equals(extension.get(i).toString())) {
					isAvaliableExtension = true;
					break;
				}
			}
			if (!isAvaliableExtension) {return null;}
			
			// 덮어쓰기 여부
			String uploadFileName = null;
			if(isFileOverlap){uploadFileName = originalFileName;}
			else{ uploadFileName = getFileNameForUpload(true, uploadPath, originalFileName, numb);}
			
			
			/*
			 * directoryPath  : 실제 업로드시킬 파일디렉터리경로(ex:resources/images/test.png)
			 * uploadPath     : 실제 업로드시킬 파일경로
			 * uploadFileName : 실제 업로드될 파일이름(확장자포함)
			 */
			try{
				mFile.transferTo(new File(uploadPath+uploadFileName));
				logger.info("파일 : " +uploadFileName+" [UPLODED]");
				if(!type.equals("gif")) {
					resizeImg(uploadPath, uploadFileName, file_type);
				}
				
				fileNames.add(directoryPath+uploadFileName);
			
			} catch (IllegalStateException e) {			
				logger.error(e.getMessage());				
				return null;
			} catch (IOException e) {				
				logger.error(e.getMessage());
				return null;
			} 

			
		} // if end
		return fileNames;
	} // fileUpload end
	
	
	
	
}
