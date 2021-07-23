package com.hs.app.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hs.app.board.dao.BoardDao;
import com.hs.app.board.vo.GuestBook;
import com.hs.common.util.PageUtil;

public class BoardService {
    
    private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired private BoardDao boardDao;
	
	
	public Map<String,Object> loadProfileList(int page, int rowBlockCount) {
        
        page = page<1?1:page;
        
        PageUtil pu = new PageUtil(page,boardDao.getProfileSize(),rowBlockCount,10);			
		List<GuestBook> lists = boardDao.getProfileList(pu.getStartRow(), pu.getRowBlockCount());		
		
        Map<String,Object> rst = new HashMap<String,Object>();
		rst.put("pageNav", pu);
		rst.put("list", lists);
        return rst;
    }

	public boolean insertGuestBook(GuestBook guestBook) {
		
		if(guestBook.getNumb()!=null) {
			
			guestBook.setDept(1);
			Integer r = boardDao.insertGuestBook(guestBook);
			if(r!=null && r>0) {
				return true;
			}
		}else {
			
			guestBook.setDept(0);
			Integer r = boardDao.insertGuestBook(guestBook);
			if(r!=null && r>0) {
				
				GuestBook dbInfo = boardDao.getInsertedGuestBookIdx(guestBook);
				if(dbInfo!=null) {
					Integer idx = dbInfo.getIdx();
					dbInfo.setNumb(idx);
					dbInfo.setDept(0);// 깊이(0:일반,1:댓글,2:대댓글)
					r = boardDao.updateGuestBoookNumb(dbInfo);
					if(r!=null && r>0) {
						return true;
					}
				}
				
			}
		}
		
		
		return false;
	}
	public Map<String,Object> loadGuestBookList(int page, int rowBlockCount) {
        
        page = page<1?1:page;
        
        PageUtil pu = new PageUtil(page,boardDao.getGuestBookSize(),rowBlockCount,10);			
		List<GuestBook> lists = boardDao.getGuestBookList(pu.getStartRow(), pu.getRowBlockCount());		
		
        Map<String,Object> rst = new HashMap<String,Object>();
		rst.put("pageNav", pu);
		rst.put("list", lists);
        return rst;
    }
    
	
	
	
	
    
    
}