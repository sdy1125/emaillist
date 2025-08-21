package murach.business;

public class UserDB {
    public static void insert(User user) {
        // Tạm thời in ra console thay vì lưu DB
        System.out.println("Saving user: " + user.getEmail() + ", " + user.getFirstName() + ", " + user.getLastName());
    }
}
