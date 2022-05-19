package sample.user;

import java.sql.Date;

/**
 *
 * @author Mr.Thanh
 */
public class UserDTO {

    private String email;
    private String fullName;
    private int roleID;
    private String password;
    private String address;
    private String birthday;
    private String phone;
    private boolean status;

    public UserDTO() {
    }

    public UserDTO(String fullName, int roleID, String password, String address, String birthday, String phone, String email, boolean status) {
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "fullName=" + fullName + ", roleID=" + roleID + ", password=" + password + ", address=" + address + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + ", status=" + status + '}';
    }

}
