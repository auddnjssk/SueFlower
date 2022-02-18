package com.suflower.service;

import java.util.List;

import com.suflower.domain.Criteria;
import com.suflower.domain.ReplyDTO;

public interface ReplyService {
	
	public int register(ReplyDTO dto);
	
	public ReplyDTO get(Long replyNo);
	
	public int modify(ReplyDTO dto);
	
	public int remove(Long replyNo);
	
	public List<ReplyDTO> getList(Criteria cri,Long boardNo);
	

}
