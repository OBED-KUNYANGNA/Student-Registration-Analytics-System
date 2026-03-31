package model;

public class Admin {
    private int id; // This is the 'symbol' that was missing
    private String email;
    private String password;

    public Admin() {}

    // Add this specific method to fix the error in AdminDAO
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
