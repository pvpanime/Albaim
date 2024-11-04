package albaim.views;

import albaim.User;
import albaim.UserDAO;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.RotateTransition;
import javafx.animation.Timeline;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.apache.ibatis.exceptions.PersistenceException;
import org.kordamp.ikonli.feather.Feather;
import org.kordamp.ikonli.javafx.FontIcon;

import java.sql.SQLException;
import java.util.function.Supplier;
import java.util.regex.Pattern;


public class SignupController {

  private final UserDAO userDAO = new UserDAO();

  @FXML
  private Label emailLabel;

  @FXML
  private Label useridLabel;

  @FXML
  private Label passwordLabel;

  @FXML
  private Label exprNameLabel;

  @FXML
  private TextField emailField;

  @FXML
  private TextField useridField;

  @FXML
  private PasswordField passwordField;

  @FXML
  private PasswordField passwordConfirmField;

  @FXML
  private TextField exprNameField;

  @FXML
  private RadioButton usePersonal, useEmployer;

  @FXML
  private FontIcon useridValidity;

  @FXML
  private FontIcon emailValidity;

  private void alert(Alert.AlertType type, String title, String header, String content) {
    Alert alert = new Alert(type);
    alert.setTitle(title);
    alert.setHeaderText(header);
    alert.setContentText(content);
    alert.showAndWait();
  }

  private void requireFieldAgain(String header, String content, TextField textField) {
    alert(Alert.AlertType.ERROR, "Error", header, content);
    textField.requestFocus();
  }


  private void setIconAwaiting(FontIcon icon, RotateTransition transition) {
    icon.setIconCode(Feather.LOADER);
    icon.setFill(Color.valueOf("#999999"));
    transition.play();
  }

  private void setValidator(TextField textField, final FontIcon icon, Supplier<Boolean> check) {
    final RotateTransition transition = new RotateTransition(Duration.seconds(1), icon);
    transition.setByAngle(360);
    transition.setCycleCount(RotateTransition.INDEFINITE);
    transition.setInterpolator(Interpolator.LINEAR);
    transition.setAutoReverse(false);

    Timeline timeline = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
      boolean valid = check.get();
      transition.stop();
      icon.setRotate(0);
      if (valid) {
        icon.setIconCode(Feather.CHECK_CIRCLE);
        icon.setFill(Color.valueOf("#0e8d00"));
      } else {
        icon.setIconCode(Feather.ALERT_TRIANGLE);
        icon.setFill(Color.RED);
      }
    }));
    timeline.setCycleCount(1);
    textField.textProperty().addListener((observable, oldValue, newValue) -> {
      icon.setVisible(!newValue.trim().isEmpty());
      setIconAwaiting(icon, transition);
      timeline.playFromStart();
    });
  }

  @FXML
  private void initialize() {
    setValidator(useridField, useridValidity, this::checkUserid);
    setValidator(emailField, emailValidity, this::checkEmail);
  }


  private boolean checkRequired(TextField t, Label label, Pattern usePattern) {
    String description = label.getText();
    String value = t.getText().trim();
    if (value.isEmpty()) {
      requireFieldAgain(description + " is required", "Check " + description + " again.", t);
      return false;
    }
    if (usePattern != null) {
      if (!usePattern.matcher(value).matches()) {
        requireFieldAgain(description + " has invalid format.", "Check " + description + " again.", t);
        return false;
      }
    }
    return true;
  }

  private boolean checkPasswordConfirm() {
    if (!passwordField.getText().equals(passwordConfirmField.getText())) {
      Alert alert = new Alert(Alert.AlertType.ERROR);
      alert.setTitle("Error");
      alert.setHeaderText("Password confirm does not match");
      alert.setContentText("Check password confirmation again.");
      alert.showAndWait();
      passwordField.requestFocus();
      return false;
    }
    return true;
  }

  private boolean checkUserid() {
    String input = useridField.getText().trim();
    if (input.isEmpty()) return false;

    String found = userDAO.selectUserid(input);
    return found == null;
  }

  private boolean checkEmail() {
    String input = emailField.getText().trim();
    if (input.isEmpty()) return false;
    if (!User.EMAIL_PATTERN.matcher(input).matches()) return false;

    String found = userDAO.selectEmail(input);
    return found == null;
  }


  @FXML
  protected void onSignupButton() {
    if (!checkRequired(emailField, emailLabel, User.EMAIL_PATTERN)) return;
    if (!checkRequired(useridField, useridLabel, null)) return;
    if (!checkRequired(passwordField, passwordLabel, null)) return;
    if (!checkPasswordConfirm()) return;
    if (!checkRequired(exprNameField, exprNameLabel, null)) return;
    int userType = usePersonal.isSelected() ? 1 : useEmployer.isSelected() ? 2 : 0;
    User user = new User(
      useridField.getText().trim(),
      emailField.getText().trim(),
      passwordField.getText(),
      exprNameField.getText().trim(),
      userType);
    try {
      int result = userDAO.insertUser(user);
      if (result > 0) {
        alert(Alert.AlertType.INFORMATION, "Signup", "Welcome, " + user.getExprname() + "!", "You can use the entire service right now.");
        Stage stage = (Stage) useridField.getScene().getWindow();
        stage.close();
      } else {
        alert(Alert.AlertType.ERROR, "Signup Error", "Sorry, something went wrong.", "Please contact to developer.");
      }
    } catch (PersistenceException pex) {
      Throwable cause = pex.getCause();
      if (cause instanceof SQLException sex) {
        sex.printStackTrace();
        int errorCode = sex.getErrorCode();
        String sqlState = sex.getSQLState();

        alert(Alert.AlertType.ERROR, "Signup Error ("+ sqlState +")", "There's an error while signing up",
          "Caused by:\n" + sex.getMessage());
      } else {
        alert(Alert.AlertType.ERROR, "Signup Error", "There's an error while signing up", pex.getMessage());
      }
    }
  }
}
