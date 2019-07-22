package com.poly.utils;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.Random;

public class CaptchaUtil {

    public static String generateCaptchaTextMethod1() {

        Random rdm = new Random();
        int rl = rdm.nextInt(); // Random numbers are generated.
        String hash1 = Integer.toHexString(rl); // Random numbers are converted to Hexa Decimal.

        return hash1;

    }

    public static String generateCaptchaTextMethod2(int captchaLength) {

        String saltChars = "abcdefghijklmnopqrstuvwxyz1234567890";
        StringBuffer captchaStrBuffer = new StringBuffer();
        java.util.Random rnd = new java.util.Random();

        // build a random captchaLength chars salt
        while (captchaStrBuffer.length() < captchaLength) {
            int index = (int) (rnd.nextFloat() * saltChars.length());
            captchaStrBuffer.append(saltChars.substring(index, index + 1));
        }

        return captchaStrBuffer.toString();

    }

    @SuppressWarnings("rawtypes")
	public boolean verifyReCaptcha(String secret, String response) {
        try {
            String url = "https://www.google.com/recaptcha/api/siteverify?"
                    + "secret=" + secret
                    + "&response=" + response;
            String jsonText;
            try (InputStream res = new URL(url).openStream()) {
                BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));
                StringBuilder sb = new StringBuilder();
                int cp;
                while ((cp = rd.read()) != -1) {
                    sb.append((char) cp);
                }
                jsonText = sb.toString();
            }
            Gson gson = new Gson();
            Map rs = gson.fromJson(jsonText, Map.class);
            return (boolean) rs.get("success");
        } catch (Exception e) {
            return false;
        }
    }

}
