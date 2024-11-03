package albaim;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.apache.ibatis.session.SqlSession;


public class IndexController {
  @FXML
  private Label loginResultText;

  @FXML
  private TextField usernameField;

  @FXML
  private PasswordField passwordField;

  @FXML
  protected void onLoginButtonClick() {
//    SqlSession sqlSession = MyBatisUtil.getSession();
//    UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//    User user = mapper.selectLogin(usernameField.getText(), passwordField.getText());
    User user = new UserDAO().selectLogin(usernameField.getText(), passwordField.getText());
    if (user != null) {
      loginResultText.setText("Welcome, "+ user.getExprname()+ "!");
    } else {
      loginResultText.setText("Invalid user");
    }
  }

  @FXML
  protected void onSignupClick() throws Exception {
    FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("views/signup-view.fxml"));
    Parent root = fxmlLoader.load();

    Stage signupStage = new Stage();
    signupStage.setTitle("Signup");
    signupStage.setScene(new Scene(root));
    signupStage.show();

  }

}
