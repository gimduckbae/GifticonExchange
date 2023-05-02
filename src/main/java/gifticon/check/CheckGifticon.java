package gifticon.check;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

class CheckGifticon {

	public static void main(String[] args) throws IOException {
		URL url = new URL("https://www.happyorder.co.kr/api");
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("POST");

		httpConn.setRequestProperty("authority", "www.happyorder.co.kr");
		httpConn.setRequestProperty("accept", "*/*");
		httpConn.setRequestProperty("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
		httpConn.setRequestProperty("content-type", "application/json; charset=UTF-8");
		httpConn.setRequestProperty("cookie",
				"SCOUTER=z3em70r1urucc; NetFunnel_OK=Y; HAPPYORDER_YEK_NOISSES=04f0a18420bb7a25dced7692ee42aea2f9297988d0b279543b87ad7c8195cc394c2b588def48365242af659c7a58db17bc315682238da85a73b17c18ded192c1851c450de7b3ed02785622168cd913d680d3c2d900d3a4845c1800d512f3e3c4f2861913965288e35f78dc537885941ad93500ef74ae3710fa83bab2de0371a4f05fac9635ffee0e989f203b2d736f9bbedd5eb64f5c7932c27044e728ac22f3eaaab8f16770d62e47aa76f8c3d47b8337dc0359ffcecf9a893de0534b4225acfbad41b0aa03afac4fc7aff823449266eacc8e590bb2747e80de0bc2f3c84ae87bfb7eea8f9a06f07c7cc44903f051c2acafe4c07f3af6e6bb51a955a7b0fa2867f2b72f140fe4ad150c919e2c749d62cce35b88e43c061eb8f5baa6036c37c5a392681bfe354f41435d6ef250564fc5936df8ac7f1f8d1df432128ac9d908e142996db603ad3468d7d4dc2f77c4df04e165c7f5d7a784d8c78de8fd09bcfd504f751d9be7e87493e3f7beea096568942231e81e7580d1430aff2639ea586a84; NetFunnel_ID=; JSESSIONID=4289E391147F403F1E1A1D4A57DEB53A");
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
		writer.write("{\"brandCode\":\"BRkorea\",\"couponNo\":\"92009543184214\",\"apiPath\":\"/happycon/inquiry\"}");
		writer.flush();
		writer.close();
		httpConn.getOutputStream().close();

		InputStream responseStream = httpConn.getResponseCode() / 100 == 2 ? httpConn.getInputStream()
				: httpConn.getErrorStream();
		Scanner s = new Scanner(responseStream).useDelimiter("\\A");
		String response = s.hasNext() ? s.next() : "";

		JSONParser parser = new JSONParser();

		try {
			JSONObject object = (JSONObject) ((JSONObject) ((JSONObject) parser.parse(response)).get("result"))
					.get("resultData");
			System.out.println(object);

		} catch (ParseException e) {
			System.out.println("JSON으로 변환실패");
			e.printStackTrace();
		}

	}
}