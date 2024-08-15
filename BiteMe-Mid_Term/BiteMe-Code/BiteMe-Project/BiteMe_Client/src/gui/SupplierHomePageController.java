package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ChatClient;
import client.ClientUI;
import javafx.animation.FadeTransition;
import javafx.animation.SequentialTransition;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.util.Duration;
import logic.Message;
import logic.MessageType;

/**
 * Controller for the Supplier Home Page in the application. This class manages
 * the interactions on the supplier's home page, including updating the menu,
 * managing orders, and logging out.
 * 
 * @version 5.0
 * @authors Amal, Adam, Abed, Heba, Bashar, Mohammed
 */
public class SupplierHomePageController implements IControl, Initializable {

	/**
	 * Button that allows the supplier to update the menu.
	 */
	@FXML
	private Button btnUpdateMenu;

	/**
	 * Button that allows the supplier to view and manage orders.
	 */
	@FXML
	private Button btnUpdateOrders;

	/**
	 * Button that logs out the supplier and returns to the login page.
	 */
	@FXML
	private Button btnLogout;

	/**
	 * Label that displays a greeting message to the supplier.
	 */
	@FXML
	public Label lblHello;
	private static double lastNotificationPosition = 10.0;
	/**
	 * Image view displaying the supplier's profile image.
	 */
	@FXML
	private ImageView imageUserimg;

	/**
	 * Handles the action of navigating to the Supplier Orders Page.
	 * 
	 * @param event The event triggered by the user's action.
	 * @throws Exception If there is an error during the navigation process.
	 */
	public void UpdateOrdersBtn(ActionEvent event) throws Exception {
		SupplierOrdersPageController soc = new SupplierOrdersPageController();
		((Node) event.getSource()).getScene().getWindow().hide(); // hiding primary window
		soc.start(new Stage());
	}

	/**
	 * Starts the SupplierHomePageController and sets up the user interface.
	 * 
	 * @param primaryStage The primary stage for this application.
	 * @throws Exception If there is an error during the initialization of the
	 *                   stage.
	 */
	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("/gui/SupplierHomePage.fxml"));
		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("/gui/SupplierHome.css").toExternalForm());
		primaryStage.setTitle("Supplier Home Page");
		primaryStage.setScene(scene);
        // Prevent the window from closing by clicking the X button
        primaryStage.setOnCloseRequest(event -> {
            // Consume the event to prevent window closing
            event.consume();
        });
        // Make the window non-resizable
        primaryStage.setResizable(false);
		primaryStage.show();
	}

	/**
	 * Handles the action of logging out and navigating back to the login page.
	 * Sends a user disconnect message to the server.
	 * 
	 * @param event The event triggered by the user's action.
	 * @throws Exception If there is an error during the logout process.
	 */
	@Override
	public void getBackBtn(ActionEvent event) throws Exception {
		ArrayList<Object> msgObjectList = new ArrayList<>();
		msgObjectList.add(ChatClient.currUser);
		msgObjectList.add(0);
		Message msg = new Message(MessageType.UserDisconnect, msgObjectList);
		ClientUI.chat.accept(msg);
		ChatClient.currUser = null;
		ChatClient.userOrders = null;
		ChatClient.lastAction = "";
		ChatClient.userResturants = null;
		ChatClient.selectedResturant = null;
		ChatClient.menuItems = null;
		ChatClient.userCart = null;
		ChatClient.newOrder = null;
		ChatClient.items = null;
		ChatClient.currController = null;
		ChatClient.currentOrderItem = null;
		ChatClient.orderMeals = null;
		ChatClient.discountsApplied = null;
		ChatClient.deliveryCost = 0;
		ChatClient.branchReports = null;
		ChatClient.incomeReport = null;
		ChatClient.firstquarterReport = null;
		ChatClient.secondquarterReport = null;
		ChatClient.performanceReport = null;
		ChatClient.orderReport = null;
		ChatClient.yearMonth = null;
		ChatClient.awaitResponse = false;
		ChatClient.currBranchReports = null;
		ChatClient.lastDataFetchMonth = 0;
		ChatClient.lastDataFetchMonthQuarter = 0;
		ChatClient.branchQuarterReports = null;
		((Node) event.getSource()).getScene().getWindow().hide(); // hiding primary window
		LoginController lc = new LoginController();
		lc.start(new Stage());
	}

	/**
	 * Handles the action of navigating to the Update Menu page.
	 * 
	 * @param event The event triggered by the user's action.
	 * @throws Exception If there is an error during the navigation process.
	 */
	public void UpdateMenuBtn(ActionEvent event) throws Exception {
		UpdateMenuController umc = new UpdateMenuController();
		((Node) event.getSource()).getScene().getWindow().hide(); // hiding primary window
		umc.start(new Stage());
	}

	/**
	 * Displays an alert with the specified title and message.
	 * 
	 * @param title   The title of the alert.
	 * @param message The message to be displayed in the alert.
	 */
	public void showAlert(String title, String message) {
		Alert alert = new Alert(Alert.AlertType.INFORMATION);
		alert.setTitle(title);
		alert.setHeaderText(null);
		alert.setContentText(message);
		alert.showAndWait();
	}

	/**
	 * Initializes the controller after its root element has been completely
	 * processed. Sets the greeting label with the current user's first name.
	 * 
	 * @param location  The location used to resolve relative paths for the root
	 *                  object, or null if the location is not known.
	 * @param resources The resources used to localize the root object, or null if
	 *                  the root object was not localized.
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ChatClient.currController = this;
		lblHello.setText("Hello " + ChatClient.currUser.getFirstName());
	}

	public void showNotification(String message, Node anyNodeInScene) {
		Label toastLabel = new Label(message);
		toastLabel.setStyle("-fx-background-color: #f5f5f5; -fx-text-fill: black; -fx-padding: 10px; "
				+ "-fx-border-color: black; -fx-border-width: 1px; -fx-border-radius: 5px; "
				+ "-fx-background-radius: 5px; -fx-font-size: 14px; -fx-font-weight: bold;");

		// Get the current stage from the node
		Stage currentStage = (Stage) anyNodeInScene.getScene().getWindow();
		AnchorPane rootPane = (AnchorPane) currentStage.getScene().getRoot();
		rootPane.getChildren().add(toastLabel);

		// Set the position of the label to the top-right corner, stacking vertically
		AnchorPane.setTopAnchor(toastLabel, lastNotificationPosition);
		AnchorPane.setRightAnchor(toastLabel, 10.0); // Align to the right

		// Create fade-in and fade-out animations
		FadeTransition fadeIn = new FadeTransition(Duration.seconds(0.5), toastLabel);
		fadeIn.setFromValue(0.0);
		fadeIn.setToValue(1.0);

		FadeTransition fadeOut = new FadeTransition(Duration.seconds(0.5), toastLabel);
		fadeOut.setFromValue(1.0);
		fadeOut.setToValue(0.0);
		fadeOut.setDelay(Duration.seconds(3)); // Show for 3 seconds

		// Play the animations sequentially
		SequentialTransition toastAnimation = new SequentialTransition(fadeIn, fadeOut);
		toastAnimation.setOnFinished(e -> {
			rootPane.getChildren().remove(toastLabel);
			// Adjust last notification position when a notification disappears
			lastNotificationPosition -= 40; // Assume each notification takes up 40px height
		});
		toastAnimation.play();

		// Update the position for the next notification
		lastNotificationPosition += 40; // Stack the next notification below the current one
	}

}
