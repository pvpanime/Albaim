package albaim;

import albaim.views.IndexController;
import javafx.application.Application;
import javafx.stage.Stage;

import java.io.IOException;

public class AlbaApp extends Application {
  @Override
  public void start(Stage stage) throws IOException {
    IndexController.openIndex(stage);
  }

  public static void main(String[] args) {
    launch();
  }
}