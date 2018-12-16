package com.mytest.pay.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class RestHandler {
	

	private static final Logger logger = LoggerFactory.getLogger(RestHandler.class);
	
	public enum HttpMethodType {
		POST, GET, DELETE
	}

	private static final String API_SERVER_HOST = "https://kapi.kakao.com";

	private String accessToken;
	private String adminKey;

	public void setAccessToken(final String accessToken) {
		this.accessToken = accessToken;
	}

	public void setAdminKey(final String adminKey) {
		this.adminKey = adminKey;
	}

	public String request(HttpMethodType httpMethod, final String apiPath, final String params) {

		String requestUrl = API_SERVER_HOST + apiPath;
		if (httpMethod == null) {
			httpMethod = HttpMethodType.GET;
		}
		if (params != null && params.length() > 0
				&& (httpMethod == HttpMethodType.GET || httpMethod == HttpMethodType.DELETE)) {
			requestUrl += params;
			
		}
		
		logger.info(requestUrl);

		HttpsURLConnection conn;
		OutputStreamWriter writer = null;
		BufferedReader reader = null;
		InputStreamReader isr = null;

		try {
			final URL url = new URL(requestUrl);
			conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod(httpMethod.toString());

			conn.setRequestProperty("Authorization", "KakaoAK " + this.adminKey);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("charset", "utf-8");

			if (params != null && params.length() > 0 && httpMethod == HttpMethodType.POST) {
				conn.setDoOutput(true);
				writer = new OutputStreamWriter(conn.getOutputStream());
				writer.write(params);
				writer.flush();
			}

			final int responseCode = conn.getResponseCode();
			System.out.println(String.format("\nSending '%s' request to URL : %s", httpMethod, requestUrl));
			System.out.println("Response Code : " + responseCode);
			if (responseCode == 200)
				isr = new InputStreamReader(conn.getInputStream());
			else
				isr = new InputStreamReader(conn.getErrorStream());

			reader = new BufferedReader(isr);
			final StringBuffer buffer = new StringBuffer();
			String line;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			System.out.println(buffer.toString());
			// 요청시 콘솔에 출력되는 부분
			return buffer.toString();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (writer != null)
				try {
					writer.close();
				} catch (Exception ignore) {
				}
			if (reader != null)
				try {
					reader.close();
				} catch (Exception ignore) {
				}
			if (isr != null)
				try {
					isr.close();
				} catch (Exception ignore) {
				}
		}

		return null;
	}

}
