/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author nguyen phuoc chung
 */
public class Account {

    private int user_id;
    private String username;
    private String email;
    private String password;
    private long numberphone;
    private String address;
    private String images;

    public Account() {
    }

    public Account(int user_id, String username, String email, long numberphone, String address, String images) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.numberphone = numberphone;
        this.address = address;
        this.images = images;
    }

    public Account(String username, String password, String email, String address, long numberphone) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.numberphone = numberphone;
        this.address = address;
    }

    public Account(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Account(int user_id, String images) {
        this.user_id = user_id;
        this.images = images;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getNumberPhone() {
        return numberphone;
    }

    public void getNumberPhone(long phoneNumber) {
        this.numberphone = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getNumberphone() {
        return numberphone;
    }

    public void setNumberphone(long numberphone) {
        this.numberphone = numberphone;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

}
