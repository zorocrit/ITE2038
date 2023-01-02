package user;

public class User {
    private String UserID;
    private String UserPassword;
    private String UserName;
    private String UserGender;
    private String UserEmail;

    private String lecSearch;

    public String getLecSearch() {
        return lecSearch;
    }

    public void setLecSearch(String LecSearch) {
        lecSearch = LecSearch;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserGender() {
        return UserGender;
    }

    public void setUserGender(String userGender) {
        UserGender = userGender;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String userEmail) {
        UserEmail = userEmail;
    }
}
