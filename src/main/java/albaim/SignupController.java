package albaim;

import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.RotateTransition;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import org.kordamp.ikonli.feather.Feather;
import org.kordamp.ikonli.javafx.FontIcon;


public class SignupController {

  private boolean validUsername;


  private UserDAO userDAO = new UserDAO();

  @FXML
  private Label emailLabel;

  @FXML
  private Label usernameLabel;

  @FXML
  private Label passwordLabel;

  @FXML
  private Label exprNameLabel;

  @FXML
  private TextField emailField;

  @FXML
  private TextField usernameField;

  @FXML
  private PasswordField passwordField;

  @FXML
  private PasswordField passwordConfirmField;

  @FXML
  private TextField exprNameField;

  @FXML
  private RadioButton usePersonal, useEmployer;

  @FXML
  private FontIcon usernameValidity;

  private RotateTransition spinValidity;
  private Timeline usernameCheckTimeline;

  private void awaiting() {
//    usernameValidity.setVisible(true);
    usernameValidity.setIconCode(Feather.LOADER);
    usernameValidity.setFill(Color.valueOf("#999999"));
    spinValidity.play();
  }

  @FXML
  private void initialize() {
    spinValidity = new RotateTransition(Duration.seconds(1), usernameValidity);
    spinValidity.setByAngle(360);
    spinValidity.setCycleCount(RotateTransition.INDEFINITE);
    spinValidity.setInterpolator(Interpolator.LINEAR);
    spinValidity.setAutoReverse(false);

    usernameCheckTimeline = new Timeline(new KeyFrame(Duration.seconds(1), this::checkUsername));
    usernameCheckTimeline.setCycleCount(1);
    usernameField.textProperty().addListener((observable, oldValue, newValue) -> {
      usernameValidity.setVisible(!newValue.trim().isEmpty());
      awaiting();
      usernameCheckTimeline.playFromStart();
    });
  }



  private boolean checkRequired(TextField t, Label label) {
    String description = label.getText();
    if (t.getText().trim().isEmpty()) {
      Alert alert = new Alert(Alert.AlertType.ERROR);
      alert.setTitle("Error");
      alert.setHeaderText(description + " is required");
      alert.setContentText("Check " + description + " again.");
      alert.showAndWait();
      t.requestFocus();
      return false;
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

  private void checkUsername(ActionEvent actionEvent) {
    String input = usernameField.getText().trim();
    if (input.isEmpty()) return;

    String found = userDAO.selectUsername(usernameField.getText());
    boolean b = found == null;
    usernameValidity.setVisible(true);
    spinValidity.stop();
    usernameValidity.setRotate(0);
    if (b) {
//      usernameValidatorLabel.setText('"' + input + "\" is valid for username.");
      usernameValidity.setIconCode(Feather.CHECK_CIRCLE);
      usernameValidity.setFill(Color.valueOf("#0e8d00"));
    } else {
      usernameValidity.setIconCode(Feather.ALERT_TRIANGLE);
      usernameValidity.setFill(Color.RED);

//      usernameValidatorLabel.setText('"' + input + "\" is already in use. Choose other username.");
    }
  }

  @FXML
  protected void usernameAction() {
    System.out.println(usernameField.getText());
  }

  @FXML
  protected void onSignupButton() {
    if (!checkRequired(emailField, emailLabel)) return;
    if (!checkRequired(usernameField, usernameLabel)) return;
    if (!checkRequired(passwordField, passwordLabel)) return;
    if (!checkPasswordConfirm()) return;
    if (!checkRequired(exprNameField, exprNameLabel)) return;
    int userType = usePersonal.isSelected() ? 1 : useEmployer.isSelected() ? 2 : 0;
    User user = new User(usernameField.getText(), emailField.getText(), passwordField.getText(), exprNameField.getText(), userType, null);
  }
}
