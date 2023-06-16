/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.utils;

import java.util.Random;

/**
 *
 * @author namdh
 */
public class RandomString {

    public static String number(int length) {
        // Khởi tạo đối tượng Random
        Random random = new Random();

        // Sinh số ngẫu nhiên từ 0 đến 999999
        int randomNumber = random.nextInt(1000000);

        // Định dạng lại số thành chuỗi có độ dài bằng length
        String authenticationCode = String.format("%0" + length +"d", randomNumber);

        return authenticationCode;
    }
}
