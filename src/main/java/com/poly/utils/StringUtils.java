package com.poly.utils;

import java.security.SecureRandom;
import java.util.List;

public class StringUtils {

    public static String convertString(String str) {
        return str == null ? "" : str;
    }

    public static boolean isEquals(String str1, String str2) {
        if (str1 == null && str2 == null) {
            return true;
        } else if (str1 != null && str2 != null) {
            return str1.equals(str2);
        }
        return false;
    }

    public static boolean isEmpty(String input) {
        return input == null || input.trim().length() == 0;
    }

    public static String escapeHtmlEntity(String value) {
        String[] specialCharacters = {"<", ">", "&", "¢", "£", "¥", "€", "©", "®"};
        String[] entityNames = {"&lt;", "&gt;", "&amp;", "&cent;", "&pound", "&yen;", "&euro;", "&copy;", "&reg;"};
        return value == null ? null : org.apache.commons.lang3.StringUtils.replaceEach(value, specialCharacters, entityNames);
    }

    public static String replaceUnicodeCharacters(String string) {
        string = string.toUpperCase();
        string = string.replaceAll("/À|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g", "A");
        string = string.replaceAll("/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g", "E");
        string = string.replaceAll("/Ì|Í|Ĩ|Ị|Ỉ|Ĩ/g", "I");
        string = string.replaceAll("/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g", "O");
        string = string.replace("/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g", "U");
        string = string.replace("/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g", "Y");
        string = string.replace("/Đ/g", "D");
        string = string.replace("Ủ", "U");
        string = string.replace("Ỹ", "Y");
        string = string.replace(" ", "-");
        return string.toLowerCase();
    }

    public static String findParagraphContainKeyword(String string, String keyword, int c) {
        if (string != null && keyword != null) {
            if (string.length() > c) {
                int index = string.indexOf(keyword);
                if (index > c - keyword.length()) {
                    int j = string.length() / (int) (c / 3);
                    for (int i = 1; i <= j; i++) {
                        String temp = string.substring(i * (int) (c / 3), i * (int) (c / 3) + c);
                        if (temp.contains(keyword)) {
                            return "..." + temp.replace(keyword, "<b style=\"font-weight: bold;\">" + keyword + "</b>") + "...";
                        }
                    }
                    String temp = string.substring(string.length() - c, string.length());
                    if (temp.contains(keyword)) {
                        return "..." + temp.replace(keyword, "<b style=\"font-weight: bold;\">" + keyword + "</b>");
                    }
                }
            }
            if (string.length() >= 130) {
                return string.substring(0, c).replace(keyword, "<b style=\"font-weight: bold;\">" + keyword + "</b>") + "...";
            } else {
                return string.replace(keyword, "<b style=\"font-weight: bold;\">" + keyword + "</b>") + "...";
            }
        } else if (string != null) {
            if (string.length() >= 130) {
                return string.substring(0, c) + "...";
            } else {
                return string + "...";
            }
        } else {
            return "";
        }
    }

    public static String convertToArrayJS(List<String> list) {
        String arrjs = "[";
        for (int i = 0; i < list.size(); i++) {
            arrjs += "\"" + list.get(i) + "\"";
            if (i != list.size() - 1) {
                arrjs += ", ";
            }
        }
        arrjs += "]";
        return arrjs;
    }

    public static String randomString(int len) {
        final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0;
                i < len;
                i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }
    
    public static boolean equalsCode(String input, String result) {
    	input = input.replaceAll(" +", " ").replaceAll("\r\n", "").replaceAll("\r", "").replaceAll("\n", "").replaceAll("\t", "");
    	result = result.replaceAll(" +", " ").replaceAll("\r\n", "").replaceAll("\r", "").replaceAll("\n", "").replaceAll("\t", "");
    	if (input.toLowerCase().contains(result.toLowerCase())) {
    		return true;
    	}
    	return false;
    }
}
