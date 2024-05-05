[![LinkedIn][linkedin-shield]][linkedin-url]

[English](README.md)

<!-- PROJECT LOGO -->
<br />
<div align="center">                                
  
  <img src="my_movie_hub/assets/pngs/mmh_logo.png" alt="Logo" height="50">
  <h1 align="center">MY MOVIE HUB</h1>
  <p align="center">
    Aplicación móvil centrada en la exploración, búsqueda y gestión de películas, listas y estrenos de cine.
    <br />
    Construida con Flutter (Bloc) y la API de <a href="https://developer.themoviedb.org/reference/intro/getting-started">TMDB</a>.
    <br />
    <br />
      <!-- <a href="https://github.com">View Demo</a> -->
      <!--    ·    -->
    <a href="https://github.com/davidgab98/my-movie-hub/issues">Reportar Bug / Proponer Funcionalidad</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabla de Contenidos</summary>
  <ol>
    <li>
      <a href="#sobre-el-proyecto">Sobre el proyecto</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerrequisitos">Prerrequisitos</a></li>
        <li><a href="#instalación">Instalación</a></li>
        <li><a href="#ejecución">Ejecución</a></li>
      </ul>
    </li>
     <li>
      <a href="#estructura-del-proyecto-y-dependencias">Estructura del proyecto y Dependencias</a>
      <ul>
        <li><a href="#packages">Packages</a></li>
        <li><a href="#estructura">Estructura</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contacto">Contacto</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## Sobre el proyecto

**My Movie Hub** es una aplicación móvil desarrollada en Flutter. Se ha construido bajo una arquitectura Hexagonal siguiendo el patrón MVVM. Utiliza el patrón Bloc para la gestión de estados. En su desarrollo se han adoptado prácticas de Clean Architecture y Clean Clode, así como principios SOLID. Para el diseño y componentización de la UI se ha aplicado la metodología Atomic Design. 
<br />
<br />
La aplicación se integra directamente con la API de The Movie Data Base para proporcionar datos actualizados de usuarios, películas y estrenos de todo el mundo. 
<br />
<br />
Disponible próximamente en Android e IOS.

### Funcionalidades principales:

- **Descubrimiento de Películas:** explora una vasta selección de películas y estrenos tanto a nivel local como internacional.
- **Búsqueda Personalizada:** encuentra películas específicas utilizando la función de búsqueda y filtrado.
- **TimeLine de Estrenos:** descubre los estrenos actuales o de cualquier época en tu país o en cualquier otro lugar.
- **Gestión de Listas:** guarda tus películas preferidas en listas personalizadas de 'Pendientes' o 'Favoritos'. 
- **Votaciones:** califica películas, revisa tu historial de calificaciones y consulta las votaciones globales de otros usuarios.
- **Información Detallada:** accede a información completa sobre películas, incluyendo sinopsis, reparto, valoraciones y más.
- **Conexión con TMDB:** Sincroniza tu usuario con tu cuenta de TMDB y manten actualizadas tus listas y preferencias.
- **Apariencia:** cambia entre el modo Oscuro y el modo Claro.
- **Idioma:** selecciona entre diferentes idiomas.

**My Movie Hub** es la herramienta definitiva para explorar, descubrir y organizar tu pasión por el cine. Sumérgete en el mundo del séptimo arte con actualizaciones al momento y lleva tu experiencia cinematográfica a un nuevo nivel.

**Nota:** My Movie Hub no está afiliado, respaldado ni certificado por TMDB. Esta aplicación es un proyecto independiente destinado a proporcionar una experiencia rica y personalizada a los amantes del cine.

---

## Estructura del proyecto y Dependencias

### Packages   

Estos son algunos de los paquetes principales utilizados en la aplicación.
     
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

  
### Estructura

El proyecto sigue una arquitectura modular, en la que se distinguen tres carpetas principales: `core`, `core-ui`, y `features`.

### `lib/src`
  - `core/`: Elementos fundamentales y compartidos de la app.
  - `core-ui/`: Elementos de la interfaz de usuario que son comunes y reutilizables.
  - `features/`: Los distintos módulos o características de la aplicación, divididos por funcionalidad. 

### `features/`

Cada `feature` o módulo tiene su propia estructura:

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

- [ ] Persistencia de datos offline mediante HIVE
- [ ] Push notifications
- [ ] Widgets para pantalla de inicio
- [ ] Integración con otros servicios similares como IMDB
- [ ] Dynamic links para la compartición de contenido
- [ ] Unit y Bloc Testing, Widget Testing y Golden Tests

Siéntete libre de contribuir: [abrir issues](https://github.com/davidgab98/my-movie-hub/issues)


---


<!-- GETTING STARTED -->
## Getting Started

Inicia My Movie Hub siguiendo estas instrucciones para configurar y ejecutar la app en tu dispositivo.

### Prerrequisitos

Antes de instalar la aplicación, asegúrate de tener instalado lo siguiente:

- Flutter: Debes tener Flutter instalado en tu máquina. Para instalar Flutter, sigue las instrucciones en [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).
- Android Studio o Visual Studio Code: Necesitas un IDE para ejecutar y probar tu aplicación. Android Studio o Visual Studio Code son recomendables. Asegúrate de instalar los plugins de Flutter y Dart.
- Un dispositivo o emulador: Para ejecutar la aplicación, necesitarás un dispositivo Android o iOS, o un emulador instalado a través de tu IDE.


### Instalación

1. Clona el repositorio de GitHub:
   ```sh
   git clone https://github.com/davidgab98/my-movie-hub.git
   ```

2. Navega hacia la carpeta del proyecto principal e instala todas las dependencias:
   ```sh
   cd my-movie-hub/my_movie_hub
   flutter pub get
   ```

3. Instala todas las dependencias necesarias para el paquete de UI:
   ```sh
   cd ../ui_kit/ui
   flutter pub get
   cd ../../my_movie_hub
   ```

### Ejecución

1. Asegúrate de haber navegado hacia la carpeta del proyecto principal:
   ```sh
   cd my-movie-hub/my_movie_hub
   ```

2. Utiliza el siguiente comando en tu terminal, reemplazando `<flavor>` por `development`, `staging`, o `production` y `<mode>` por `debug`, `profile`, o `release` según sea tus necesidades:

   ```sh
   flutter run --flavor <flavor> --target lib/main_<flavor>.dart --<mode>
   ```
   
   Alternativamente, si estás utilizando Visual Studio Code, puedes seleccionar y ejecutar cada configuración desde el menú de "Run and Debug" basado en el archivo `launch.json`.

<br/>
Ahora deberías ser capaz de ver la aplicación corriendo en tu dispositivo o emulador.

---


<!-- CONTACT -->
## Contacto

David González Íñiguez 
- Email: davidgab08@gmail.com
- Linkedin: [davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez