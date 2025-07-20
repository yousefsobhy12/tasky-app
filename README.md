# Tasky 📝

**Tasky** is a work-in-progress task management app that helps users organize their daily tasks efficiently. The app allows you to create tasks, assign due dates, set priority levels, and manage your to-do list with ease.

> ⚠️ This project is currently under active development.

## 🚀 Planned Features

- Add, edit, and delete tasks
- Set due dates for tasks
- Assign priority levels (e.g., High, Medium, Low)
- User-specific task management using Firebase Authentication
- Sync tasks to Firebase Firestore
- Offline task storage using a local database
- Clean and scalable architecture using BLoC state management

## 📁 Project Structure

The project follows a layered and modular architecture:
lib/
├── core/ # Common utilities, constants, etc.
├── features/ # Feature-specific logic (e.g., tasks)
├── data/ # Data sources, auth, and models


This separation promotes clean code and better scalability.

## 🛠️ Tech Stack

- **Flutter** – UI Toolkit
- **Firebase** – Auth & Firestore for backend
- **Local Database** – For offline task storage (e.g., Hive or SQFLite)
- **BLoC** – For predictable and scalable state management
