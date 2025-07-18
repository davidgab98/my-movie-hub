[![LinkedIn][linkedin-shield]][linkedin-url]

[Español](README-es.md)

<!-- PROJECT LOGO -->
<br />
<div align="center">                                
  
  <img src="my_movie_hub/assets/png/mmh_logo.png" alt="Logo" height="50">
  <h1 align="center">MY MOVIE HUB</h1>
  <p align="center">
    Mobile application focused on the exploration, search and management of movies, lists and movie releases.
    <br />
    Built with Flutter (Bloc) and the <a href="https://developer.themoviedb.org/reference/intro/getting-started">TMDB</a> API.
    <br />
    <br />
      <!-- <a href="https://github.com">View Demo</a> -->
      <!--    ·    -->
    <a href="https://github.com/davidgab98/my-movie-hub/issues">Report Bug / Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#run">Run</a></li>
      </ul>
    </li>
    <li>
      <a href="#project-structure-and-dependencies">Project Structure and Dependencies</a>
      <ul>
        <li><a href="#packages">Packages</a></li>
        <li><a href="#structure">Structure</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

**My Movie Hub** is a mobile application developed in Flutter. It has been built under a Hexagonal architecture following the MVVM pattern. It uses the Bloc pattern for state management. Clean Architecture and Clean Clode practices have been adopted in its development, as well as SOLID principles. The Atomic Design methodology has been applied for the design and componentization of the UI.
<br />
<br />
The application integrates directly with The Movie Data Base API to provide updated data on users, movies and releases from around the world. 
<br />
<br />
Available soon on Android and IOS.

### Main functionalities:

- **Movie Discovery:** browse a vast selection of movies and new releases both locally and internationally.
- **Custom Search:** find specific movies using the search and filter function.
- **Releases TimeLine:** discover current or any era's releases in your country or elsewhere.
- **List Management:** save your favorite movies in customized 'To Watch' or 'Favorites' lists. 
- **Ratings:** rate movies, review your rating history and see global ratings from other users.
- **Detailed Information:** access complete movie information, including synopsis, cast, ratings and more.
- **Connection with TMDB:** Synchronize your user with your TMDB account and keep your lists and preferences up to date.
- **Appearance:** Switch between Dark mode and Light mode.
- **Language:** Select between different languages.

**My Movie Hub** is the ultimate tool to explore, discover and organize your passion for movies. Immerse yourself in the world of cinema with instant updates and take your movie experience to a new level.

**Note:** My Movie Hub is not affiliated with, endorsed or certified by TMDB. This app is an independent project aimed at providing a rich and personalized experience for movie lovers.

---

## Project Structure and Dependencies

### Packages   

These are some of the main packages used in the application.
     
- [Flutter Bloc](https://bloclibrary.dev)   
- [Get It](https://github.com/fluttercommunity/get_it)  
- [Go Router](https://pub.dev/packages/go_router)  
- [Dio](https://github.com/flutterchina/dio)   
- [Shared Preferences](https://pub.dev/packages/shared_preferences)  
- [Json Serializable](https://github.com/dart-lang/json_serializable)  
- [Freezed](https://pub.dev/packages/freezed)    
- [Formz](https://pub.dev/packages/formz)  
- [Easy Localization](https://pub.dev/packages/easy_localization)  
- [Device Preview](https://pub.dev/packages/device_preview)  
- [Multiple Result](https://pub.dev/packages/multiple_result)  
- [Event Bus](https://pub.dev/packages/event_bus)  
- [Mockito](https://pub.dev/packages/mockito)  
- [Golden Toolkit](https://pub.dev/packages/golden_toolkit)  
- [Meta](https://pub.dev/packages/meta) 

  
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
## Roadmap

- [ ] Push notifications
- [ ] Home screen widgets
- [ ] Offline data persistence through HIVE
- [ ] Integration with other similar services such as IMDB
- [ ] Dynamic links for content sharing
- [ ] Unit and Bloc Testing, Widget Testing and Golden Tests

Feel free to contribute: [open issues](https://github.com/davidgab98/my-movie-hub/issues)


---


<!-- GETTING STARTED -->
## Getting Started

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
## Contact

David González Íñiguez 
- Email: davidgab08@gmail.com
- Linkedin: [davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez