package com.suflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suflower.domain.Criteria;
import com.suflower.domain.ReplyDTO;
import com.suflower.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ =@Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO dto) {
		log.info("regiset = "+dto);
		return mapper.insert(dto);
	}

	@Override
	public int modify(ReplyDTO dto) {
		log.info("modify = "+dto);
		return mapper.update(dto);
	}
	
	@Override
		public ReplyDTO get(Long replyNo) {
		log.info("get = "+replyNo);
			return mapper.read(replyNo);
	}
	
	@Override
	public List<ReplyDTO> getList(Criteria cri, Long boardNo) {
		log.info("getList = "+boardNo);
		return mapper.getListWithPaging(cri, boardNo);
	}

	
	@Override
	public int remove(Long replyNo) {
		log.info("remove = "+replyNo);
		return mapper.delete(replyNo);
	}
}