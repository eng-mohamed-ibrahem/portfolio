# TODO: Portfolio Application Refactoring

This file breaks down the refactoring plan into a detailed set of tasks.

## 1. Project Setup & Dependencies `[setup]`

- [x] Add `cloud_firestore` and `firebase_core` to `pubspec.yaml`.
- [x] Configure Firebase in `main.dart`.
- [x] Create `lib/core/error/failures.dart` to handle different types of failures.
- [x] Create `lib/core/usecases/usecase.dart` to define a base use case class.

## 2. Feature Development (Parallelizable) `[feature-development]`

### Feature: `home` `[home]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/home/domain/entities/home_entity.dart`.
  - [x] Create `lib/features/home/domain/repositories/home_repository.dart` (abstract).
  - [x] Create `lib/features/home/domain/usecases/get_home_data.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/home/data/models/home_model.dart`.
  - [x] Create `lib/features/home/data/datasources/home_remote_data_source.dart`.
  - [x] Create `lib/features/home/data/repositories/home_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/home/presentation/cubit/home_cubit.dart` and `home_state.dart`.
  - [x] Refactor `lib/features/home/view/home_view.dart` to use `HomeCubit`.

### Feature: `experience` `[experience]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/experience/domain/entities/experience_entity.dart`.
  - [x] Create `lib/features/experience/domain/repositories/experience_repository.dart` (abstract).
  - [x] Create `lib/features/experience/domain/usecases/get_experience.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/experience/data/models/experience_model.dart`.
  - [x] Create `lib/features/experience/data/datasources/experience_remote_data_source.dart`.
  - [x] Create `lib/features/experience/data/repositories/experience_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/experience/presentation/cubit/experience_cubit.dart` and `experience_state.dart`.
  - [x] Refactor `lib/features/experience/view/experience_view.dart` to use `ExperienceCubit`.

### Feature: `projects` `[projects]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/projects/domain/entities/project_entity.dart`.
  - [x] Create `lib/features/projects/domain/repositories/project_repository.dart` (abstract).
  - [x] Create `lib/features/projects/domain/usecases/get_projects.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/projects/data/models/project_model.dart`.
  - [x] Create `lib/features/projects/data/datasources/project_remote_data_source.dart`.
  - [x] Create `lib/features/projects/data/repositories/project_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/projects/presentation/cubit/projects_cubit.dart` and `projects_state.dart`.
  - [x] Create `lib/features/projects/view/projects_view.dart`.

### Feature: `skills` `[skills]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/skills/domain/entities/skill_entity.dart`.
  - [x] Create `lib/features/skills/domain/repositories/skill_repository.dart` (abstract).
  - [x] Create `lib/features/skills/domain/usecases/get_skills.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/skills/data/models/skill_model.dart`.
  - [x] Create `lib/features/skills/data/datasources/skill_remote_data_source.dart`.
  - [x] Create `lib/features/skills/data/repositories/skill_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/skills/presentation/cubit/skills_cubit.dart` and `skills_state.dart`.
  - [x] Refactor `lib/features/skills/view/skills_view.dart` to use `SkillsCubit`.

### Feature: `works` `[works]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/works/domain/entities/work_entity.dart`.
  - [x] Create `lib/features/works/domain/repositories/work_repository.dart` (abstract).
  - [x] Create `lib/features/works/domain/usecases/get_works.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/works/data/models/work_model.dart`.
  - [x] Create `lib/features/works/data/datasources/work_remote_data_source.dart`.
  - [x] Create `lib/features/works/data/repositories/work_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/works/presentation/cubit/works_cubit.dart` and `works_state.dart`.
  - [x] Create `lib/features/works/view/works_view.dart`.

### Feature: `resume` `[resume]`

- [x] **Domain Layer:** `[domain]`
  - [x] Create `lib/features/resume/domain/entities/resume_entity.dart`.
  - [x] Create `lib/features/resume/domain/repositories/resume_repository.dart` (abstract).
  - [x] Create `lib/features/resume/domain/usecases/get_resume_url.dart`.
- [x] **Data Layer:** `[data]`
  - [x] Create `lib/features/resume/data/models/resume_model.dart`.
  - [x] Create `lib/features/resume/data/datasources/resume_remote_data_source.dart`.
  - [x] Create `lib/features/resume/data/repositories/resume_repository_impl.dart`.
- [x] **Presentation Layer:** `[presentation]`
  - [x] Create `lib/features/resume/presentation/cubit/resume_cubit.dart` and `resume_state.dart`.
  - [x] Update UI to use `ResumeCubit` to get the resume URL.

## 3. Dependency Injection `[DI]`

- [x] Update `lib/core/serivce_locator/setup_dependencies.dart` to register all new repositories, use cases, and Cubits.

## 4. UI & Responsiveness `[UI]`

- [x] Create new widgets for displaying projects and works.
- [x] Ensure all new and existing widgets are responsive.
- [x] Identify and extract reusable widgets.

## 5. Finalization `[finalization]`

- [ ] **Testing:** `[test]`
  - [ ] Write unit tests for ViewModels (Cubits).
  - [ ] Write unit tests for use cases.
  - [ ] Write widget tests for new UI components.
- [ ] Remove any unused files or code.
- [ ] Update `README.md` if necessary.
