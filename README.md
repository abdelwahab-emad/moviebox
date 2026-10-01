# 🎬 MovieBox

MovieBox is a movie discovery app built with Flutter and Firebase. It lets users sign up, browse now playing and popular movies, search for any title, and save their favorites to their own account.

The app is built with a feature-first Clean Architecture, so each feature is self-contained and easy to maintain.

## ✨ Features

- **Authentication** — sign up and log in with email/password or Google Sign-In via Firebase Auth
- **Home feed** — browse now playing and popular movies
- **Movie details** — view a movie's overview, genres, and star rating
- **Search** — find movies instantly, with a trending section and recent searches
- **Favorites** — add and remove favorite movies, saved per user in Cloud Firestore
- **Profile** — view and manage your account

## 📱 Screenshots

| Splash | Login | Register | Home |
| :---: | :---: | :---: | :---: |
| <img src="screenshots/splash_screen.jpeg" width="180" /> | <img src="screenshots/login_screen.jpeg" width="180" /> | <img src="screenshots/register_screen.jpeg" width="180" /> | <img src="screenshots/home_screen.jpeg" width="180" /> |

| Details | Search | Profile |
| :---: | :---: | :---: |
| <img src="screenshots/details_screen.jpeg" width="180" /> | <img src="screenshots/search_screen.jpeg" width="180" /> | <img src="screenshots/profile_screen.jpeg" width="180" /> |

## ⚙️ Technical Highlights

- **State management:** Cubit with `flutter_bloc`
- **Architecture:** feature-first Clean Architecture, split into data and presentation layers
- **Backend:** Firebase (Authentication, Cloud Firestore) for user accounts and favorites
- **Networking:** `dio` with centralized API error handling, fetching movie data from the TMDB API
- **Dependency injection:** `get_it` with `injectable`
- **Performance:** genres are cached in memory to avoid repeated network calls

## 🧰 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | flutter_bloc (Cubit) |
| Networking | Dio, Pretty Dio Logger |
| Backend / Database | Firebase Cloud Firestore |
| Authentication | Firebase Auth, Google Sign-In |
| Dependency Injection | get_it, injectable |
| Movie Data | TMDB API |

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── service_locator.dart      # Dependency injection (GetIt)
│   ├── errors/
│   │   ├── failures.dart                 # Shared Failure classes
│   │   └── firestore_error_handler.dart  # Maps Firestore errors to messages
│   ├── genres/                       # Genre repo + in-memory cache
│   ├── networking/
│   │   ├── api_constants.dart            # Base URL & endpoint constants
│   │   ├── dio_factory.dart              # Dio client setup
│   │   ├── api_result.dart               # Success/Failure wrapper for API responses
│   │   ├── api_error_model.dart          # Error model parsed from API responses
│   │   └── api_error_handler.dart        # Maps Dio exceptions to readable messages
│   ├── routes/                       # app_router.dart, app_routes.dart
│   ├── widgets/                      # Shared widgets (buttons, fields, grid, loading, error, rating)
│   ├── assets.dart                   # Asset paths
│   ├── navigation_controller.dart    # Navigation helpers
│   └── styles.dart                   # App-wide text styles
│
├── Features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── errors/               # Auth failures
│   │   │   ├── models/               # user_model.dart
│   │   │   └── repos/                # auth_repo + auth_repo_impl
│   │   └── presentation/
│   │       ├── manger/               # login_cubit, register_cubit
│   │       └── views/                # login_screen, register_screen, widgets/
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/               # movie_model.dart
│   │   │   └── repos/                # home_repo + home_repo_impl
│   │   └── presentation/
│   │       ├── manger/               # now playing, popular, movie details cubits
│   │       └── views/                # home_screen, movie_details_screen, widgets/
│   │
│   ├── search/
│   │   ├── data/repos/               # search_repo + search_repo_impl
│   │   └── presentation/
│   │       ├── manger/               # search_cubit, trending_cubit
│   │       └── views/                # search_screen + widgets (results, recent searches, trending)
│   │
│   ├── favorites/
│   │   ├── data/repos/               # favorites_repo + favorites_repo_impl
│   │   └── presentation/
│   │       ├── manger/cubit/         # favorites_cubit, favorites_state
│   │       └── views/                # favorites_screen, widgets/
│   │
│   ├── profile/
│   │   ├── data/repos/               # profile_repo + profile_repo_impl
│   │   └── presentation/
│   │       ├── manger/profile/       # profile_cubit, profile_state
│   │       └── views/                # profile_screen, widgets/
│   │
│   ├── main_navigation/              # Bottom navigation shell
│   └── Splash/                       # Splash screen
│
├── constants.dart                    # App-wide constants
├── firebase_options.dart             # Firebase configuration
├── main.dart                         # App entry point
└── movie_box.dart                    # Root app widget
