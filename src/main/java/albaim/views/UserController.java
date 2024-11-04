package albaim.views;

import albaim.User;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Hyperlink;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

import java.io.IOException;

public class UserController {

  @FXML
  private Pane container;

  @FXML
  private Hyperlink hSearch;
  @FXML
  private Hyperlink hSuggestion;
  @FXML
  private Hyperlink hPeerApplicant;
  @FXML
  private Hyperlink hOpening;
  @FXML
  private Hyperlink hWorkplaces;
  @FXML
  private Hyperlink hEmployerApplicants;
  @FXML
  private Hyperlink hSetting;
  @FXML
  private Hyperlink hLogout;

  private User currentUser;

  @FXML
  public void initialize() {

  }

  private void loadView(String view) {
    try {
      container.getChildren().clear();
      FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(view));
      Parent parent = fxmlLoader.load();
      container.getChildren().add(parent);
    } catch (Exception e) {
      System.err.println(e.getMessage());
      System.err.println("View " + view + " not found.");
    }

  }

  public void handleHLogout () throws IOException {
    ((Stage) hLogout.getScene().getWindow()).close();
    IndexController.openIndex(new Stage());
  }

  public void setCurrentUser(User currentUser) {
    this.currentUser = currentUser;
  }

  @FXML
  public void aSearch() {
    loadView("user/search-view.fxml");
  }

  @FXML
  public void aSuggestion() {
    loadView("user/suggest-view.fxml");
  }

  @FXML
  public void aPeerApplicant() {
    loadView("user/peer-apply-view.fxml");
  }

  @FXML
  public void aOpening() {
    loadView("user/opening-view.fxml");
  }

  @FXML
  public void aWorkplaces() {
    loadView("user/workplaces-view.fxml");
  }

  @FXML
  public void aEmployerApplicants() {
    loadView("user/employ-apply-view.fxml");
  }

  @FXML
  public void aSetting() {
    loadView("user/setting-view.fxml");
  }
}
