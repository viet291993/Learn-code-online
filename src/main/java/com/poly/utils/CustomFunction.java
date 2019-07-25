
package com.poly.utils;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class CustomFunction {

	public static int getIntegerRandom() {
		try {
			Random r = new Random();
			return r.nextInt();
		} catch (Exception e) {
			return 0;
		}
	}

	public static String getBundle(String localeCode, String key) {
		try {
			Locale locale = localeCode == null ? new Locale("en") : new Locale(localeCode);
			ResourceBundle bundles = ResourceBundle.getBundle("com/bundle/Resources", locale);
			return bundles.getString(key);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String randomKey() {
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);
		String text = new String(bytes);
		return md5(text);
	}

	public static String passwordEncryption(String strToEncrypt, String salt) {
		try {
			byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
			IvParameterSpec ivspec = new IvParameterSpec(iv);

			SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
			KeySpec spec = new PBEKeySpec(StaticEnum.SECRETKEY.toCharArray(), salt.getBytes(), 65536, 256);
			SecretKey tmp = factory.generateSecret(spec);
			SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
			return md5(Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8"))));
		} catch (Exception e) {
			System.out.println("Error while encrypting: " + e.toString());
		}
		return null;
	}

	public static String md5(String input) {
		MessageDigest md;
		StringBuffer sB;
		String output = null;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
			byte[] digest = md.digest();
			sB = new StringBuffer();
			for (byte b : digest) {
				sB.append(String.format("%02x", b & 0xff));
			}
			output = sB.toString();
		} catch (NoSuchAlgorithmException ex) {
			Logger.getLogger(CustomFunction.class.getName()).log(Level.SEVERE, null, ex);
		}
		return output;
	}

	/*
	 * public static List<AdminModuleInRole>
	 * filterAdminModuleInRoleList(List<AdminModuleInRole> AdminModuleInRoles,
	 * Integer parentId) { return AdminModuleInRoles.stream().filter(m -> { return
	 * m.getAdminModuleId().getParentId().getId() == parentId;
	 * }).collect(Collectors.toList()); }
	 * 
	 * public static Admin findAdminById(Integer id) { return new
	 * AdminFacade().findAdminById(id); }
	 * 
	 * public static int size(Collection c) { return c == null ? 0 : c.size(); }
	 * 
	 * public static String buildPager(Pager pager) { String url = "?currentPage=" +
	 * pager.getCurrentPage() + "&displayPerPage=" + pager.getDisplayPerPage() +
	 * "&orderColumn=" + pager.getOrderColumn() + "&asc=" + pager.getAsc() +
	 * "&keyword=" + pager.getKeyword(); return url; }
	 * 
	 * public static List findAllAvailableAdminRole() { return new
	 * AdminRoleFacade().findAll(); }
	 * 
	 * public static boolean checkAdminModuleInRole(List<AdminModuleInRole>
	 * AdminModuleInRoles, int moduleId) { return
	 * AdminModuleInRoles.stream().filter(m -> { return
	 * Objects.equals(m.getAdminModuleId().getId(), moduleId);
	 * }).collect(Collectors.toList()).size() > 0; }
	 * 
	 * private static boolean checkModuleHaveChildren(List<WebsiteModule>
	 * websiteModules, Integer parentId) { List<WebsiteModule> filterItems = null;
	 * try { filterItems = websiteModules.stream().filter(m -> { if (parentId ==
	 * null) { return m.getParentId() == null; } else { return m.getParentId() !=
	 * null && Objects.equals(m.getParentId().getId(), parentId); }
	 * }).collect(Collectors.toList()); } catch (Exception e) { e.printStackTrace();
	 * } return filterItems != null && filterItems.size() > 0; }
	 * 
	 * public static String buildWebsiteModules(List<WebsiteModule> websiteModules,
	 * Integer parentId) { final StringBuilder sb = new StringBuilder();
	 * List<WebsiteModule> filterItems = websiteModules.stream().filter(m -> { if
	 * (parentId == null) { return m.getParentId() == null; } else { return
	 * m.getParentId() != null && Objects.equals(m.getParentId().getId(), parentId);
	 * } }).collect(Collectors.toList()); if (size(filterItems) > 0) {
	 * filterItems.forEach((WebsiteModule item) -> { sb.append("<li>");
	 * sb.append("<label><span class='module-collapse'>"); if
	 * (checkModuleHaveChildren(websiteModules, item.getId())) {
	 * sb.append("<i class='far fa-minus-square'></i>"); }
	 * sb.append("</span><span style='" + (item.getIsShow() ? "" :
	 * "color:#999;text-decoration:line-through") + "'>");
	 * sb.append(item.getName()); sb.append("</span><ul class='module-action'>");
	 * sb.append(
	 * "<li><a class='btn-open-modal text-success' data-controller='/CellxAdmin/Content/ListModule/ViewInsert/"
	 * )
	 * .append(item.getId()).append("'><i class='fa fa-plus-circle'></i></a></li>");
	 * sb.append(
	 * "<li><a class='btn-open-modal text-primary' data-controller='/CellxAdmin/Content/ListModule/ViewEdit/"
	 * ) .append(item.getId()).append("'><i class='fa fa-edit'></i></a></li>");
	 * sb.append(
	 * "<li><a class='text-warning btn-send-ajax' data-controller='/CellxAdmin/Content/ListModule/ChangeStatus/"
	 * ) .append(item.getId()) .append("'><i class='fa " + (item.getIsShow() ?
	 * "fa-eye" : "fa-eye-slash") + "'></i></a></li>"); sb.append(
	 * "<li><a class='text-danger btn-send-ajax' data-controller='/CellxAdmin/Content/ListModule/Delete/"
	 * ) .append(item.getId()).append("'><i class='fas fa-trash'></i></a></li>");
	 * sb.append("</ul></label>"); if (checkModuleHaveChildren(websiteModules,
	 * item.getId())) { sb.append("<ul>");
	 * sb.append(buildWebsiteModules(websiteModules, item.getId()));
	 * sb.append("</ul>"); } sb.append("</li>"); }); } return sb.toString(); }
	 * 
	 * public static String buildListContentSidebar(List<WebsiteModule>
	 * websiteModules, Integer parentId, Integer selectedModuleId) { final
	 * StringBuilder sb = new StringBuilder(); List<WebsiteModule> filterItems =
	 * websiteModules.stream().filter(m -> { if (parentId == null) { return
	 * m.getParentId() == null; } else { return m.getParentId() != null &&
	 * Objects.equals(m.getParentId().getId(), parentId); }
	 * }).collect(Collectors.toList()); if (size(filterItems) > 0) {
	 * filterItems.forEach((WebsiteModule item) -> { sb.append("<li>");
	 * sb.append("<a href='/CellxAdmin/Content/ListContent?moduleId=").append(item.
	 * getId()) .append("'><span class='module-collapse'>"); if
	 * (checkModuleHaveChildren(websiteModules, item.getId())) {
	 * sb.append("<i class='far fa-minus-square'></i>"); } sb.append("</span>"); if
	 * (selectedModuleId != null && item.getId() == selectedModuleId) {
	 * sb.append("<b>"); sb.append(item.getName()); sb.append("</b>"); } else {
	 * sb.append("<span>"); sb.append(item.getName()); sb.append("</span>"); }
	 * sb.append("</a>"); if (checkModuleHaveChildren(websiteModules, item.getId()))
	 * { sb.append("<ul>"); sb.append(buildListContentSidebar(websiteModules,
	 * item.getId(), selectedModuleId)); sb.append("</ul>"); } sb.append("</li>");
	 * }); } return sb.toString(); }
	 * 
	 * public static String buildSelectWebsiteModules(List<WebsiteModule>
	 * websiteModules, Integer parentId, Integer selectedId, String prefix) { final
	 * StringBuilder sb = new StringBuilder(); List<WebsiteModule> filterItems =
	 * websiteModules.stream().filter(m -> { if (parentId == null) { return
	 * m.getParentId() == null; } else { return m.getParentId() != null &&
	 * Objects.equals(m.getParentId().getId(), parentId); }
	 * }).collect(Collectors.toList()); if (size(filterItems) > 0) {
	 * filterItems.forEach((WebsiteModule item) -> {
	 * sb.append("<option value='").append(item.getId()).append("'"); if (selectedId
	 * != null && selectedId == item.getId()) { sb.append(" selected"); }
	 * sb.append(">").append(prefix).append(item.getName()).append("</option>"); if
	 * (checkModuleHaveChildren(websiteModules, item.getId())) {
	 * sb.append(buildSelectWebsiteModules(websiteModules, item.getId(), selectedId,
	 * prefix + "-- -- ")); } }); } return sb.toString(); }
	 * 
	 * public static String buildCheckboxWebsiteModules(List<WebsiteModule>
	 * websiteModules, Integer parentId) { return
	 * buildCheckboxWebsiteModules(websiteModules, parentId, null); }
	 * 
	 * public static String buildCheckboxWebsiteModules(List<WebsiteModule>
	 * websiteModules, Integer parentId, Integer selectedId) { final StringBuilder
	 * sb = new StringBuilder(); List<WebsiteModule> filterItems =
	 * websiteModules.stream().filter(m -> { if (parentId == null) { return
	 * m.getParentId() == null; } else { return m.getParentId() != null &&
	 * Objects.equals(m.getParentId().getId(), parentId); }
	 * }).collect(Collectors.toList()); if (size(filterItems) > 0) {
	 * filterItems.forEach((WebsiteModule item) -> { sb.append("<li>");
	 * sb.append("<label>");
	 * sb.append("<span class='module-checkbox'><input type='checkbox' value='").
	 * append(item.getId()) .append("' "); if (selectedId != null && selectedId ==
	 * item.getId()) { sb.append("checked"); } sb.append("/></span>");
	 * sb.append("<span>"); sb.append(item.getName()); sb.append("</span>");
	 * sb.append("</label>"); if (checkModuleHaveChildren(websiteModules,
	 * item.getId())) { sb.append("<ul>");
	 * sb.append(buildCheckboxWebsiteModules(websiteModules, item.getId(),
	 * selectedId)); sb.append("</ul>"); } sb.append("</li>"); }); } return
	 * sb.toString(); }
	 * 
	 * public static String formatDate(Date date) { return new
	 * SimpleDateFormat("MMMM dd, yyyy").format(date); }
	 * 
	 * public static String customFormatDate(String format, Date date) { return date
	 * == null ? null : new SimpleDateFormat(format).format(date); }
	 * 
	 * public static String customFormatDecimal(String format, BigDecimal num) { num
	 * = num == null ? BigDecimal.ZERO : num; return new
	 * DecimalFormat(format).format(num.setScale(0, RoundingMode.HALF_UP)); }
	 * 
	 * public static String getJSON(Object object) { Gson gson = new Gson(); return
	 * gson.toJson(object); }
	 * 
	 * public static int getDay(Date startDate) { Date endDate = new Date(); long
	 * startTime = startDate.getTime(); long endTime = endDate.getTime(); long
	 * diffTime = endTime - startTime; long diffDays = diffTime / (1000 * 60 * 60 *
	 * 24); return ((Long) diffDays).intValue(); }
	 * 
	 * public static Date getCurrentTime() { return new Date(); }
	 * 
	 * public static int dateDiffToDays(Date startDate, Date enddate) { return (int)
	 * (enddate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24) + 1; }
	 * 
	 * public static boolean dateOfTheWeek(Date date) { Date dt = new Date();
	 * Calendar c = Calendar.getInstance(); c.setTime(dt); c.add(Calendar.DATE, -7);
	 * if (date.after(c.getTime()) && date.before(dt)) { return true; } return
	 * false; }
	 * 
	 * public static boolean compareString(String str1, String str2) { return
	 * StringUtils.isEquals(str1, str2); }
	 * 
	 * public static List findAllAvailableRoleAdmin() { return new
	 * AdminRoleFacade().findAll(); }
	 * 
	 * public static List<AdminModuleInRole>
	 * filterModuleInRoleList(List<AdminModuleInRole> moduleInRoles, Integer
	 * parentId) { return moduleInRoles.stream().filter(m -> { return
	 * m.getAdminModuleId().getParentId().getId() == parentId;
	 * }).collect(Collectors.toList()); }
	 * 
	 * public static boolean checkModuleInrole(List<AdminModuleInRole>
	 * moduleInRoles, int moduleId) { return moduleInRoles.stream().filter(m -> {
	 * return Objects.equals(m.getAdminModuleId().getId(), moduleId);
	 * }).collect(Collectors.toList()).size() > 0; }
	 * 
	 * public static ArrayList filterChildrenWebsiteModules(List<WebsiteModule>
	 * mappings, String parentCode) { return (ArrayList) mappings.stream().filter(m
	 * -> { return Objects.equals(m.getParentId().getModuleCode(), parentCode);
	 * }).collect(Collectors.toList()); }
	 * 
	 * public static ArrayList
	 * filterChildrenWebsiteModulesByParentID(List<WebsiteModule> mappings, Integer
	 * parentID) { return (ArrayList) mappings.stream().filter(m -> { return
	 * Objects.equals(m.getParentId().getId(), parentID);
	 * }).collect(Collectors.toList()); }
	 * 
	 * public static WebsiteModule filterWebsiteModule(List<WebsiteModule> mappings,
	 * String moduleCode) { ArrayList<WebsiteModule> filterResult =
	 * (ArrayList<WebsiteModule>) mappings.stream().filter(m -> { return
	 * Objects.equals(m.getModuleCode(), moduleCode);
	 * }).collect(Collectors.toList()); if (size(filterResult) > 0) { return
	 * filterResult.get(0); } else { return null; } }
	 * 
	 * public static ArrayList filterChildrenWebsiteContents(List<WebsiteContent>
	 * contents, Integer moduleId) { return contents == null ? null :
	 * (ArrayList<WebsiteContent>) contents.stream().filter(c -> { return
	 * c.getModuleIDs() != null && c.getModuleIDs().contains("," + moduleId + ",");
	 * }).collect(Collectors.toList()); }
	 * 
	 * public static String subString(String str, Integer beginIndex, Integer
	 * endIndex) { if (beginIndex < 0 || beginIndex == null || beginIndex > endIndex
	 * || beginIndex > str.length()) { return str; } if (endIndex == null) { return
	 * str.substring(beginIndex); } return str.length() > endIndex ?
	 * str.substring(beginIndex, endIndex) + "..." : str.substring(beginIndex); }
	 * 
	 * public static List subList(List input, Integer beginIndex, Integer endIndex)
	 * { if (input == null) { return null; } if (endIndex == null || endIndex >
	 * input.size()) { return input.subList(beginIndex, input.size()); } if
	 * (beginIndex < 0 || beginIndex == null || beginIndex > endIndex || beginIndex
	 * >= input.size()) { return input; } return input.subList(beginIndex,
	 * endIndex); }
	 * 
	 * public static Set subSet(Set input, Integer beginIndex, Integer endIndex) {
	 * LinkedList<Integer> list = new LinkedList(input); List subList =
	 * subList(list, beginIndex, endIndex); return new HashSet(subList); }
	 * 
	 * public static Integer totalBill(Integer companyID, Integer saleTableID,
	 * Integer customerID) { return new
	 * SaleTableFacade().sumTotalBillbyCustomerID(companyID, saleTableID,
	 * customerID); }
	 * 
	 * public static BigDecimal totalMoney(Integer companyID, Integer saleTableID,
	 * Integer customerID) { return new
	 * SaleTableFacade().sumTotalMoneybyCustomerID(companyID, saleTableID,
	 * customerID); }
	 * 
	 * public static String timeAgo(Date input) { Object[][] time_formats = new
	 * Object[][] { new Object[] { 60l, "giây", 1l }, new Object[] { 120L,
	 * "1 phút trước", "1 phút trước" }, new Object[] { 3600l, "minutes", 60l }, new
	 * Object[] { 7200l, "1 giờ trước", "1 giờ trước" }, new Object[] { 86400l,
	 * "giờ", 3600l }, new Object[] { 172800l, "Hôm qua", "Ngày mai" }, new Object[]
	 * { 604800l, "ngày", 86400l }, new Object[] { 1209600l, "Tuần trước",
	 * "Tuần sau" }, new Object[] { 2419200l, "tuần", 604800l }, new Object[] {
	 * 4838400l, "Tháng trước", "Tháng sau" }, new Object[] { 29030400l, "tháng",
	 * 2419200l }, new Object[] { 58060800l, "Năm trước", "Năm sau" }, new Object[]
	 * { 2903040000l, "năm", 2903040000l }, new Object[] { 5806080000l,
	 * "Thế kỷ trước", "Thế kỷ sau" }, new Object[] { 58060800000l, "thế kỷ",
	 * 2903040000l } }; long seconds = (new Date().getTime() - input.getTime()) /
	 * 1000; String token = "trước"; int list_choice = 1;
	 * 
	 * if (seconds == 0) { return "Vừa xong"; } if (seconds < 0) { seconds =
	 * Math.abs(seconds); token = "từ giờ"; list_choice = 2; } for (Object[] format
	 * : time_formats) { long compareTime = (long) format[0]; if (seconds <
	 * compareTime) { try { long returnTime = (long) format[2]; return new
	 * DecimalFormat("0").format(Math.floor(seconds / returnTime)) + " " + format[1]
	 * + " " + token; } catch (Exception e) { return format[list_choice].toString();
	 * } } } return new SimpleDateFormat("dd/MM/yyyy HH:mm").format(input); }
	 * 
	 * private static boolean checkPropertyHaveChildren(List<Properties> properties,
	 * Integer parentId) { List<Properties> filterItems = null; try { filterItems =
	 * properties.stream().filter(m -> { if (parentId == null) { return
	 * m.getParentID() == null; } else { return m.getParentID() != null &&
	 * Objects.equals(m.getParentID().getId(), parentId); }
	 * }).collect(Collectors.toList()); } catch (Exception e) { e.printStackTrace();
	 * } return filterItems != null && filterItems.size() > 0; }
	 * 
	 * public static String buildProperties(List<Properties> properties, Integer
	 * parentId) { final StringBuilder sb = new StringBuilder(); List<Properties>
	 * filterItems = properties.stream().filter(m -> { if (parentId == null) {
	 * return m.getParentID() == null; } else { return m.getParentID() != null &&
	 * Objects.equals(m.getParentID().getId(), parentId); }
	 * }).collect(Collectors.toList()); if (size(filterItems) > 0) {
	 * filterItems.forEach((Properties item) -> { sb.append("<li>");
	 * sb.append("<label><span class='module-collapse'>"); if
	 * (checkPropertyHaveChildren(properties, item.getId())) {
	 * sb.append("<i class='far fa-minus-square'></i>"); }
	 * sb.append("</span><span style='" + (item.getIsActive() ? "" :
	 * "color:#999;text-decoration:line-through") + "'>");
	 * sb.append(item.getName()); sb.append("</span><ul class='module-action'>"); //
	 * sb.
	 * append("<li><a class='btn-open-modal text-success' data-controller='/CellxAdmin/Product/ListProperty/ViewInsert/"
	 * ) // .append(item.getId()) //
	 * .append("'><i class='fa fa-plus-circle'></i></a></li>"); sb.
	 * append("<li><a class='btn-open-modal text-primary' data-controller='/CellxAdmin/Product/ListProperty/ViewEdit/"
	 * ) .append(item.getId()) .append("'><i class='fa fa-edit'></i></a></li>"); //
	 * sb.
	 * append("<li><a class='text-warning btn-send-ajax' data-controller='/CellxAdmin/Product/ListProperty/ChangeStatus/"
	 * ) // .append(item.getId()) // .append("'><i class='fa " + (item.getIsActive()
	 * ? "fa-lock" : "fa-lock-open") + "'></i></a></li>"); sb.
	 * append("<li><a class='text-danger btn-send-ajax' data-controller='/CellxAdmin/Product/ListProperty/Delete/"
	 * ) .append(item.getId()) .append("'><i class='fas fa-trash'></i></a></li>");
	 * sb.append("</ul></label>"); if (checkPropertyHaveChildren(properties,
	 * item.getId())) { sb.append("<ul>"); sb.append(buildProperties(properties,
	 * item.getId())); sb.append("</ul>"); } sb.append("</li>"); }); } return
	 * sb.toString(); }
	 * 
	 * public static WebsitePanel getPanelByCode(List<WebsitePanel> list, String
	 * code) { final WebsitePanel websitePanel = list.stream().filter(m ->
	 * m.getCode().equals(code)).findFirst().get(); return websitePanel; }
	 */

	public static String generateProperties(String type, String str1, String str2) {
		final StringBuilder sb = new StringBuilder();
		switch (type) {
		case "selection":
			for (String s : str1.split(",")) {
				sb.append("<div class='checkbox value'><label class='custom-control-label'>").append(
						"<input class='custom-control-input value-property' type='checkbox' name='value' value='")
						.append(s).append("'");
				for (String i : str2.split(",")) {
					if (s.equals(i)) {
						sb.append(" checked");
					}
				}
				sb.append("/>" + s + "</label></div></div>");
			}
			break;
		case "number":
			sb.append(sb);
			sb.append(
					"<div class='form-group value'><div class='col-sm-12'><input class='form-control text-property' type='number' name='value' value='")
					.append(str2).append("'/></div></div>");
			break;
		case "text":
			sb.append(sb);
			sb.append(
					"<div class='form-group value'><div class='col-sm-12'><input class='form-control text-property' type='text' name='value' value='")
					.append(str2).append("'/></div></div>");
			break;
		default:
			sb.append(sb);
			sb.append(
					"<div class='form-group value'><div class='col-sm-12'><input class='form-control text-property' type='date' name='value' value='")
					.append(str2).append("'/></div></div>");
			break;
		}
		return sb.toString();
	}

	public static String generateCheckBoxUser(String str, Integer id) {
		final StringBuilder sb = new StringBuilder();
		for (String s : str.split(",")) {
			sb.append("<div class='checkbox'><input class='property-detail' type='checkbox' name='value' value='")
					.append(s).append("'/>" + s + "</div>");
		}
		return sb.toString();
	}

	public static String generateCheckBoxProduct(String str) {
		final StringBuilder sb = new StringBuilder();
		for (String s : str.split(",")) {
			sb.append(s + " ");
		}
		return sb.toString();
	}

	public static List<String> generateListProperties(String str) {
		List<String> list = new ArrayList<String>();
		for (String s : str.split(",")) {
			list.add(s);
		}
		return list;
	}

	public static String generateCheckBox(String str) {
		final StringBuilder sb = new StringBuilder();
		for (String s : str.split(",")) {
			sb.append(
					"<div class='form-group value'><label class='control-label col-sm-1'><span class='fas fa-trash-alt text-danger delete'></span></label><div class='col-sm-11'><input readonly class='form-control col-11 value-property' type='text' name='value' value='")
					.append(s).append("'/></div></div>");
		}
		return sb.toString();
	}

	public static String generateValueCheckBox(String str) {
		final StringBuilder sb = new StringBuilder();
		for (String s : str.split(",")) {
			sb.append("<div class='checkbox value'><label class='custom-control-label'>")
					.append("<input class='custom-control-input value-property' type='checkbox' name='value' value='")
					.append(s).append("'/>" + s + "</label></div></div>");
		}
		return sb.toString();
	}

	public static String generateValueText(String str) {
		final StringBuilder sb = new StringBuilder();
		sb.append(
				"<div class='form-group value'><div class='col-sm-12'><input  class='form-control col-12 text-property' type='text' name='value' value='")
				.append(str).append("'/></div></div>");
		return sb.toString();
	}

	public static String generateValueNumber(BigDecimal numb) {
		final StringBuilder sb = new StringBuilder();
		sb.append(
				"<div class='form-group value'><div class='col-sm-12'><input  class='form-control col-12 text-property' type='number' name='value' value='")
				.append(numb).append("'/></div></div>");
		return sb.toString();
	}

	public static String generateValueDate(Date date) {
		final StringBuilder sb = new StringBuilder();
		sb.append(
				"<div class='form-group value'><div class='col-sm-12'><input  class='form-control col-12 text-property' type='date' name='value' value='")
				.append(date).append("'/></div></div>");
		return sb.toString();
	}

	public static String fomatCode(String text, String numberMax, int length) {
		String code = "1";
		if (numberMax != null) {
			code = String.valueOf(Integer.parseInt(numberMax.substring(3)) + 1);
		}
		while (code.length() < length) {
			code = "0" + code;
		}
		return text + code;
	}

}
