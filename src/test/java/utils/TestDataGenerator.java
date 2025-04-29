package utils;

import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

public class TestDataGenerator {
    public static String generateRandomName() {
        return "User_" + UUID.randomUUID().toString().substring(0, 8);
    }

    public static String generateRandomEmail() {
        return "user" + UUID.randomUUID().toString().substring(0, 8) + "@example.com";
    }

    public static String generateRandomPassword() {
        return "Pass" + ThreadLocalRandom.current().nextInt(1000, 9999);
    }

    public static String generateRandomAdministrator() {
        return ThreadLocalRandom.current().nextBoolean() ? "true" : "false";
    }

    public static String generateRandomUserId() {
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 16);
    }

    public static String generateRandomUserIdError() {
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 15);
    }
}
