package albaim.views;

import albaim.User;
import albaim.UserDAO;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;


public class IndexController {

  public static void openIndex (Stage stage) throws IOException {
    FXMLLoader fxmlLoader = new FXMLLoader(IndexController.class.getResource("index-view.fxml"));
    Scene scene = new Scene(fxmlLoader.load(), 800, 500);
    stage.setTitle("Login - Albaim");
    stage.setScene(scene);
    stage.show();
  }

  @FXML
  private Label loginResultText;

  @FXML
  private TextField useridField;

  @FXML
  private PasswordField passwordField;

  @FXML
  protected void onLoginButtonClick() throws IOException {
    User user = new UserDAO().selectLogin(useridField.getText().trim(), passwordField.getText());
    if (user != null) {
      loginResultText.setText("Welcome, "+ user.exprname + "!");

      FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("user-view.fxml"));
      Parent root = fxmlLoader.load();

      Stage userStage = new Stage();
      userStage.setTitle(user.exprname + " - Albaim");

      UserController controller = fxmlLoader.getController();
      controller.setCurrentUser(user);

      userStage.setScene(new Scene(root));

      userStage.show();

      userStage.setOnCloseRequest(e -> {
        Stage stage = new Stage();
        try {
          openIndex(stage);
        } catch (IOException ex) {
          throw new RuntimeException(ex);
        }
      });

      Stage thisStage = (Stage) useridField.getScene().getWindow();
      thisStage.close();
    } else {
      loginResultText.setText("Invalid user");
    }
  }

  @FXML
  protected void onSignupClick() throws Exception {
    FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("signup-view.fxml"));
    Parent root = fxmlLoader.load();

    Stage signupStage = new Stage();
    signupStage.setTitle("Signup");
    signupStage.setScene(new Scene(root));
    signupStage.show();

  }

}
