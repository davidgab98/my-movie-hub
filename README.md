[![LinkedIn][linkedin-shield]][linkedin-url]

[Español](README-es.md)

<!-- PROJECT LOGO -->
<div align="center">                                
  
  <img src="my_movie_hub/assets/png/mmh_logo.png" alt="Logo" height="50">
  <h1 align="center">MY MOVIE HUB</h1>
  <p align="center">
    Production-ready Flutter app for managing your movie journey — explore, search, details, lists, ratings, and premieres.
    <br />
    Built with <b>BLoC</b> and <b>Clean/Hexagonal</b> architecture, integrated with the <a href="https://developer.themoviedb.org/reference/intro/getting-started">TMDB</a> API.
    <br />

  </p>
</div>
<br />
<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart" />
  <img src="https://img.shields.io/badge/State-Bloc-7f52ff" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20%7C%20Hexagonal-success" />
</p>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#app-showcase">🎥 App Showcase</a>
    </li>
    <li>
      <a href="#about-the-project">📖 About The Project</a>
    </li>
    <li>
      <a href="#project-structure-and-dependencies">🧩 Project Structure and Dependencies</a>
      <ul>
        <li><a href="#packages">Packages</a></li>
        <li><a href="#structure">Structure</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">🗺️ Roadmap</a></li>
    <li>
      <a href="#getting-started">🚀 Setup & Run</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#run">Run</a></li>
      </ul>
    </li>
    <li><a href="#contact">📫 Contact</a></li>
  </ol>
</details>


<!-- APP SHOWCASE -->
## 🎥 App Showcase 

<!-- 3 ARRIBA -->
<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Login, Home & Profile</th>
      <th text-align:center;">Movie Details</th>
      <th text-align:center;">Premieres</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/e5060161-52e6-4b94-b982-a4bc31b99dab" width="245" alt="Login, Home & Profile">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/772567db-5dea-41e6-bff4-912c7d49a264" width="245" alt="Movie Details">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/6577c17f-ddbe-4de5-8198-6fbbc8e3c0c5" width="245" alt="Premieres">
      </td>
    </tr>
  </table>
</div>

<!-- 2 ABAJO -->
<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;>Lists (Favorites • Rated • Watchlist)</th>
      <th text-align:center;">Search</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/361f7375-2e63-4845-8c4d-86c65e2907be" width="245" alt="My Lists (Favorites • Rated • Watchlist)">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/f6904fdd-91cb-4e10-89ef-33806fb364c7" width="245" alt="Search">
      </td>
    </tr>
  </table>
</div>




---


<!-- ABOUT THE PROJECT -->
## 📖 About The Project

**My Movie Hub** is a mobile application developed in Flutter. It has been built under a Hexagonal architecture following the MVVM pattern. It uses the Bloc pattern for state management. Clean Architecture and Clean Code practices have been adopted in its development, as well as SOLID principles. The Atomic Design methodology has been applied for the design and componentization of the UI.
<br />
<br />
The application integrates directly with The Movie Database (TMDB) API to provide updated data on users, movies and releases from around the world. 
<br />
<br />
Available soon on Android and iOS.

### Main functionalities:

- **Movie Discovery:** browse a vast selection of movies and new releases both locally and internationally.
- **Custom Search:** find specific movies using the search and filter function.
- **Releases timeline:** discover current or any era's releases in your country or elsewhere.
- **List Management:** save your favorite movies in customized 'To Watch' or 'Favorites' lists. 
- **Ratings:** rate movies, review your rating history and see global ratings from other users.
- **Detailed Information:** access complete movie information, including synopsis, cast, ratings and more.
- **Connection with TMDB:** Synchronize your user with your TMDB account and keep your lists and preferences up to date.
- **Appearance:** Switch between Dark mode and Light mode.
- **Language:** Select between different languages.

**My Movie Hub** is the ultimate tool to explore, discover and organize your passion for movies. Immerse yourself in the world of cinema with instant updates and take your movie experience to a new level.

