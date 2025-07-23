# Checklist To-Do App

The **Checklist To-Do App** is a simple Flutter application that allows users to create, manage, and track tasks.
It uses **Bloc (Cubit) state management** for reactive UI updates and stores tasks locally with `SharedPreferences`, ensuring persistence even after restarting the app.

**Features:**
- ✅ View a list of tasks
- ✅ Add a new task
- ✅ Mark tasks as completed/uncompleted
- ✅ Clear all tasks
- ✅ Persistent local storage

This project follows a **modular folder structure** for scalability and maintainability.

---

## How to Run the App

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd checklist_to_do_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Select a device** (emulator or real device) and the app will start.

---

## How to Use the App

**View Tasks:** Launch the app to see your checklist

**Add Task:** Tap the "Add New Task" button to add a new task

**Complete Tasks:** Tap the checkbox next to any task to mark it complete

**Clear All:** Use the clear all button in the app bar to remove all tasks

---

## Dependencies

This app uses the following main packages:

| Package | Usage |
|---------|--------|
| **flutter_bloc** | State management (Cubit) for reactive UI updates |
| **shared_preferences** | Local storage for saving tasks |
| **flutter/material.dart** | Core Flutter UI widgets |

**pubspec.yaml extract:**
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1
  shared_preferences: ^2.5.3
```
