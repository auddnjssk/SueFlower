package com.suflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.suflower.domain.Criteria;
import com.suflower.domain.ReplyDTO;

public interface ReplyMapper {
	
	// 댓글 입력
	public int insert(ReplyDTO dto);

	// 특정한 댓글 읽기
	public ReplyDTO read(Long boardNo);

	//댓글 삭제
	public int delete (Long boardNo);
	
	// 댓글 수정
	public int update(ReplyDTO reply);
	
	// 댓글 목록
	//MyBatis는 두개 이상의 데이터를 파라미터로 전달하기위해서는 
	//1)별도의 객체로 구성
	//2) Map을 이용하는 방식
	//3)@Param을 이용해서 이름을 사용하는방식 
	// 여기선 @Param을 이용함
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("boardNo") Long boardNo); // ReplyMapper에서 getListWithPaging에서 boardNo로 쓰임.

}
