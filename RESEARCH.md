
# Research for Refactoring the Portfolio Application

This document outlines the research and plan for refactoring the portfolio application to use the MVVM architecture pattern with clean code principles, responsive screen sizes, reusable widgets, and dynamic data from Firebase Firestore.

## 1. Target Architecture: MVVM with Clean Architecture

The application will be refactored to follow the principles of Clean Architecture with the MVVM pattern in the presentation layer.

### Layers

*   **Presentation Layer (MVVM):**
    *   **View:** Flutter Widgets that display the UI. They will be as "dumb" as possible, only reacting to state changes from the ViewModel.
    *   **ViewModel:** `Bloc` or `Cubit` from the `flutter_bloc` package will serve as the ViewModel. It will manage the UI state, handle user input, and interact with the domain layer through use cases.
    *   **State:** The state of the `Bloc` or `Cubit` will represent the state of the UI (e.g., loading, success, error, and the data to be displayed).

*   **Domain Layer:**
    *   **Use Cases:** These classes will contain the core business logic of the application (e.g., `GetProjectsUseCase`, `GetResumeUrlUseCase`). They will be called by the ViewModels.
    *   **Repositories (Abstract):** Abstract classes that define the contract for the data layer (e.g., `ProjectRepository`). This will allow us to switch the data source without changing the domain layer.
    *   **Entities:** Plain Dart objects that represent the core data of the application (e.g., `Project`, `Work`).

*   **Data Layer:**
    *   **Repositories (Implementation):** Concrete implementations of the repository interfaces defined in the domain layer. They will be responsible for fetching data from the appropriate data sources.
    *   **Data Sources:**
        *   **Remote Data Source:** This will be responsible for fetching data from Firebase Firestore.
        *   **Local Data Source (Optional):** This could be implemented in the future for caching data locally.
    *   **Models:** Data Transfer Objects (DTOs) that represent the data from Firestore. These models will include `fromJson` and `toJson` methods for serialization and deserialization.

### Folder Structure

The project will be organized by feature, and each feature will have the following structure:

```
lib/
├── features/
│   └── <feature_name>/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── <feature_name>_remote_data_source.dart
│       │   ├── models/
│       │   │   └── <feature_name>_model.dart
│       │   └── repositories/
│       │       └── <feature_name>_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── <feature_name>_entity.dart
│       │   ├── repositories/
│       │   │   └── <feature_name>_repository.dart (abstract)
│       │   └── usecases/
│       │       └── get_<feature_name>.dart
│       └── presentation/
│           ├── viewmodels/ (or cubits/ or blocs/)
│           │   └── <feature_name>_view_model.dart
│           ├── view/
│           │   └── <feature_name>_page.dart
│           └── widgets/
│               └── <feature_name>_widget.dart
```

## 2. Firebase Firestore Integration

The application will use Firebase Firestore as the backend to dynamically fetch projects, work experience, and the resume URL.

*   **Dependency:** The `cloud_firestore` package will be added to the `pubspec.yaml` file.
*   **Initialization:** Firebase will be initialized in the `main.dart` file.
*   **Data Modeling:**
    *   A `projects` collection will be created in Firestore to store project details.
    *   A `works` collection will be created to store work experience.
    *   A `resume` document will be created to store the URL of the resume PDF.
*   **Data Fetching:**
    *   A remote data source will be implemented using the `cloud_firestore` package to fetch the data.
    *   The data will be returned as `Stream`s to enable real-time updates in the UI.

## 3. Responsive UI

The application will be responsive and adapt to different screen sizes (mobile, tablet, and web).

*   The `flutter_screenutil` package, which is already in use, will be leveraged for scaling UI elements.
*   The `ResponsiveLayout` widget will be used to provide different layouts for different screen sizes.
*   `LayoutBuilder` and `MediaQuery` will be used for more complex responsive scenarios.

## 4. Reusable Widgets

To improve code maintainability and reduce duplication, common UI components will be identified and extracted into reusable widgets. This will be an ongoing process during the implementation phase.

## 5. High-Level Refactoring Plan

The refactoring process will be divided into the following steps:

1.  **Setup Firebase:** Add the `cloud_firestore` dependency to `pubspec.yaml` and configure Firebase in the project.
2.  **Create the Domain Layer:** Define the entities, use cases, and repository interfaces for each feature.
3.  **Create the Data Layer:** Implement the repositories and data sources for fetching data from Firebase Firestore.
4.  **Refactor the Presentation Layer:**
    *   Refactor each feature to use the MVVM pattern.
    *   Create ViewModels (`Cubits` or `Blocs`) for each feature to manage the state.
    *   Connect the Views to the ViewModels to display the data from Firestore.
5.  **Ensure Responsiveness:** Verify and improve the responsiveness of the UI across different screen sizes.
6.  **Extract Reusable Widgets:** Identify and create reusable widgets to simplify the UI code.
