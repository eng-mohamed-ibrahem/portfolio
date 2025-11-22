# Refactoring Plan: Portfolio Application

This document outlines the step-by-step plan to refactor the portfolio application to use an MVVM architecture with Clean Architecture principles, dynamic data from Firebase Firestore, and a responsive UI.

## 1. Project Setup & Dependencies

- [ ] Add `cloud_firestore` and `firebase_core` to `pubspec.yaml`.
- [ ] Configure Firebase in `main.dart`.
- [ ] Create a `failures.dart` file in `lib/core/error` to handle errors.
- [ ] Create a `usecase.dart` file in `lib/core/usecases` to define a base use case.

## 2. Feature: `home`

- [ ] **Domain Layer:**
    - [ ] Create `home_entity.dart` in `lib/features/home/domain/entities`.
    - [ ] Create `home_repository.dart` (abstract) in `lib/features/home/domain/repositories`.
    - [ ] Create `get_home_data.dart` use case in `lib/features/home/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `home_model.dart` in `lib/features/home/data/models`.
    - [ ] Create `home_remote_data_source.dart` in `lib/features/home/data/datasources`.
    - [ ] Create `home_repository_impl.dart` in `lib/features/home/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `home_cubit.dart` and `home_state.dart` in `lib/features/home/presentation/cubit`.
    - [ ] Refactor `home_view.dart` to use the `HomeCubit` and display dynamic data.

## 3. Feature: `experience`

- [ ] **Domain Layer:**
    - [ ] Create `experience_entity.dart` in `lib/features/experience/domain/entities`.
    - [ ] Create `experience_repository.dart` (abstract) in `lib/features/experience/domain/repositories`.
    - [ ] Create `get_experience.dart` use case in `lib/features/experience/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `experience_model.dart` in `lib/features/experience/data/models`.
    - [ ] Create `experience_remote_data_source.dart` in `lib/features/experience/data/datasources`.
    - [ ] Create `experience_repository_impl.dart` in `lib/features/experience/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `experience_cubit.dart` and `experience_state.dart` in `lib/features/experience/presentation/cubit`.
    - [ ] Refactor `experience_view.dart` to use the `ExperienceCubit` and display dynamic data.

## 4. Feature: `projects`

- [ ] **Domain Layer:**
    - [ ] Create `project_entity.dart` in `lib/features/projects/domain/entities`.
    - [ ] Create `project_repository.dart` (abstract) in `lib/features/projects/domain/repositories`.
    - [ ] Create `get_projects.dart` use case in `lib/features/projects/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `project_model.dart` in `lib/features/projects/data/models`.
    - [ ] Create `project_remote_data_source.dart` in `lib/features/projects/data/datasources`.
    - [ ] Create `project_repository_impl.dart` in `lib/features/projects/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `projects_cubit.dart` and `projects_state.dart` in `lib/features/projects/presentation/cubit`.
    - [ ] Create `projects_view.dart` to display the projects from Firebase.

## 5. Feature: `skills`

- [ ] **Domain Layer:**
    - [ ] Create `skill_entity.dart` in `lib/features/skills/domain/entities`.
    - [ ] Create `skill_repository.dart` (abstract) in `lib/features/skills/domain/repositories`.
    - [ ] Create `get_skills.dart` use case in `lib/features/skills/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `skill_model.dart` in `lib/features/skills/data/models`.
    - [ ] Create `skill_remote_data_source.dart` in `lib/features/skills/data/datasources`.
    - [ ] Create `skill_repository_impl.dart` in `lib/features/skills/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `skills_cubit.dart` and `skills_state.dart` in `lib/features/skills/presentation/cubit`.
    - [ ] Refactor `skills_view.dart` to use the `SkillsCubit` and display dynamic data.

## 6. Feature: `works`

- [ ] **Domain Layer:**
    - [ ] Create `work_entity.dart` in `lib/features/works/domain/entities`.
    - [ ] Create `work_repository.dart` (abstract) in `lib/features/works/domain/repositories`.
    - [ ] Create `get_works.dart` use case in `lib/features/works/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `work_model.dart` in `lib/features/works/data/models`.
    - [ ] Create `work_remote_data_source.dart` in `lib/features/works/data/datasources`.
    - [ ] Create `work_repository_impl.dart` in `lib/features/works/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `works_cubit.dart` and `works_state.dart` in `lib/features/works/presentation/cubit`.
    - [ ] Create `works_view.dart` to display the works from Firebase.

## 7. Feature: `resume`

- [ ] **Domain Layer:**
    - [ ] Create `resume_entity.dart` in `lib/features/resume/domain/entities`.
    - [ ] Create `resume_repository.dart` (abstract) in `lib/features/resume/domain/repositories`.
    - [ ] Create `get_resume_url.dart` use case in `lib/features/resume/domain/usecases`.
- [ ] **Data Layer:**
    - [ ] Create `resume_model.dart` in `lib/features/resume/data/models`.
    - [ ] Create `resume_remote_data_source.dart` in `lib/features/resume/data/datasources`.
    - [ ] Create `resume_repository_impl.dart` in `lib/features/resume/data/repositories`.
- [ ] **Presentation Layer:**
    - [ ] Create `resume_cubit.dart` and `resume_state.dart` in `lib/features/resume/presentation/cubit`.
    - [ ] Update the UI to use the `ResumeCubit` to get the resume URL from Firebase.

## 8. Dependency Injection

- [ ] Update `setup_dependencies.dart` to register all the new repositories, use cases, and Cubits.

## 9. UI & Responsiveness

- [ ] Create new widgets for displaying projects and works.
- [ ] Ensure all new and existing widgets are responsive across mobile, tablet, and web.
- [ ] Identify and extract reusable widgets.

## 10. Finalization

- [ ] Test the application thoroughly.
- [ ] Remove any unused files or code.
- [ ] Update the `README.md` file if necessary.
