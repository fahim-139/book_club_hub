<?php

use PHPUnit\Framework\TestCase;

class UsersTest extends TestCase
{
    private $pdo;

    protected function setUp(): void
    {
        $this->pdo = new PDO("mysql:host=localhost;dbname=bookclubhubdb", "root", "");
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public function testUserRegistration()
    {
        $email = "testuser@example.com";
        $password = password_hash("SecurePass123!", PASSWORD_DEFAULT);
        $userId = uniqid("user_");
        $firstName = "Test";
        $lastName = "User";
        $bio = "Testing bio";
        
        // Insert test user
        $stmt = $this->pdo->prepare("INSERT INTO users (first_name, last_name, email, password, bio, user_id) VALUES (?, ?, ?, ?, ?, ?)");
        $success = $stmt->execute([$firstName, $lastName, $email, $password, $bio, $userId]);

        $this->assertTrue($success, "User should be inserted");

        // Clean up
        $this->pdo->prepare("DELETE FROM users WHERE email = ?")->execute([$email]);
    }

    public function testLoginWithCorrectCredentials()
    {
        $email = "loginuser@example.com";
        $plainPassword = "TestPass123!";
        $hashedPassword = password_hash($plainPassword, PASSWORD_DEFAULT);
        $userId = uniqid("user_");

        $stmt = $this->pdo->prepare("INSERT INTO users (first_name, last_name, email, password, user_id) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute(["Login", "User", $email, $hashedPassword, $userId]);

        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->assertNotEmpty($user, "User should exist");
        $this->assertTrue(password_verify($plainPassword, $user["password"]), "Password should match");

        // Clean up
        $this->pdo->prepare("DELETE FROM users WHERE email = ?")->execute([$email]);
    }

    public function testOTPGeneration()
    {
        $otp = str_pad(rand(100000, 999999), 6, "0", STR_PAD_LEFT);
        $this->assertMatchesRegularExpression('/^\d{6}$/', $otp, "OTP should be a 6-digit number");
    }
}