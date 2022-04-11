package com.mycompany.myapp.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String PRODUCT_IMAGE_REPO = "C:\\spring\\board\\product_image";
	
	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("productId") String productId,
				HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = PRODUCT_IMAGE_REPO + "\\" + productId + "\\" + imageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control",	"no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}