**Note:** My Movie Hub is not affiliated with, endorsed or certified by TMDB. This app is an independent project aimed at providing a rich and personalized experience for movie lovers.

---

## 🧩 Project Structure and Dependencies

### Packages   

These are some of the main packages used in the application.
     
**State management**
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [formz](https://pub.dev/packages/formz)

**Dependency Injection**
- [get_it](https://pub.dev/packages/get_it)

**Routing**
- [go_router](https://pub.dev/packages/go_router)

**Networking & Storage**
- [dio](https://pub.dev/packages/dio)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

**Serialization & Modeling**
- [json_serializable](https://pub.dev/packages/json_serializable)
- [freezed](https://pub.dev/packages/freezed)

**Localization**
- [easy_localization](https://pub.dev/packages/easy_localization)

**UI Tooling**
- [device_preview](https://pub.dev/packages/device_preview)

**Utilities**
- [multiple_result](https://pub.dev/packages/multiple_result)
- [event_bus](https://pub.dev/packages/event_bus)
- [meta](https://pub.dev/packages/meta)

**Testing**
- [mockito](https://pub.dev/packages/mockito)
- [golden_toolkit](https://pub.dev/packages/golden_toolkit)



### Structure

The project is structured using a modular architecture, comprised of three primary directories: `core`, `core-ui`, y `features`.

### `lib/src`
  - `core/`: Fundamental and shared elements of the app.
  - `core-ui/`: Common and reusable user interface elements.
  - `features/`: Different modules or features of the application, divided by functionality.

### `features/`

Each `feature` or module has its own structure:

```
|- feature/
  |- application/
  |- data/
      |- repositories/
  |- domain/
      |- models/
      |- repositories/
  |- presentation/
      |- screens/
      |- widgets/

````
---

<!-- ROADMAP -->
## 🗺️ Roadmap

- [ ] Push notifications
- [ ] Home screen widgets (Android App Widgets & iOS WidgetKit)
- [ ] Offline data persistence with Hive
- [ ] Integration with services like IMDb
- [ ] Dynamic links for content sharing

Feel free to contribute: [open issues](https://github.com/davidgab98/my-movie-hub/issues)


---


<!-- GETTING STARTED -->
## 🚀 Setup & Run

Start using My Movie Hub by following these instructions to set up and run the app on your device.

### Prerequisites

Before installing the application, make sure you have the following installed:

- Flutter: You must have Flutter installed on your machine. To install Flutter, follow the instructions in the [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).
- Android Studio or Visual Studio Code: You need an IDE to run and test your application. Android Studio or Visual Studio Code are recommended. Make sure to install the Flutter and Dart plugins.
- A device or emulator: To run the application, you will need an Android or iOS device, or an emulator installed via your IDE.


### Installation

1. Clone the GitHub repository:
   ```sh
   git clone https://github.com/davidgab98/my-movie-hub.git
   ```

2. Navigate to the main project folder and install all dependencies:
   ```sh
   cd my-movie-hub/my_movie_hub
   flutter pub get
   ```

3. Install all necessary dependencies for the UI package:
   ```sh
   cd ../ui/ui_kit
   flutter pub get
   cd ../../my_movie_hub
   ```

### Run

1. Make sure you have navigated to the main project folder:
   ```sh
   cd my-movie-hub/my_movie_hub
   ```

2. Use the following command in your terminal, replacing `<flavor>` with `development`, `staging`, or `production` and `<mode>` with `debug`, `profile`, or `release` as per your needs:

   ```sh
   flutter run --flavor <flavor> --target lib/main_<flavor>.dart --<mode>
   ```

   Alternatively, if you are using Visual Studio Code, you can select and run each configuration from the "Run and Debug" menu based on the `launch.json` file.

<br/>
Now you should be able to see the application running on your device or emulator.

---




<!-- CONTACT -->
## 📫 Contact

David González Íñiguez 
- Email: davidgab08@gmail.com
- Linkedin: [davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
