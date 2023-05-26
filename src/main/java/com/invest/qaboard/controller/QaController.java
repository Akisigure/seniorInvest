package com.invest.qaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.invest.config.SecurityUser;
import com.invest.qaboard.dto.CommDto;
import com.invest.qaboard.dto.QaDto;
import com.invest.qaboard.service.CommService;
import com.invest.qaboard.service.QaService;
import com.invest.user.dto.Users;




@Controller
public class QaController {

	

	@Autowired
	QaService service;

	@Autowired
	CommService c_service;

	/* user 기능 */
	//등록하기 버튼 클릭
	@GetMapping("/qa/qaRegister")
	public String registerForm(@ModelAttribute("dto") QaDto dto) {
		return "qa/QAForm";
	}
	
	//qa 글 등록
	@PostMapping("/qa/qaRegister")
	public String register(@AuthenticationPrincipal SecurityUser user, QaDto dto) {
		//dto에 userId 추가
		dto.setId(user.getUsers().getUserid());
		service.insert(dto);
		return "redirect:qaList";
	}

	//qa 글 목록
	@GetMapping("/qa/qaList")
	public String getQAList(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = service.count();
		
		//paging
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<QaDto> boardList = service.selectList(startRow);
			m.addAttribute("start", startRow+1);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);

		return "qa/QAList";
	}
	
	//qa게시글 상세보기
	@GetMapping("/qa/qaDetail/{no}")
	public String qaListView(@AuthenticationPrincipal SecurityUser user, @PathVariable int no, Model m) {
		QaDto dto = service.selectOne(no);
		m.addAttribute("dto", dto);
		m.addAttribute("user", user);
		List<CommDto> cList = c_service.selectComm(no);
		m.addAttribute("cList", cList);
		
		return "qa/QADetail";
	}
	
	//updateForm
	@GetMapping("/qa/qaForm/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		QaDto dto = service.selectOne(no);
		m.addAttribute("dto", dto);
		return "qa/QAUpdate";
	}

	//update
	@PutMapping("/qa/qaForm/{no}")
	public String update(QaDto dto) { 
		service.updateBoard(dto);
		return "redirect:/qa/qaList";
	}
	
	//delete
	@GetMapping("/qa/qaDelete")
	//@ResponseBody //이건 ajax요청일때만
	public String delete(int no) {
		service.deleteBoard(no);
		return "redirect:/qa/qaList";// 컨트롤러 mapping에 맞춰서
	}

	/* admin기능 */
	
	//qaList 전체 출력
	@GetMapping("/admin/qaList")
	public String qaListSearch(String search,@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countCategorySearch(search);
		
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<QaDto> qaList = service.qaListSearch(search, startRow);
			m.addAttribute("start", startRow+1);
			m.addAttribute("qList", qaList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);
		
		return "admin/QAList";
	}
	
	
	//admin 페이지에서 등록하기 버튼 클릭
	@GetMapping("/qa/qaReRegister/{no}")
	public String reRegisterForm(@PathVariable int no, Model m) {
		System.out.println(no);
		QaDto dto = service.selectOne(no);
		//dto에 re_step = 1 로 표시해서 답변 단 글임을 알려줌
		dto.setRe_step(1);
		//re_step update한 것을 db에 저장해서 더이상 리스트에 뜨지 않도록
		service.updateBoard(dto);
		m.addAttribute("dto", dto);
		return "admin/QAreForm";
	}
	
	//qa 글 등록
	@PostMapping("/qa/qaReRegister")
	public String reRegister( @AuthenticationPrincipal SecurityUser user, QaDto dto) {
		//dto에 userId 추가
		dto.setId(user.getUsers().getUserid());
		service.insert(dto);
		return "redirect:/admin/qaList";
	}
	
}


