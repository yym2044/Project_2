package com.yym.infra.common.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.yym.infra.modules.product.Product;

public class UtilUpload {
	
	public static void upload (MultipartFile multipartFile, String className, Product dto) throws Exception {
		
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String nowString = UtilDateTime.nowString();
		String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5, 7) + "/" + nowString.substring(8, 10); 
		String path = "C:/factory/ws_sts_4130/Project_2/src/main/webapp/resources/uploaded/" + pathModule + "/" + pathDate + "/";
		
		createPath(path);
		
		multipartFile.transferTo(new File(path + uuidFileName));
		
		dto.setOriginalName(fileName);
		dto.setUuidName(uuidFileName);
		dto.setExt(ext);
		dto.setSize(multipartFile.getSize());
		dto.setPath("/infra/resources/uploaded/" + pathModule + "/" + pathDate + "/");
	}
	
	public static void createPath(String path) {
		File uploadPath = new File(path);
		
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		} else {
			// by pass
		}
	}
}
