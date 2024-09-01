# Project Name

**Dog Breeds Case App with Flutter Bloc**

## Table of Contents

- [Project Description](#project-description)
- [Technologies and Packages Used](#technologies-and-packages-used)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Features](#features)
  - [1. Splash Screen](#1-splash-screen)
  - [2. Home Screen](#2-home-screen)
  - [3. Settings Screen](#3-settings-screen)
  - [4. Routing](#4-routing)
- [Contributing](#contributing)
- [License](#license)

## Project Description

This project is an application that demonstrates how to fetch and manage dog breeds and their images using Flutter Bloc from the `https://dog.ceo/dog-api/documentation/` API. The app includes basic components such as a splash screen, home screen, and settings screen. On the splash screen, dog breeds and their images are fetched from the API and cached. On the home screen, dog breeds are listed, can be filtered, and random images can be generated. The settings screen displays basic settings as well as the device's operating system version.

## Technologies and Packages Used

- **flutter_bloc**: A popular state management library for Flutter.
- **dio**: A Dart library used for making HTTP requests.
- **cached_network_image**: A package used for caching images.
- **go_router**: A Flutter package used to manage routing within the app.
- **get_it**: A Flutter package used for dependency injection.
- **MethodChannel**: Used for communication between native code and Flutter. In this project, it is used to display the operating system version.

## Getting Started

To run the project on your local machine, follow these steps.

### Requirements

- Flutter SDK (>=3.22.0)
- Dart SDK
- Android Studio or VS Code (with Flutter plugins)

### Installation

1. **Clone the project:**
    ```bash
    git clone https://github.com/enesozudogru/dog-breed-case
    cd project-name
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the project:**
    ```bash
    flutter run
    ```

## Project Structure

The project is based on the **Bloc** architecture and is organized as follows:

- `lib/`
    - `core/`
        - `base/`
            - `base_api_service.dart`: Contains the base configuration for API services.
        - `constants/`
            - `app_colors.dart`: Defines the colors used in the app.
            - `app_routes.dart`: Contains the routing configuration for the app.
            - `app_urls.dart`: Contains constants for API and other URLs.
        - `init/`
            - `theme/`
                - `light_theme.dart`: Contains the configuration for the light theme.
            - `locator.dart`: File used for dependency injection.
    - `feature/`
        - `bloc/`: Contains Bloc files (event, state, bloc).
            - `breed_bloc.dart`: Bloc class managing dog breeds.
            - `breed_event.dart`: Event classes for dog breeds.
            - `breed_state.dart`: State classes for dog breeds.
        - `models/`: Represents the data models retrieved from the API.
            - `breed_model.dart`: Contains the dog breed model.
        - `router/`: Manages the routing of the application.
            - `app_router.dart`: `go_router` configuration.
        - `services/`: Service files that communicate with the API.
            - `breed_service.dart`: Service class managing API calls for dog breeds and images.
        - `views/`: UI components containing the screens of the application.
            - `auth/`: Contains the splash screen of the application.
                - `splash_view.dart`: Contains the splash screen of the application.
            - `home/`: Contains the home screen.
                - `widgets/`: Contains widgets used on the home screen.
                    - `breed_card.dart`: Widget showing each dog breed.
                    - `breed_list.dart`: Widget listing the dog breeds.
                    - `search_text_field.dart`: Search field used for filtering dog breeds.
                - `home_view.dart`: Contains the home screen where dog breeds are listed.
            - `settings/`: Contains the settings screen.
                - `widgets/`: Contains widgets used on the settings screen.
                    - `settings_item.dart`: Widget showing each settings item.
                - `settings_view.dart`: Screen showing device information and other settings.
        - `widgets/`: Contains reusable widgets used throughout the application.
            - `custom_bottom_navigation_bar.dart`: Contains the bottom navigation bar of the application.
    - `main.dart`: The main entry point of the application.

## Features

### 1. Splash Screen

- **Description**: When the app is launched, the splash screen fetches dog breeds and their image links from the API. These data are cached, and the splash screen is displayed until all data is ready.
- **Details**:
  - `Dio` is used to fetch data from the API.
  - Images are cached using `CachedNetworkImage`.
  - Once the data is ready, the splash screen closes, and the home screen is displayed.

### 2. Home Screen

- **Description**: On the home screen, users can view, filter, and generate random images of dog breeds.
- **Details**:
  - **AppBar**: A simple top bar is present.
  - **BottomBar**: Users can switch between the home screen and settings screen.
  - **Dog Breeds List**: Dog breeds and images are listed. This list can be filtered.
  - **Input Field**: A collapsible and expandable input field is available for filtering dog breeds.
  - **Bottom Sheet**: When a dog breed is clicked, details about that breed and a randomly generated image are shown in a bottom sheet.

### 3. Settings Screen

- **Description**: A screen showing the device's operating system version.
- **Details**:
  - **Operating System Version**: Using MethodChannel, the operating system version is obtained via native code for both iOS and Android and displayed on the screen.

### 4. Routing

- **Description**: Routing within the app is managed using the `go_router` package.
- **Details**:
  - `go_router` allows for easy, animated transitions between the splash screen, home screen, and settings screen.
  - A separate route is defined for each screen.

## Contributing

If you would like to contribute, you can support the project by submitting a pull request or creating an issue.

## License

This project is licensed under the [MIT License](LICENSE).