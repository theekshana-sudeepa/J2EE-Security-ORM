-- ==============================================================================
-- J2EE Security ORM - Database Schema & Seed Data
-- Database Engine: MySQL 8.0+
-- Persistence: Hibernate ORM 6.x / Jakarta Persistence 3.x
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS `j2ee-security-orm`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `j2ee-security-orm`;

-- ------------------------------------------------------------------------------
-- Table: user
-- Stores principal identity and SHA-256 hashed credentials
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) DEFAULT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------------------------
-- Table: user_role
-- ElementCollection table mapping user roles (ADMIN, USER)
-- ------------------------------------------------------------------------------
CREATE TABLE `user_role` (
    `id` BIGINT NOT NULL,
    `role` VARCHAR(100) NOT NULL,
    KEY `idx_user_role_user` (`id`),
    CONSTRAINT `fk_user_role_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==============================================================================
-- Seed Data
-- Passwords are encrypted with SHA-256 one-way hashing
-- admin123 -> 240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9
-- user123  -> e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446
-- ==============================================================================

-- 1. Administrator Account (Roles: ADMIN, USER)
INSERT INTO `user` (`id`, `email`, `name`, `password`) VALUES
(1, 'admin@example.com', 'System Administrator', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9');

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'ADMIN'),
(1, 'USER');

-- 2. Standard User Account (Roles: USER)
INSERT INTO `user` (`id`, `email`, `name`, `password`) VALUES
(2, 'user@example.com', 'Standard User', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446');

INSERT INTO `user_role` (`id`, `role`) VALUES
(2, 'USER');
