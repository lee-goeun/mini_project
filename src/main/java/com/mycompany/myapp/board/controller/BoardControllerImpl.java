package com.mycompany.myapp.board.controller;

import java.io.File;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.board.service.BoardService;
import com.mycompany.myapp.board.vo.ProductVO;
import com.mycompany.myapp.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	private static final String PRODUCT_IMAGE_REPO = "C:\\spring\\board\\product_image";
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ProductVO productVO;
	
	public BoardControllerImpl() {
	}
	
	
	@Override
	@RequestMapping(value="/home.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//세션값 확인
		HttpSession session = request.getSession();
		if(session.isNew()) {
			mav.setViewName("redirect:/index.do");
		}
		
		List<ProductVO> productsList = boardService.listProducts();
		mav.addObject("productsList", productsList);
		System.out.println("************* " +mav);
		return mav;
	}

	@Override
	@RequestMapping(value="/board/productForm.do", method=RequestMethod.GET)
	public String addFormProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println("view" + viewName);
		return viewName;
	}

	@Override
	@RequestMapping(value="/board/addNewProduct.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		System.out.println("==================="+ imageFileName);
		productMap.put("id", id);
		productMap.put("imageFileName", imageFileName);
		
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int productId = boardService.addNewProduct(productMap);
			if(imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(PRODUCT_IMAGE_REPO + "\\" + productId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			
			msg = "<script>";
			msg += "alert('새 글을 추가했습니다');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/home.do';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			
			msg = "<script>";
			msg += "alert('오류가 발생했습니다. 다시 시도해 주세요');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/board/productForm.do'";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/board/viewProduct.do", method=RequestMethod.GET)
	public ModelAndView viewProduct(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		productVO = boardService.viewProduct(productId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("product", productVO);
		return mav;
	}

	@Override
	@RequestMapping(value="/board/modProduct.do", method=RequestMethod.POST)
	public ResponseEntity modProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getAttributeNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			productMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
		productMap.put("imageFileName", imageFileName);
		
		String productId = (String)productMap.get("productId");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modProduct(productMap);
			if(imageFileName != null && imageFileName.length() !=0) {
				File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(PRODUCT_IMAGE_REPO + "\\" + productId);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String)productMap.get("originalFileName");
				File oldFile = new File(PRODUCT_IMAGE_REPO + "\\" + productId + "\\" + originalFileName);
				oldFile.delete();
			}
			msg = "<script>";
			msg += "alert('글을 수정하였습니다');";
			msg += "location.href='" + multipartRequest.getContextPath() +"/board/viewProduct.do?productId=" + productId +"';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			msg = "<script>";
			msg += "alert('오류가 발생했습니다. 다시 수정해주세요');";
			msg += "location.href='" + multipartRequest.getContextPath() +"/board/viewProduct.do?productId=" + productId+ "';";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/board/removeProduct.do")
	public ResponseEntity removeProduct(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartReqeust) throws Exception{
		String imageFileName = null;
		Iterator<String> fileNames = multipartReqeust.getFileNames(); 
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartReqeust.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			System.out.println("---------------------------" + imageFileName);
			File file = new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					file.getParentFile().mkdir();
					mFile.transferTo(new File(PRODUCT_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
				}
			}
		}
		return imageFileName;
	}

}
