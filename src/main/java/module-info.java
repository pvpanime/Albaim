module com.example.alba {
  requires javafx.controls;
  requires javafx.fxml;

  requires java.sql;

  requires org.kordamp.ikonli.javafx;
  requires org.kordamp.bootstrapfx.core;
  requires org.mybatis;
  requires org.kordamp.ikonli.feather;
  requires ojdbc8.g;

  exports albaim;
  opens albaim to javafx.fxml;
  exports albaim.views;
  opens albaim.views to javafx.fxml;
}