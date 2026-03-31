package model;

public class Student {
    private int id; // This is the only ID we need now
    private String fullname;
    private String email;
    private String gender;
    private String course;
    private String photo;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

  // Change these in Student.java
public String getFullname() { return fullname; } // Changed from getFullName
public void setFullname(String fullname) { this.fullname = fullname; } // Changed from setFullName

public String getEmail() { return email; }
public void setEmail(String email) { this.email = email; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
}
