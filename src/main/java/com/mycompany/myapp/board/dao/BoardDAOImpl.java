package com.mycompany.myapp.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.board.vo.ImageVO;
import com.mycompany.myapp.board.vo.ProductVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List SelectAllProductsList() throws DataAccessException {
		return sqlSession.selectList("mapper.board.selectAllProductsList");
	}

	@Override
	public int insertNewProduct(Map<String, Object> productMap) throws DataAccessException {
		int productId = selectNewProductId();
		productMap.put("productId", productId);
		sqlSession.insert("mapper.board.insertNewProduct", productMap);
		return productId;
	}

	@Override
	public ProductVO selectProduct(int productId) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectProduct", productId);
	}

	@Override
	public void updateProduct(Map<String, Object> productMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateProduct", productMap);
	}

	@Override
	public void deleteProduct(int productId) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteProduct", productId);
	}

	@Override
	public List selectImageFileList(int productId) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList");
		return imageFileList;
	}
	
	private int selectNewProductId() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectNewProductId");
	}
	
}
