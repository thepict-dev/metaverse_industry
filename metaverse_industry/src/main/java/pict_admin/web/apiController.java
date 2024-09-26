package pict_admin.web;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class apiController {
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	

	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }

	
	/*
	 * //qr코드
	 * 
	 * @PostMapping("api/qrcode.do") public void barcode(@RequestParam("id") String
	 * id) throws Exception{ System.out.println("카카카카카"); String ccc = "1"; String
	 * c_id = encryptPassword("pict", ccc); String data =
	 * "http://192.168.1.22:8080/apicoupon.do?id=" + c_id; String path =
	 * "C:\\Users\\82105\\Desktop\\bc.png";
	 * 
	 * String charset = "UTF-8";
	 * 
	 * Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new
	 * HashMap<EncodeHintType,ErrorCorrectionLevel>();
	 * 
	 * hashMap.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.L);
	 * 
	 * createQR(data, path, charset, hashMap, 200, 200);
	 * System.out.println("QR Code Generated!!! "); }
	 * 
	 * @RequestMapping(value = "/apicoupon.do") public void
	 * zzzzz(@RequestParam("id") String id) throws Exception {
	 * System.out.println("드오나!"); }
	 * 
	 * public static void createQR(String data, String path, String charset, Map
	 * hashMap, int height, int width) throws WriterException, IOException{
	 * BitMatrix matrix = new MultiFormatWriter().encode(new
	 * String(data.getBytes(charset), charset), BarcodeFormat.QR_CODE, width,
	 * height); MatrixToImageWriter.writeToFile(matrix,
	 * path.substring(path.lastIndexOf('.') + 1), new File(path)); }
	 */
}