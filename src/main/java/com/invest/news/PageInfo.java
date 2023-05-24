package com.invest.news;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageInfo<T> {
    private List<T> content;
    private int pageNumber;
    private int pageSize;
    private long totalElements;
	public List<T> getContent() {
		return content;
	}

}
