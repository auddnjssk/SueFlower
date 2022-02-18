package com.suflower.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.suflower.domain.ProductDTO;
import com.suflower.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {
	
	//자동 의존성 주입
	private final ProductService service;

	public ProductController(ProductService service) {
		this.service = service;
	}
	
	@RequestMapping("/productList")
	public ModelAndView productList(Model model, ModelAndView mv) {
		
		log.info("productList Controller method");
		mv.addObject("productList", service.getList());
		mv.setViewName("/product/productList");
		
		return mv;
	}
	
	@RequestMapping("/productRegisterForm")
	public String productRegister() {
		return "product/productRegisterForm";
	}
	
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, ProductDTO product) {
		// ** Uploadfile (Image) 처리
		// => MultipartFile 타입의 uploadfilef 의 정보에서 
		//    upload된 image 와 화일명을 get 처리,
		// => upload된 image 를 서버의 정해진 폴더 (물리적위치)에 저장 하고,  -> file1
		// => 이 위치에 대한 정보를 table에 저장 (vo의 UploadFile 에 set) -> file2
		// ** image 화일명 중복시 : 나중 이미지로 update 됨.  
		
		// ** Image 물리적위치 에 저장
		// 1) 현재 웹어플리케이션의 실행 위치 확인 : 
		// => eslipse 개발환경 (배포전)
		//    D:\MTest\MyWork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring03\
		// => 톰캣서버에 배포 후 : 서버내에서의 위치가 됨
		//    D:\MTest\IDESet\apache-tomcat-9.0.41\webapps\Spring02\
		String realPath = request.getRealPath("/"); // deprecated Method
		System.out.println("** realPath => "+realPath);
		
		// 2) 위 의 값을 이용해서 실제저장위치 확인 
		// => 개발중인지, 배포했는지 에 따라 결정
		if (realPath.contains(".eclipse."))
			 realPath = "/Users/johnlee/Desktop/suflower-project/suflower/src/main/webapp/resources/uploadImage/";
		// realPath = "D:/MTest/MyWork/Spring02/src/main/webapp/resources/"+vo.getId()+"/";
		else realPath += "../resources\\uploadImage\\";
		
		// ** 폴더 만들기 (File 클래스활용)
		// => 위의 저장경로에 폴더가 없는 경우 (uploadImage가 없는경우)  만들어 준다
		File f1 = new File(realPath);
		if ( !f1.exists() ) f1.mkdir();
		// realPath 디렉터리가 존재하는지 검사 (uploadImage 폴더 존재 확인)
		// => 존재하지 않으면 디렉토리 생성
		
		// ** 기본 이미지 지정하기 
		String file1, file2="../resources/uploadImage/tulip.png";
		
		// ** MultipartFile
		// => 업로드한 파일에 대한 모든 정보를 가지고 있으며 이의 처리를 위한 메서드를 제공한다.
		//    -> String getOriginalFilename(), 
		//    -> void transferTo(File destFile),
		//    -> boolean isEmpty()
		
		MultipartFile uploadfilef = product.getUploadfilef();
		if ( uploadfilef !=null && !uploadfilef.isEmpty() ) {
			// Image 를 선택했음 -> Image 처리 (realPath+화일명)
			// 1) 물리적 위치에 Image 저장 
			file1=realPath + uploadfilef.getOriginalFilename(); //  전송된File명 추출 & 연결
			try {
				uploadfilef.transferTo(new File(file1));
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			} // real 위치에 전송된 File 붙여넣기
			// 2) Table 저장위한 경로 
//			file2 = "resources/uploadImage/"+ uploadfilef.getOriginalFilename();
			file2 = uploadfilef.getOriginalFilename();
		}
		
		product.setUploadfile(file2);
		service.register(product);
		
		return "redirect:/product/productList";
	}
	
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request, 
			ModelAndView mv, ProductDTO product, RedirectAttributes rttr) throws IOException {
		String uri = null; 
		// ** Service 
		// => 성공후 
		//		-> 수정된 정보확인 : memberList.jsp (출력가능하도록 요청)
		//		-> name 수정한 경우도 있을수있으므로 session 에 보관중인 loginName도 변경
		// => 실패후 -> 다시 수정하기 : 수정가능한 폼 출력
		
		// ** ImageUpload 추가
		// => Image 수정여부 확인
		// 	  -> 수정하지않은경우 : vo에 전달된 uploadfile 값을 사용 
		// 	  -> 수정시에만 처리
		MultipartFile uploadfilef = product.getUploadfilef();
		String file1, file2;
		if ( uploadfilef != null && !uploadfilef.isEmpty() ) {
			// 1) 저장폴더지정
			String realPath = request.getRealPath("/");
			if (realPath.contains(".eclipse."))
				 realPath = "/Users/johnlee/Desktop/suflower-project/suflower/src/main/webapp/resources/uploadImage/";
			else realPath += "resources\\uploadImage\\"; // 배포환경
			File f1 = new File(realPath);
			if ( !f1.exists() ) f1.mkdir();
			// 2) 전송된 file 처리
			// 2.1) Image 붙여넣기
			file1 = realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			// 2.2) Table 저장위한 값 set
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
			product.setUploadfile(file2);
		}
		if ( service.modify(product)) {
			 // update 성공
			 rttr.addFlashAttribute("message", "제품 등록 완료") ; 
			 // => redirect시 message 전달가능
			 
			 request.getSession().setAttribute("productName", product.getProductName());
			 uri = "redirect:productList";  // redirect 로 처리함 (재요청처리)
		 }else { 
			 // update 실패 : 수정가능한 폼 출력할수있도록 요청 
			 rttr.addFlashAttribute("message", "제품 등록 실패");
			 uri="redirect:/product/productDetail/" + product.getProductId();
		 }
		
		mv.setViewName(uri); 
		return mv;
	} 
	
	@RequestMapping("/delete")
	public String delete(Long productId, HttpServletRequest request, ProductDTO product) {
		
		String filename = service.uploadfile(productId);
		if(filename != null && filename.equals("-")) {	
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/uploadImage/");
			File file = new File(path+filename);
			if(file.exists()) {
				file.delete();
			}	
		}
		service.remove(productId);
	
		return "redirect:/product/productList";
	}
	
	@GetMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam("productId") Long productId, ModelAndView mv) {
		
		log.info("productDetail Controller method");
		mv.addObject("productDetail", service.get(productId));
		
		return mv;
	}
	
	
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}
//	
//	@PostMapping("/register")
//	public String register(ProductDTO product, RedirectAttributes rttr) {
//		log.info("register" + product);
//		
//		service.register(product);
//		
//		rttr.addFlashAttribute("result", product.getProductId());
//		
//		return "redirect:/board/list";
//	}
//	
//	@GetMapping("/get")
//	public void get(@RequestParam("productId") Long productId, Model model) {
//		
//		log.info("/get");
//		model.addAttribute("product", service.get(productId));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(ProductDTO product, RedirectAttributes rttr) {
//		
//		log.info("modify: " + product);
//		
//		if(service.modify(product)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/product/list";
//	}
//	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("productId") Long productId, RedirectAttributes rttr) {
//		
//		log.info("remove = " + productId);
//		
//		if(service.remove(productId)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/product/list";
//	}
	
	
	
	
	
}
