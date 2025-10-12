[![LinkedIn][linkedin-shield]][linkedin-url]

[English](README.md)

<!-- PROJECT LOGO -->
<br />
<div align="center">                                
  
  <img src="my_movie_hub/assets/png/mmh_logo.png" alt="Logo" height="50">
  <h1 align="center">MY MOVIE HUB</h1>
  <p align="center">
    Aplicación Flutter lista para producción que te permite explorar, buscar y organizar tus películas — detalles, listas, valoraciones y estrenos.
    <br />
    Construida con <b>BLoC</b> y arquitectura <b>Clean/Hexagonal</b>, integrada con la API de <a href="https://developer.themoviedb.org/reference/intro/getting-started">TMDB</a>.
    <br />
    <br />
      <!-- <a href="https://github.com">View Demo</a> -->
      <!--    ·    -->
    <a href="https://github.com/davidgab98/my-movie-hub/issues">Reportar Bug / Proponer Funcionalidad</a>
  </p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart" />
  <img src="https://img.shields.io/badge/State-Bloc-7f52ff" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20%7C%20Hexagonal-success" />
</p>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabla de Contenidos</summary>
  <ol>
    <li>
      <a href="#app-showcase">Vista previa de la App</a>
    </li>
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


<!-- APP SHOWCASE -->
## Vista previa de la App

<!-- 3 ARRIBA -->
<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Login, Inicio y Perfil</th>
      <th text-align:center;">Detalles de Película</th>
      <th text-align:center;">Estrenos</th>
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
      <th text-align:center;>Listas (Favoritas • Valoradas • Pendientes)</th>
      <th text-align:center;">Búsqueda</th>
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
     
**Gestión de estados**
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [formz](https://pub.dev/packages/formz)

**Inyección de dependencias**
- [get_it](https://pub.dev/packages/get_it)

**Rutas**
- [go_router](https://pub.dev/packages/go_router)

**Red y almacenamiento**
- [dio](https://pub.dev/packages/dio)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

**Serialización y modelado**
- [json_serializable](https://pub.dev/packages/json_serializable)
- [freezed](https://pub.dev/packages/freezed)

**Localización**
- [easy_localization](https://pub.dev/packages/easy_localization)

**Herramientas de UI**
- [device_preview](https://pub.dev/packages/device_preview)

**Utilidades**
- [multiple_result](https://pub.dev/packages/multiple_result)
- [event_bus](https://pub.dev/packages/event_bus)
- [meta](https://pub.dev/packages/meta)

**Testing**
- [mockito](https://pub.dev/packages/mockito)
- [golden_toolkit](https://pub.dev/packages/golden_toolkit)

  
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

- [ ] Push notifications
- [ ] Widgets para pantalla de inicio (Android App Widgets y iOS WidgetKit)
- [ ] Persistencia de datos offline con HIVE
- [ ] Integración con otros servicios como IMDB
- [ ] Dynamic links para la compartición de contenido

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