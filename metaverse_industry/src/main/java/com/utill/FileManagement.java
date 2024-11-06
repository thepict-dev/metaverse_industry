package com.utill;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileManagement {
//	private final static String path = "/user1/upload_file/metaverse_industry/";
	private final static String PATH = "C:\\Users\\82105\\Desktop\\test\\";
	
	public static String upload(MultipartFile file, String sessions) {
		if (file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = upload_file(file, sessions, uuid);
			return uuid + uploadPath.split("#####")[1];
		} else {
			return "";
		}
	}
	
	private static String upload_file(MultipartFile uploadFile, String target, UUID uuid) {
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
