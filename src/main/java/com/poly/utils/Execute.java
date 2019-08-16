package com.poly.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.google.gson.Gson;
import com.poly.entity.Jdoodle;

public class Execute {
	public static Jdoodle execute(String script, String language) {
		String clientId = "41693e1c168632c6272cdfaa36151b6a"; //Replace with your client ID
        String clientSecret = "76863b156d66d86e9662f84e089678cb915101cc0eda3940b6640e4bd9d1dc18"; //Replace with your client Secret
        String versionIndex = "0";
        String result = null;
        Jdoodle jdoodle = null;
        script = formatScript(script);
        try {
            URL url = new URL("https://api.jdoodle.com/v1/execute");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");

            String input = "{\"clientId\": \"" + clientId + "\",\"clientSecret\":\"" + clientSecret + "\",\"script\":\"" + script +
            "\",\"language\":\"" + language + "\",\"versionIndex\":\"" + versionIndex + "\"} ";

            System.out.println(input);

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(input.getBytes());
            outputStream.flush();

            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new RuntimeException("Please check your inputs : HTTP error code : "+ connection.getResponseCode());
            }

            BufferedReader bufferedReader;
            bufferedReader = new BufferedReader(new InputStreamReader(
            (connection.getInputStream())));

            System.out.println("Output from JDoodle .... \n");
            String output;
            while ((output = bufferedReader.readLine()) != null) {
                result = output;
            }

            connection.disconnect();
            jdoodle = new Gson().fromJson(result, Jdoodle.class);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(result);
        return jdoodle;
	}
	
	public static String formatScript(String script) {
		return script.replaceAll("	", " ").replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\\t", " ");
	}
}
