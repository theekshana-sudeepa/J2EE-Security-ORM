package com.thikka.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * PasswordUtil - Handles SHA-256 password hashing.
 *
 * SHA-256 is a ONE-WAY hash function:
 *   - "12345"  →  "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"
 *   - You CANNOT reverse the hash back to the original password.
 *   - So the DB only ever stores the hash, never the real password.
 *
 * On login: hash the entered password → compare to stored hash.
 */
public class PasswordUtil {

    /**
     * Hashes a plain-text password using SHA-256.
     *
     * @param password the plain-text password entered by the user
     * @return a 64-character lowercase hex string (SHA-256 hash)
     */
    public static String hash(String password) {
        try {
            // Get the SHA-256 hashing algorithm from Java's built-in security library
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Compute the hash - returns a byte array of 32 bytes
            byte[] hashBytes = digest.digest(password.getBytes("UTF-8"));

            // Convert each byte to a 2-character hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                // "%02x" means: 2-digit lowercase hex, padded with zero if needed
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString(); // 64-character hex string

        } catch (Exception e) {
            throw new RuntimeException("Error hashing password with SHA-256", e);
        }
    }
}
