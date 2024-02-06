/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ua.edu.znu.lab.bean;

import java.io.InputStream;
import java.util.Scanner;

public class LoginBean {

    private String userName;
    private String password;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isValidUser() {
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("credentials.txt");
        if (inputStream == null) {
            System.out.print("File credentials.txt not found in the classpath");
            return false;
        }
        try (Scanner scanner = new Scanner(inputStream)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                System.out.println("Reading line: " + line);
                String[] parts = line.split(":");

                if (parts.length == 2) {
                    System.out.println("Username: " + parts[0] + ", Password: " + parts[1]);

                    if (parts[0].equals(this.userName) && parts[1].equals(this.password)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
