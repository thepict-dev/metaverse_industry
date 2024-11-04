package com.utill.html;

public class HtmlStructure {
	public static final String divOpen(String className, String idName, String style) {
		return "<div class='" + className + " id='" + idName + " style='" + style + "'>";
	}

	public static final String divClose() {
		return "</div>";
	}

	public static final String tableOpen(String style) {
		return "<table style='" + style + "'>";
	}

	public static final String tableClose() {
		return "</table>";
	}

	public static final String colgroup(String... args) {
		StringBuffer sb = new StringBuffer();
		sb.append("<colgroup>");
		
		for(String arg : args) {
			sb.append("<col width='" + arg + "%' />");
		}
		
		sb.append("</colgroup>");
		
		return sb.toString();
	}
	
	public static final String theadOpen() {
		return "<thead>";
	}
	
	public static final String theadClose() {
		return "</thead>";
	}

	public static final String tbodyOpen() {
		return "<tbody>";
	}

	public static final String tbodyClose() {
		return "</tbody>";
	}

	public static final String trOpen() {
		return "<tr>";
	}

	public static final String trClose() {
		return "</tr>";
	}

	public static final String th(String style, String... args) {
		StringBuffer sb = new StringBuffer();
		
		for(String arg : args) {
			sb.append("<th" + " style='" + style + "'>" + arg + "</th>");
		}
		
		return sb.toString();
	}

	public static final String td(String style, String... args) {
		StringBuffer sb = new StringBuffer();
		
		for(String arg : args) {
			sb.append("<td" + " style='" + style + "'>" + arg + "</td>");
		}
		
		return sb.toString();
	}
}
