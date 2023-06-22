package com.invest.disclosure;

import java.util.ArrayList;
import lombok.Data;

@Data
public class DisclosureCommand {
	
	ArrayList<DisclosureList> list = new ArrayList<>();
	
}
