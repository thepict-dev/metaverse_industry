package pict_admin.web.bookingMail;

import java.util.List;

import com.utill.html.HtmlStructure;

public class BookingMailHtml {
	public StringBuffer structure(StringBuffer sb, List<BookingMailDto> list) {

		sb.append(HtmlStructure.divOpen("max-width: 1280px; width: 100%;"));
		sb.append(HtmlStructure.h1("font-size: 26px; text-align: center;", "장비 예약 안내 메일"));
		sb.append(HtmlStructure.divOpen("infoTable", "", "width: 100%;"));
		
		sb.append(HtmlStructure.tableOpen("width: 100%; border-collapse: collapse;"));
		
		sb.append(HtmlStructure.colgroup("20", "20", "30", "10", "20"));
		
		sb.append(HtmlStructure.theadOpen());
		sb.append(HtmlStructure.trOpen());
		sb.append(HtmlStructure.th("vertical-align: middle; background-color: #171c61; text-align: center; padding: 16px 0; color: #fff; font-size: 16px; font-weight: 500; line-height: 100%; letter-spacing: -1px;"
				, "예약장비명", "예약일시", "예약기간", "예약자", "전화번호"));
		sb.append(HtmlStructure.trClose());
		sb.append(HtmlStructure.theadClose());
		
		sb.append(HtmlStructure.tbodyOpen());
		
		for(BookingMailDto dto : list) {
			sb.append(HtmlStructure.trOpen());
			sb.append(HtmlStructure.td(
					"padding: 16px 0; text-align: center; font-size: 16px; font-weight: 500; line-height: 140%; letter-spacing: -1px; background-color: #fff; vertical-align: middle; border-bottom: 1px solid #dbdee2;"
					, dto.getName(), dto.getTheDate(), dto.getRentalDate(), dto.getUser(), dto.getMobile()
			));
			sb.append(HtmlStructure.trClose());
		}
		
		sb.append(HtmlStructure.tbodyClose());
		
		sb.append(HtmlStructure.tableClose());
		sb.append(HtmlStructure.divClose());

		sb.append(HtmlStructure.h1("font-size: 16px;", "고객센터 : 담당자 이승준 (033-245-6313)"));
		sb.append(HtmlStructure.divClose());
		return sb;
	}

}
