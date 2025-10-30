# AI Image Generator

A modern Flutter application that generates images from text descriptions using a mock API. Built with Clean Architecture and BLoC state management.

## 📱 Demo

![App Demo](demo/demo.gif)

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/VladKodletov/prompt_app.git
```

2. Navigate to the project directory:
```bash
cd prompt_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Architecture

The app follows Clean Architecture principles with a feature-first approach:

- **Presentation Layer**: Uses BLoC pattern for state management
- **Domain Layer**: Contains business logic and entities
- **Data Layer**: Handles data operations and external services