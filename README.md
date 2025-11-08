# 🎬 Movie App

A modern Flutter application for browsing popular movies with detailed information. Built with clean architecture principles and featuring offline support, theme switching, and smooth infinite scrolling.

## ✨ Features

- **🎭 Popular Movies**: Browse a grid of popular movies with infinite scroll
- **📱 Movie Details**: View comprehensive information about each movie including:
  - Movie poster and backdrop images
  - Overview and genres
  - Ratings and release year
  - Financial information (budget, revenue)
- **🌙 Dark Mode**: Toggle between light and dark themes
- **💾 Offline Support**: Movies are cached locally for offline viewing
- **🔄 Connectivity Detection**: Automatic detection of network connectivity
- **⚡ Smooth Performance**: Optimized with shimmer loading states and image caching


### Layers

- **Data Layer**: Handles API calls, local caching, and data models
- **Domain Layer**: Contains business logic and entities
- **Presentation Layer**: UI components and state management (BLoC)


## 🎥 Video

https://github.com/user-attachments/assets/88172ddc-0508-4ba8-9914-9349267a1c6a


## 🛠️ Tech Stack

- **Flutter**: ^3.9.2
- **State Management**: `flutter_bloc` ^8.1.6
- **Networking**: 
  - `dio` ^5.9.0
  - `retrofit` ^4.8.0
  - `pretty_dio_logger` ^1.4.0
- **Local Database**: `drift` ^2.20.0
- **Dependency Injection**: `get_it` ^8.2.0
- **Code Generation**: 
  - `freezed` ^3.2.3
  - `json_serializable` ^6.11.1
  - `build_runner` ^2.10.1
- **UI**:
  - `flutter_screenutil` ^5.9.3 (responsive design)
  - `shimmer` ^3.0.0 (loading states)
  - `cached_network_image` ^3.4.1 (image caching)
- **Connectivity**: `connectivity_plus` ^6.1.0
- **Environment Variables**: `flutter_dotenv` ^6.0.0

## 📋 Prerequisites

- Flutter SDK ^3.9.2
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- A valid TMDB API key ([Get one here](https://www.themoviedb.org/settings/api))

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
cd movie
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Set up environment variables

Create a `.env` file in the root directory:

```env
API_KEY=your_tmdb_api_key_here
```

> **Note**: Make sure to add `.env` to your `.gitignore` (already included)

### 4. Generate code

Run the code generator to generate the necessary files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/              # Shared utilities and configurations
│   ├── constants/     # App constants (API keys, etc.)
│   ├── database/      # Local database setup (Drift)
│   ├── di/            # Dependency injection (GetIt)
│   ├── helper/        # Helper classes (shared preferences, connectivity)
│   ├── networking/    # API configuration (Dio, Retrofit)
│   ├── pagination/    # Pagination state management
│   ├── router/        # App routing
│   ├── theme/         # Theme configuration
│   └── widgets/       # Reusable widgets
│
└── features/          # Feature modules
    ├── home/          # Home screen feature
    │   ├── data/      # Data layer (models, data sources, repositories)
    │   ├── domain/    # Domain layer (entities, repositories)
    │   └── presentation/ # Presentation layer (UI, BLoC)
    └── movie_details/ # Movie details feature
        ├── data/
        ├── domain/
        └── presentation/
```
