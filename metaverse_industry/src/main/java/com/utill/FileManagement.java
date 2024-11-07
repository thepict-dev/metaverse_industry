package com.utill;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileManagement {
//	private final static String PATH = "/user1/upload_file/metaverse_industry/";
	private final static String PATH = "C:\\Users\\82105\\Desktop\\test\\";
	
	public String upload(MultipartFile file, String sessions) {
		UUID uuid = UUID.randomUUID();
		String uploadPath = createFile(file, sessions, uuid);
		return uuid + uploadPath.split("#####")[1];
	}
	
	public String upload(MultipartFile file, String sessions, String remainFile) {
		if (ObjectUtils.isEmpty(file)) {
			return remainFile;
		} else {
			UUID uuid = UUID.randomUUID();
			String uploadPath = createFile(file, sessions, uuid);
			return uuid + uploadPath.split("#####")[1];
		}
	}
	
	private String createFile(MultipartFile uploadFile, String target, UUID uuid) {
    	String fileName = "";
    	OutputStream out = null;
    	try {
    		fileName = uploadFile.getOriginalFilename();
    		byte[] bytes = uploadFile.getBytes();
    		
    		File file = new File(FileManagement.PATH);
    		if(fileName != null && !fileName.equals("")) {
    			if(file.exists()) {
    				file = new File(FileManagement.PATH +uuid+ fileName);
    			}
    		}
    		out = new FileOutputStream(file);
    		out.write(bytes);
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return FileManagement.PATH + "#####" + fileName;
    }
}
