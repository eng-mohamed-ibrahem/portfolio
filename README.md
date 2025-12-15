# 🌟 Modern Flutter Web Portfolio

A stunning, responsive portfolio application built with Flutter Web featuring a premium **Glassmorphism** design theme. All content is dynamically loaded from Firebase Firestore, making it easy to update without rebuilding the app.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

### 🎨 Modern Glassmorphism Design

- **Frosted glass effect** backgrounds with blur
- **Semi-transparent cards** with soft glowing borders
- **Smooth gradients** and animations
- **Responsive layouts** for mobile, tablet, and desktop
- **Dark and light theme** support

### 📱 Responsive Sections

1. **Hero/About** - Introduction with profile image and bio
2. **Skills** - Visual skill cards with proficiency levels
3. **Experience** - Professional work history timeline
4. **Education** - Academic background with achievements
5. **Projects** - Portfolio showcase with images and links
6. **Contact** - Contact information and social media links

### 🔥 Firebase Integration

- All data loaded from **Firestore** (`resume/main` document)
- Real-time updates without app rebuild
- Secure and scalable backend
- Easy content management

### 🏗️ Clean Architecture

```dart
lib/
├── core/
│   ├── services/          # ResumeService for Firebase
│   ├── shared_widgets/    # Reusable UI components
│   ├── constants/         # App constants
│   └── utils/            # Utility functions
├── config/
│   └── themes/           # App themes and colors
├── features/
│   ├── portfolio/        # Main portfolio view
│   ├── education/        # Education section
│   ├── contact/          # Contact section
│   └── ...              # Other features
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.0 or higher)
- Firebase account
- Dart SDK

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/portfolio.git
   cd portfolio
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for your project
   flutterfire configure
   ```

4. **Set up Firestore data**
   - See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed instructions
   - Import sample data from `firestore_sample_data.json`
   - Or manually create your resume document at `resume/main`

5. **Run the app**

   ```bash
   # Run on web
   flutter run -d chrome
   
   # Run on other platforms
   flutter run
   ```

## 📊 Firestore Data Structure

All portfolio data is stored in a single Firestore document:

- **Collection**: `resume`
- **Document**: `main`

### Required Fields

```json
{
  "about": { "name": "...", "title": "...", "summary": "..." },
  "skills": [...],
  "experience": [...],
  "education": [...],
  "projects": [...],
  "contact": { "email": "..." }
}
```

See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for complete data structure and setup guide.

## 🎨 Customization

### Colors

Edit `lib/config/themes/app_colors.dart`:

```dart
static const Color primary = Color(0xFF6366F1);
static const Color secondary = Color(0xFF8B5CF6);
static const Color accent = Color(0xFF06B6D4);
```

### Fonts

Update fonts in `pubspec.yaml` and `lib/core/constants/app_strings.dart`

### Theme

Switch between dark and light themes in `lib/root_app.dart`:

```dart
theme: AppThemes.dark,  // or AppThemes.light
themeMode: ThemeMode.dark,  // or ThemeMode.light
```

## 🏗️ Build for Production

### Web

```bash
flutter build web --release
```

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

## 📦 Key Dependencies

- `firebase_core` & `cloud_firestore` - Firebase integration
- `flutter_bloc` - State management
- `go_router` - Navigation
- `flutter_screenutil` - Responsive design
- `url_launcher` - Open external links
- `font_awesome_flutter` - Icons
- `cached_network_image` - Image caching

## 🎯 Project Architecture

This project follows **Clean Architecture** principles:

- **Domain Layer**: Entities and repository interfaces
- **Data Layer**: Models, data sources, repository implementations
- **Presentation Layer**: UI, widgets, and state management

### Key Services

**ResumeService** (`lib/core/services/resume_service.dart`)

- Fetches complete resume from Firestore
- Provides methods for individual sections
- Handles errors and loading states

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Make sure to run code checks before committing (`./scripts/check_code.sh`)
4. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
5. Push to the branch (`git push origin feature/AmazingFeature`)
6. Open a Pull Request

### 🔍 Code Quality Checks

Before pushing your changes, please ensure all code quality checks pass:

#### Automatic Checks

- A pre-push Git hook is configured to run automatically before each push
- The hook will run formatting, analyzer, and tests checks
- If any check fails, the push will be blocked until issues are resolved

#### Manual Checks

You can run the comprehensive check suite manually:

```bash
# Run all checks (formatting, analyzer, tests)
./scripts/check_code.sh

# Run specific checks only
./scripts/check_code.sh --format    # Format code
./scripts/check_code.sh --analyze   # Run analyzer
./scripts/check_code.sh --test      # Run tests

# Get help
./scripts/check_code.sh --help
```

#### Checks Performed

- **Formatting**: Ensures consistent code style using `flutter format`
- **Analyzer**: Runs `flutter analyze` to catch potential issues
- **Tests**: Executes `flutter test` to verify functionality

Your code must pass all checks before it can be pushed to the repository.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 📧 Contact

Mohamed Ibrahem - [mohamed.data13@gmail.com](mailto:mohamed.data13@gmail.com)

Project Link: [https://github.com/eng-mohamed-ibrahem/portfolio](https://github.com/eng-mohamed-ibrahem/portfolio)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for the backend infrastructure
- The open-source community for inspiration

---
*Made with ❤️ using Flutter*
