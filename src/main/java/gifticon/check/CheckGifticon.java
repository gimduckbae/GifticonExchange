package gifticon.check;

import java.io.IOException;
import java.util.UUID;

import com.fasterxml.uuid.Generators;

import gifticon.GifticonDao;
import gifticon.GifticonDto;
import gifticon.api.HappyOrder;

class CheckGifticon {

	public static void main(String[] args) throws IOException {

		UUID uuid = Generators.timeBasedGenerator().generate();
		System.out.println(uuid);
		
//		String response = HappyOrder.getResponseByGifticonNumber("92009543184214");
//		GifticonDao gifticonDao = new GifticonDao();
//		GifticonDto gifticonDto = gifticonDao.getGifticonStatusByResponse(response);
//		System.out.println(gifticonDto.toString());
		
	}
}