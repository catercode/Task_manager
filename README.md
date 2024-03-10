# Task_manager
**Task Manager App Documentation**

---

**Introduction:**

This application is built using Flutter, with a clean architecture pattern and BLoC (Business Logic Component) state management approach. This documentation will guide you through the architecture, features, and usage of the app.

---

**Features:**

1. **Task Management:**
   - Add, fetching, and delete tasks.

2. **Clean Architecture:**
   - The app follows the principles of clean architecture, separating concerns into different layers: domain, data, and presentation.
   - This ensures a clear separation of business logic from UI and external dependencies, making the app more maintainable and testable.

3. **BLoC State Management:**
   - BLoC pattern is used for state management, separating UI components from business logic.
   - This helps in managing the state of the application efficiently and provides a scalable solution for complex applications.

---

**Architecture Overview:**

The app is structured using the following layers:

1. **Application Layer:**
   - Communicates with BLoCs to fetch data and manage state.

2. **Presentation Layer:**
   - Contains UI components such as widgets, screens, and UI-specific logic.

2. **Infrastructure Layer:**
   - Contains interfaces with external data sources such as APIs,models, databases, or local storage.


3. **Data Layer:**
   - Handles data retrieval and persistence.
   - Interfaces with external data sources such as APIs, databases, or local storage.

---

**Components:**

1. **Tasks BLoC:**
   - Manages state related to tasks, including fetching, adding, updating, and deleting tasks.
   - Communicates with the data layer to retrieve and persist task data.

2. **Task Repository:**
   - Provides an interface for accessing task data.
   - Implements methods for CRUD operations on tasks, abstracting the data source details.

3. **Database Provider:**
   - Handles database operations, such as reading from and writing to a local database.
   - Implements methods for CRUD operations specific to the database.

4. **Task Model:**
   - Represents the structure of a task, including properties like title, description, priority, due date, and status.

---

**Usage:**

1. **Getting Started:**
   - Clone the repository from GitHub.
   - Ensure you have Flutter SDK installed.
   - Run `flutter pub get` to install dependencies.
   - Run the app on an emulator or physical device using `flutter run`.

2. **Adding Tasks:**
   - Navigate to the "Add Task" screen.
   - Enter task details such as title, description, priority, and due date.
   - Tap the "Save" button to add the task.

3. **Editing Tasks:**
   - Navigate to the "Edit Task" screen by tapping on a task.
   - Update task details as required.
   - Tap the "Save" button to apply changes.

4. **Deleting Tasks:**
   - Swipe left on a task in the task list.
   - Tap the delete icon to remove the task.

5. **Marking Tasks as Completed:**
   - Tap on a task in the task list to toggle its completion status.

6. **Filtering and Sorting Tasks:**
   - Use the filter and sort options provided in the app to organize tasks based on completion status, priority, or due date.

---

**Conclusion:**

Our Task Manager App provides a clean and efficient solution for managing tasks using Flutter, with a focus on clean architecture and BLoC state management. We hope this documentation helps you understand the architecture, features, and usage of the app. If you have any questions or feedback, feel free to reach out to us!

Happy task managing!

---

*Note: This documentation provides a high-level overview of the app's architecture, features, and usage. For detailed implementation details, please refer to the source code and comments within the project.*
