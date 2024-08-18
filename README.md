---

# Task Management App

Create a visually appealing and intuitive task management app that showcases your UI/UX
design skills, mobile development proficiency, and attention to detail. You are allowed and
encouraged to use AI to write code, just remember that you’ll be judged by the code you
submitted.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Design Decisions and Rationale](#design-decisions-and-rationale)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)

## Features

- Add, edit, and delete tasks and subtasks.
- Mark tasks and subtasks as completed.
- A visually appealing way to represent task priorities (e.g., color coding, icons).
- Custom calendar view for task due dates.
- Implement task categorization (work, personal, etc.).
- The ability to set reminders for tasks.
- Dashboard view showing task statistics (e.g., completed vs. pending tasks).
- Implement data for persistent storage using `UserDefaults` (or an alternative if implemented).
- Add haptic feedback for user interactions.
- A visually appealing onboarding experience for first-time users.
- Implement drag-and-drop functionality for reordering tasks.
- Expandable/collapsible UI for subtasks in the task detail view.
## Getting Started

### Prerequisites

- Xcode 12.0 or later
- iOS 14.0 or later
- Swift 5.3 or later

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/tainguyen07/Task-SwiftUI
   cd dreamerly
   ```
2. Open the project in Xcode:
   ```bash
   open dreamerly.xcodeproj
   ```
3. Build and run the project on your simulator or device.

## Usage

1. Launch the app.
2. Add new tasks using the "+" button.
3. View and manage subtasks by selecting a task and navigating to the task detail view.
4. Expand or collapse subtasks using the chevron icon in the task detail view.
5. Ensure that all tasks and subtasks have titles before saving.
6. Set reminder with notifications.

## Design Decisions and Rationale

### Use of SwiftUI

SwiftUI was chosen for this project to leverage its modern declarative syntax and powerful data-binding capabilities. The framework simplifies UI development by allowing the creation of reactive user interfaces with less boilerplate code compared to UIKit.

### Task and Subtask Model

The decision to use a hierarchical model of `Task` and `Subtask` ensures that the app can handle complex task structures. This approach allows users to manage tasks at both macro and micro levels, making the app more versatile for different use cases.

### Expandable/Collapsible Subtasks

Implementing expandable/collapsible subtasks in the `TaskDetailView` enhances user experience by providing a cleaner interface. Users can focus on specific tasks and expand them only when necessary, reducing cognitive overload.

### Persistence Using UserDefaults

`UserDefaults` was chosen for simplicity and because the app's data requirements are modest. For a lightweight task management app, `UserDefaults` provides sufficient persistence capabilities without introducing the complexity of more robust solutions like Core Data.

### Notifications and Reminders

Integrating local notifications would help users keep track of deadlines and important tasks.

## Future Improvements

### Core Data Integration

If given more time, I would integrate Core Data to replace `UserDefaults`. This would allow the app to handle more complex data relationships and larger datasets, while also providing better performance and scalability.

### Enhanced UI/UX

I would improve the UI/UX by adding more animations and transitions, especially in the task list and detail views. For example, implementing a drag-and-drop interface for reordering tasks would enhance usability.

### Cross-Platform Support

Expanding the app to support macOS and iPadOS would make it more versatile and accessible across different devices. SwiftUI's cross-platform capabilities make this a feasible improvement.

### Collaboration Features

Adding support for task sharing and collaboration would make the app suitable for team-based projects. This would involve integrating a backend service to manage user accounts and shared task lists.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Be sure to follow the project's coding standards and include appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify the content to better fit your specific project and any additional details you may want to include.
