
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

2. **Domain Layer:**
   - Contains interface(Facade), failure, Constance function, app utils, and validators.
 
3. **Infrastructure Layer:**
   - Contains interfaces with external data sources such as models, databases, or local storage services.

4. **Presentation Layer:**
   - Contains UI components such as widgets, screens, and UI-specific logic.

---

**Components:**

1. **Tasks BLoC:**
   - Manages state related to tasks, including fetching, and deleting tasks.
   - Communicates with the infrastructure layer to retrieve and persist task data.

2. **Task Facade:**
   - Provides an interface for accessing task data.
   - Implements methods for CRUD operations on tasks, abstracting the data source details.

3. **Service Provider:**
   - Handles database operations, such as reading from and writing to a local database.
   - Implements methods for CRUD operations specific to the database.

4. **Task Model:**
   - Represents the structure of a task, including properties like title, description, priority, due date, and status.

---

**Usage:**

1. **Getting Started:**
   - Clone the repository from GitHub. #https://github.com/catercode/Task_manager.git
   - Ensure you have Flutter SDK installed.
   - Flutter Version 3.16.1
   - Run `flutter pub get` to install dependencies.
   - Run the app on an emulator or physical device using `flutter run`.

2. **Adding Tasks:**
   - Tap on the add button at the bottom of the screen.
   - Enter task details such as title, and description.
   - Tap the "Add Task" button to add the task.

3. **Deleting Tasks:**
   - Tap the delete icon on the task card in the task list.
   - Tap the delete icon to remove the task.


---

**Screen Shot**

**Empty State**

<img src="https://github.com/catercode/Task_manager/assets/47371898/494b554d-2e53-4943-87bc-1452f5eb7b01" alt="Image Description" width="300" height="600">

**Data State**

<img src="https://github.com/catercode/Task_manager/assets/47371898/4c9abce9-7450-432e-8c64-a258a3e36098" alt="Image Description" width="300" height="600">

**Add Task**

<img src="https://github.com/catercode/Task_manager/assets/47371898/e1f18c3a-2ebd-4750-9031-f112ad6dff00" alt="Image Description" width="300" height="600">

**Delete Task**

<img src="https://github.com/catercode/Task_manager/assets/47371898/c140f7a5-f83e-4003-a5f2-520ddec86a5f" alt="Image Description" width="300" height="600">



**Conclusion:**

Our Task Manager App provides a clean and efficient solution for managing tasks using Flutter, with a focus on clean architecture and BLoC state management. We hope this documentation helps you understand the architecture, features, and usage of the app. If you have any questions or feedback, feel free to reach out to us!

Happy task managing!

---

*Note: This documentation provides a high-level overview of the app's architecture, features, and usage. For detailed implementation details, please refer to the source code and comments within the project.*
