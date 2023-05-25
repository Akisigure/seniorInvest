package com.invest.admin.notice;

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

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	
	@GetMapping("/admin/notice/write")
	public String writeForm(@AuthenticationPrincipal SecurityUser user, NoticeDto dto,Model m) {
		String userid = user.getUsers().getUserid();
		dto.setUserid(userid);
		m.addAttribute("userid",userid);
		return "notice/write";
	}
	
	@PostMapping("/admin/notice/write")
	public String write(NoticeDto dto) {
		service.insert(dto);
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/notice/list")
	public String list(@RequestParam(name="p",defaultValue = "1")int page, Model m) {
		
		//글이 있는지 확인
		int count = service.count();
		if(count > 0) {
			int perPage = 10;
			int startRow = (page-1)*perPage;//MySQL은 0번부터 뽑아오기에 -1을 함
			
			List<NoticeDto> noticeList = service.NoticeList(startRow);
			
			m.addAttribute("nList",noticeList);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
		
			int begin = (page - 1 ) / pageNum * pageNum + 1 ;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin",begin);
			m.addAttribute("end",end);
			m.addAttribute("pageNum",pageNum);
			m.addAttribute("totalPages",totalPages);
		}
		m.addAttribute("count",count);
		return "notice/list";
	}
	
	
	@GetMapping("admin/notice/update/{noticeNo}")
	public String updateForm(@PathVariable int noticeNo, Model m) {
		NoticeDto dto = service.noticeOne(noticeNo);
		m.addAttribute("dto",dto);
		return "board/updateForm";
	}
	 
	@PutMapping("admin/notice/update")
	public String update(NoticeDto dto) {
		service.updateNotice(dto);
		return"redirect:list";
	}
	
	@GetMapping("admin/notice/delete/{noticeNo}")
	public String delete(@PathVariable int noticeNo) {
		service.deleteNotice(noticeNo);
		return "redirect:/notice/list";
	}
	
	@GetMapping("/notice/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<NoticeDto> noticeList = service.NoticeListSearch(searchn,search,startRow);
		m.addAttribute("nList", noticeList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "notice/search";
	}
	
	@GetMapping("notice/content/{noticeNo}")
	public String content(@PathVariable int noticeNo, Model m,@AuthenticationPrincipal SecurityUser user) {
		NoticeDto dto = service.noticeOne(noticeNo);
		String userid = user.getUsers().getUserid();
		m.addAttribute("dto", dto);
		m.addAttribute("userid",userid);
		return "notice/content";
	}
  
}
