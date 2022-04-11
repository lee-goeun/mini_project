package com.mycompany.myapp.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("ImageVO")
public class ImageVO {
	private int imgId;
	private String imageFileName;
	private int productId;
	private Date regDate;
	
	public ImageVO() {
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
}
