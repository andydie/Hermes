package org.hermes.test;

import java.text.SimpleDateFormat;
import java.util.UUID;

/**
 * Created by admin on 2016/2/18.
 */
public class UUIDTest {
    public static void main(String[] args) {
        System.out.println(UUID.randomUUID().toString().replaceAll("-",""));
        System.out.println(String.valueOf(System.currentTimeMillis()));
    }
}
