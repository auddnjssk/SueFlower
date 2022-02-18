package com.suflower.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.suflower.domain.BoardDTO;
import com.suflower.domain.Criteria;
import com.suflower.domain.MemberDTO;
import com.suflower.domain.PageMakerDTO;
import com.suflower.domain.ReplyDTO;
import com.suflower.service.BoardService;
import com.suflower.service.MemberService;
import com.suflower.service.ReplyService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/board/*")
// Board Controller는 BoardService에 의존적이므로 
// @AllArgsConstructor를 이용해서 생성자를 만들고 자동으로 주입하게 해줌
@AllArgsConstructor
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	BoardService bservice;

	MemberService mservice;
	
	ReplyService rservice;

	// 게시글 페이징 조회
	@GetMapping("/blist")
	public void boardListGET(Model model, Criteria cri,MemberDTO memberdto) {
		log.info("boardListGET");
		model.addAttribute("blist", bservice.getListPaging(cri));
		int total = bservice.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	
	// 게시글 조회
	@GetMapping("/get")
	public void boardGetPageGET(long boardNo, Model model, Criteria cri,ReplyDTO replydto) {
		System.out.println("게시글 진입");
		model.addAttribute("pageInfo", bservice.getPage(boardNo));
		model.addAttribute("cri", cri);
		model.addAttribute("reply",replydto);
	}

	// 게시글 삭제
	@PostMapping("/delete")
	public String boardDeletePost(long boardNo, RedirectAttributes rttr) {
		bservice.delete(boardNo);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/blist";
	}

	// 수정 페이지로 이동
	@GetMapping("/modify")
	public void boardModifyGET(long boardNo, Model model, Criteria cri) {
		model.addAttribute("pageInfo", bservice.getPage(boardNo));
		model.addAttribute("cri", cri);
	}

	// 페이지 수정완료
	@PostMapping("/modify")
	public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr) {
		bservice.modify(board);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/blist";
	}
	
	// 게시판 작성폼 (bwrite)
	@GetMapping("/bwrite")
	public void boardbwriteGet() {
		log.info("게시판 작성 페이지 진입!");
	}

	// 게시판 작성
	@PostMapping("/bwrite")
	public String boardwritePost(BoardDTO boarddto, RedirectAttributes rttr, Model model,MemberDTO memberdto) {
		System.out.println(mservice);
		// BoardService에서 게시판 등록을 수행하는 bwrite를 불러옴.
		bservice.bwrite(boarddto);
		// 작성 완료시 알림창이 뜨게해줌.
		rttr.addFlashAttribute("result", "bwrite success");
		// 끝나고나면 다시 목록페이지로 돌아가게 해줌
		return "redirect:/board/blist";
	}
}
	

/*
 * // 게시판 리스트 조회 (blist)
 * 
 * @GetMapping("/blist") public void boardListGet(Model model) {
 * log.info("게시판 목록 페이지 진입!"); model.addAttribute("blist", bservice.getList());
 * }
 */
