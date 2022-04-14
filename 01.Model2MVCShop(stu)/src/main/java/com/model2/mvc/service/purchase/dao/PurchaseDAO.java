package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.product.vo.ProductVO;
import com.model2.mvc.service.purchase.vo.PurchaseVO;
import com.model2.mvc.service.user.vo.UserVO;

public class PurchaseDAO {
	public PurchaseDAO(){
	}
	
	PurchaseVO purchaseVO =new PurchaseVO(); 
	
	//ProductVO purchaseProd = purchaseVO.getPurchaseProd();
	//UserVO buyer = purchaseVO.getBuyer();

	public void insertPurchase(PurchaseVO purchaseVO) throws Exception {
		
		Connection con = DBUtil.getConnection();

		String sql = "INSERT INTO transaction VALUES (seq_transaction_tran_no.nextval,?,?,?,?,?,?,?,?,sysdate,?)"; // tranCode 다시
		
		PreparedStatement stmt = con.prepareStatement(sql);
		System.out.println("purchaseVO.getPurchaseProd().getProdNo() = " +purchaseVO.getPurchaseProd().getProdNo());
		stmt.setInt(1, purchaseVO.getPurchaseProd().getProdNo());
		stmt.setString(2, purchaseVO.getBuyer().getUserId());
		stmt.setString(3, purchaseVO.getPaymentOption());
		stmt.setString(4, purchaseVO.getReceiverName());
		stmt.setString(5, purchaseVO.getReceiverPhone());
		stmt.setString(6, purchaseVO.getDivyAddr());
		stmt.setString(7, purchaseVO.getDivyRequest());
		stmt.setString(8, purchaseVO.getTranCode());
		stmt.setString(9, purchaseVO.getDivyDate().replace("-", ""));
		stmt.executeUpdate();
		
		con.close();
		
	}
	
	public PurchaseVO findPurchase(int tranNo) throws Exception {
		
		Connection con = DBUtil.getConnection();

		String sql = "SELECT * FROM transaction WHERE tran_no =?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, tranNo);

		ResultSet rs = stmt.executeQuery();

		PurchaseVO purchaseVO = new PurchaseVO();
		while (rs.next()) {
			
			purchaseVO.setTranNo(rs.getInt("tran_no"));
			//purchaseVO.getPurchaseProd().setProdNo(rs.getInt("prod_no")); //purchaseVO.setPurchaseProd(ProductVO 들어가야 한다.) => 
			//purchaseVO.getBuyer().setUserId(rs.getString("buyer_id"));
			purchaseVO.setPaymentOption(rs.getString("payment_option"));
			purchaseVO.setReceiverName(rs.getString("receiver_name"));
			purchaseVO.setReceiverPhone(rs.getString("receiver_phone"));
			purchaseVO.setDivyAddr(rs.getString("divy_addr"));
			purchaseVO.setDivyRequest(rs.getString("dlvy_request"));
			purchaseVO.setTranCode(rs.getString("tran_status_code"));
			purchaseVO.setOrderDate(rs.getDate("order_date"));
			purchaseVO.setDivyDate(rs.getString("dlvy_date"));
		}
		
		con.close();
		return purchaseVO;
	}
	
	public HashMap<String,Object> getPurchaseList(SearchVO searchVO, String buyerId) throws Exception {
		
			// buyerId = userId일 때만 리스트를 보여준다.
			
			Connection con = DBUtil.getConnection();
			
			String sql = "SELECT * FROM transaction WHERE buyer_id=?";
			sql += "ORDER BY tran_no";
	
			PreparedStatement stmt = 
				con.prepareStatement(	sql,
															ResultSet.TYPE_SCROLL_INSENSITIVE,
			 									ResultSet.CONCUR_UPDATABLE);
			
			stmt.setString(1, buyerId);
			System.out.println("구매목록을 열어본 사용자 아이디는? "+buyerId);
			
			ResultSet rs = stmt.executeQuery();
	
			rs.last();
			int total = rs.getRow();
			System.out.println("로우의 수:" + total);
	
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("count", new Integer(total));
	
			rs.absolute(searchVO.getPage() * searchVO.getPageUnit() - searchVO.getPageUnit()+1);
			System.out.println("searchVO.getPage():" + searchVO.getPage());
			System.out.println("searchVO.getPageUnit():" + searchVO.getPageUnit());
	
			ArrayList<PurchaseVO> list = new ArrayList<PurchaseVO>();
			
			if (total > 0) {
				for (int i = 0; i < searchVO.getPageUnit(); i++) {
					
					ProductVO productVO = new ProductVO();
					
					PurchaseVO purchaseVO = new PurchaseVO();
					purchaseVO.setTranNo(rs.getInt("tran_no"));
					
					productVO.setProdNo(rs.getInt("prod_no"));
					purchaseVO.setPurchaseProd(productVO);
					
					UserVO userVO = new UserVO();

					userVO.setUserId(rs.getString("buyer_id"));
					purchaseVO.setBuyer(userVO);
					
					purchaseVO.setPaymentOption(rs.getString("payment_option"));
					purchaseVO.setReceiverName(rs.getString("receiver_name"));
					purchaseVO.setReceiverPhone(rs.getString("receiver_phone"));
					purchaseVO.setDivyAddr(rs.getString("divy_addr"));
					purchaseVO.setDivyRequest(rs.getString("dlvy_request"));
					purchaseVO.setTranCode(rs.getString("tran_status_code"));
					purchaseVO.setOrderDate(rs.getDate("order_date"));
					purchaseVO.setDivyDate(rs.getString("dlvy_date"));
	
					list.add(purchaseVO);
					if (!rs.next())
						break;
				}
			}
			System.out.println("list.size() : "+ list.size());
			map.put("list", list);
			System.out.println("map().size() : "+ map.size());
	
			con.close();
				
			return map;
		}
	
	
	public void updateTranCode(PurchaseVO purchaseVO) throws Exception {
		Connection con = DBUtil.getConnection();

		String sql = "UPDATE transaction SET tran_status_code = ? where tran_no=?";
		
		System.out.println("purchasDAO에서 받은 tranCode = " +purchaseVO.getTranCode());
		System.out.println("purchasDAO에서 받은 TranNo = " +purchaseVO.getTranNo());
		
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, purchaseVO.getTranCode());
		stmt.setInt(2, purchaseVO.getTranNo());
		
		int a = stmt.executeUpdate();
		
		if(a==1) {
			System.out.println("tranCode 업데이트 성공");
		}else {
			System.out.println("tranCode 업데이트 실패");
		}
		con.close();
		
	}


}
	

