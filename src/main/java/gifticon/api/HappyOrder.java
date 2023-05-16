package gifticon.api;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class HappyOrder {

	/** 배스킨라빈스 기프티콘 번호로 API 호출 결과값 받기 */
	public static String getResponseByGifticonNumber(String number) throws IOException {
		URL url = new URL("https://www.happyorder.co.kr/api");
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("POST");

		httpConn.setRequestProperty("authority", "www.happyorder.co.kr");
		httpConn.setRequestProperty("accept", "*/*");
		httpConn.setRequestProperty("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
		httpConn.setRequestProperty("content-type", "application/json; charset=UTF-8");
		httpConn.setRequestProperty("cookie", "SCOUTER=z3em70r1urucc; NetFunnel_OK=Y; HAPPYORDER_YEK_NOISSES=802f2ddd0e279b0f11cf09bdac91b636c16541a8d5be9ce9134c6e7d0ae839b18f3b7cb85e46fb7248a6e2b4c565028f780c2f7f33cf54e22660e09457d8c66e76e290caf504ba5f2b4cd13ebb604f8e69969379f4fa4da676286c1685fb36529b4dc6358865bc661c91af061a55d087c0fd2123fc32246aacd9cc1202e75dcfd918fc51f6a73d9e505d395ee8842aaf4723691092c64db86a1933bcecadb922655e17331917839f266a3fb7aa250bd9fc9ac397bd7c428a509b1396b07bbf57599f89c438878bd39b79b6d06dc9a4d34e3263e00d13b57395a241046bd3899c1e99f9374a78e7d3bddab929acb285421597984aaec9c93c509dafc38459f7d921db9518c0f2b0281c35edbc5105776ac72b6c8702d2369c3df339b13ff55712c696eeecfcf0d456b908921a84ce50bc15dafdb91a79b589ac21833f839f83da5a2641b2442b0b2cf4a4f4b823c3663b2df10fdcd9a3f9a086e9e9eb62425941816849a421c61d09de102618a79e94eb60718dc2f70ff49ef1c15404463c6c95cd67d53201d5691ed5f0eb0a38fb01dc; NetFunnel_ID=; JSESSIONID=2199FEF62959CC01CD4C8D14FB56AC29");
		httpConn.setRequestProperty("origin", "https://www.happyorder.co.kr");
		httpConn.setRequestProperty("referer", "https://www.happyorder.co.kr/?am=payment/payment&pp=myOrder/cart");
		httpConn.setRequestProperty("sec-ch-ua",
				"\"Chromium\";v=\"112\", \"Google Chrome\";v=\"112\", \"Not:A-Brand\";v=\"99\"");
		httpConn.setRequestProperty("sec-ch-ua-mobile", "?1");
		httpConn.setRequestProperty("sec-ch-ua-platform", "\"Android\"");
		httpConn.setRequestProperty("sec-fetch-dest", "empty");
		httpConn.setRequestProperty("sec-fetch-mode", "cors");
		httpConn.setRequestProperty("sec-fetch-site", "same-origin");
		httpConn.setRequestProperty("user-agent",
				"Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36");

		httpConn.setDoOutput(true);
		OutputStreamWriter writer = new OutputStreamWriter(httpConn.getOutputStream());
		writer.write("{\"brandCode\":\"BRkorea\",\"couponNo\":\"" + number + "\",\"apiPath\":\"/happycon/inquiry\"}"); // number = 쿠폰번호
		writer.flush();
		writer.close();
		httpConn.getOutputStream().close();

		InputStream responseStream = httpConn.getResponseCode() / 100 == 2 ? httpConn.getInputStream()
				: httpConn.getErrorStream();
		Scanner s = new Scanner(responseStream).useDelimiter("\\A");
		String response = s.hasNext() ? s.next() : "";
		return response;
	}
}
