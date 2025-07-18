// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "appTitle": "MMH (EN)",
  "error": {
    "notImplemented": "Not Implemented",
    "requestCancelled": "Request Cancelled",
    "internalServerError": "Internal Server Error",
    "serviceUnavailable": "Service Unavailable",
    "methodNotAllowed": "Method Not Allowed",
    "badRequest": "Bad Request",
    "unauthorizedRequest": "Unauthorized Request",
    "unexpectedError": "Unexpected Error Occurred",
    "requestTimeout": "Request Timeout",
    "noInternetConnection": "No Internet Connection",
    "conflict": "Conflict Error",
    "sendTimeout": "Send Timeout with API Server",
    "unableToProcess": "Unable to Process the Data",
    "formatException": "Oops, Something Went Wrong",
    "notAcceptable": "Oops, Something Went Wrong",
    "custom": {
      "invalidCredentials": "Incorrect Username and/or Password"
    },
    "default": {
      "signIn": "There was a problem signing in"
    },
    "placeholder": {
      "message": "Data could not be loaded,\ncheck the internet connection",
      "realoadButtonText": "Reload"
    }
  },
  "common": {
    "ok": "Ok",
    "and": "and"
  },
  "policy": {
    "privacy": "Privacy Policy",
    "terms": "Terms of Use"
  },
  "signIn": {
    "notHaveAccountMessage": "Not registered?",
    "notHaveAccountButtonText": "Create a User",
    "signInButtonText": "Log In",
    "usernameLabel": "Username",
    "passwordLabel": "Password",
    "usernameInputEmptyMessage": "Enter a username",
    "usernameInputInvalidMessage": "Enter a valid username",
    "passwordInputEmptyMessage": "Enter a password"
  },
  "home": {
    "mainTitle": "Home"
  },
  "highlights": {
    "mainTitle": "Favorites and Rated",
    "menuOption": "F&R"
  },
  "watchlist": {
    "mainTitle": "Watchlist"
  },
  "favorites": {
    "mainTitle": "Favorites"
  },
  "ratings": {
    "mainTitle": "Rated",
    "reviewsLabel": "ratings",
    "clearRating": "Clear"
  },
  "publicLists": {
    "nowPlayingTitle": "Now Playing",
    "popularTitle": "Popular",
    "upcomingTitle": "Upcoming",
    "topRatedTitle": "Top Rated"
  },
  "search": {
    "mainTitle": "Search",
    "yearInputLabel": "Year",
    "totalResultsLabel": "Results",
    "textPlaceholder": "What do you feel like watching today?",
    "emptyResultsText": "No results \n for this search"
  },
  "premieres": {
    "mainTitle": "Premieres",
    "headline": "In theaters from {date} in {country}",
    "showPremieresButton": "Show Premieres"
  },
  "list": {
    "errorLoadingNewDataText": "Error loading new data",
    "emptyResultsText": "No movies saved",
    "errorText": "Error",
    "moviesResultsLabel": "Movies"
  },
  "movieItem": {
    "posterNotFound": "Poster not found"
  },
  "movieDetails": {
    "movieRecommendationsLabel": "You might be interested in",
    "originalTitleLabel": "Original Title",
    "yearLabel": "Year",
    "durationLabel": "Duration",
    "countryLabel": "Country",
    "productionCompaniesLabel": "Companies",
    "castLabel": "Cast",
    "directionLabel": "Direction",
    "screenplayLabel": "Screenplay",
    "musicLabel": "Music",
    "photographyLabel": "Photography"
  },
  "profile": {
    "mainTitle": "My Profile",
    "userIdLabel": "User ID",
    "goToWebButtonText": "View in Web",
    "logoutButtonText": "Log Out",
    "cancelLogoutButtonText": "Cancel",
    "logoutModalQuestion": "Are you sure you want to log out?"
  },
  "theme": {
    "mainTitle": "Theme",
    "darkThemeLabel": "Dark",
    "lightThemeLabel": "Light"
  },
  "language": {
    "mainTitle": "Language"
  },
  "helpAndFeedback": {
    "mainTitle": "Help and Feedback",
    "contact": {
      "mainTitle": "Contact the Developer",
      "mailSubject": "I'd like to invite you to coffee",
      "mailBody": "Hello! \n\nI'd like to invite you to a virtual coffee to chat about My Movie Hub and to get in touch. \n\nLooking forward to your response! \n\nRegards, [ Your Name ]"
    },
    "feedback": {
      "mainTitle": "Report a Bug / Suggest a Feature",
      "mailSubject": "Bug Report or Feature Request",
      "mailBody": "Hello, \n\nI've encountered an issue in My Movie Hub that I'd like to report. Here are the details: \n[Brief description of the bug or issue] \n\nDevice and OS version: \n[Device information and OS version] \n\nOr, \n\nI have an idea for a new feature that could be great for My Movie Hub: \n[Description of the suggested feature] \n\nThank you for your attention. \n\nRegards, [ Your Name ]"
    }
  },
  "about": {
    "mainTitle": "About",
    "openSourceLicenses": "Open Source Licenses",
    "attributionText": "All film-related metadata used in My Movie Hub, including actor, director and studio names, synopses, release dates and poster art is supplied by "
  },
  "orderType": {
    "ascendent": "Latest",
    "descendent": "Oldest"
  },
  "genres": {
    "action": "Action",
    "adventure": "Adventure",
    "animation": "Animation",
    "comedy": "Comedy",
    "crime": "Crime",
    "documentary": "Documentary",
    "drama": "Drama",
    "family": "Family",
    "fantasy": "Fantasy",
    "history": "History",
    "horror": "Horror",
    "music": "Music",
    "mystery": "Mystery",
    "romance": "Romance",
    "scienceFiction": "Science Fiction",
    "tvMovie": "TV Movie",
    "thriller": "Thriller",
    "war": "War",
    "western": "Western"
  }
};
static const Map<String,dynamic> _es = {
  "appTitle": "MMH (ES)",
  "error": {
    "notImplemented": "No Implementado",
    "requestCancelled": "Solicitud Cancelada",
    "internalServerError": "Error Interno del Servidor",
    "serviceUnavailable": "Servicio No Disponible",
    "methodNotAllowed": "Método No Permitido",
    "badRequest": "Solicitud Incorrecta",
    "unauthorizedRequest": "Solicitud No Autorizada",
    "unexpectedError": "Error Inesperado Ocurrido",
    "requestTimeout": "Tiempo de Solicitud Agotado",
    "noInternetConnection": "Sin Conexión a Internet",
    "conflict": "Error Debido a un Conflicto",
    "sendTimeout": "Tiempo de Envío Agotado en Conexión con el Servidor API",
    "unableToProcess": "Incapaz de Procesar los Datos",
    "formatException": "Uy, Algo Salió Mal",
    "notAcceptable": "Uy, Algo Salió Mal",
    "custom": {
      "invalidCredentials": "Usuario y/o contraseña incorrectos"
    },
    "default": {
      "signIn": "Ha habido un problema iniciando sesión"
    },
    "placeholder": {
      "message": "No se han podido cargar los datos,\ncomprueba la conexión a internet",
      "realoadButtonText": "Recargar"
    }
  },
  "common": {
    "ok": "Ok",
    "and": "y"
  },
  "policy": {
    "privacy": "Política de Privacidad",
    "terms": "Términos de Uso"
  },
  "signIn": {
    "notHaveAccountMessage": "¿No estás registrado?",
    "notHaveAccountButtonText": "Crea un usuario",
    "signInButtonText": "Entrar",
    "usernameLabel": "Nombre de usuario",
    "passwordLabel": "Contraseña",
    "usernameInputEmptyMessage": "Introduce un username",
    "usernameInputInvalidMessage": "Introduce un username válido",
    "passwordInputEmptyMessage": "Introduce una contraseña"
  },
  "home": {
    "mainTitle": "Inicio"
  },
  "highlights": {
    "mainTitle": "Favoritas y Calificadas",
    "menuOption": "F&R"
  },
  "watchlist": {
    "mainTitle": "Pendientes"
  },
  "favorites": {
    "mainTitle": "Favoritas"
  },
  "ratings": {
    "mainTitle": "Calificadas",
    "reviewsLabel": "calificaciones",
    "clearRating": "Borrar"
  },
  "publicLists": {
    "nowPlayingTitle": "En cartelera",
    "popularTitle": "Populares",
    "upcomingTitle": "Proximamente",
    "topRatedTitle": "Más valoradas"
  },
  "search": {
    "mainTitle": "Buscar",
    "yearInputLabel": "Año",
    "totalResultsLabel": "Resulados",
    "textPlaceholder": "¿Qué te apetece ver hoy?",
    "emptyResultsText": "No hay resultados \n para esta búsqueda"
  },
  "premieres": {
    "mainTitle": "Estrenos",
    "headline": "En cines desde el {date} en {country}",
    "showPremieresButton": "Ver estrenos"
  },
  "list": {
    "errorLoadingNewDataText": "Error cargando datos nuevos",
    "emptyResultsText": "No tienes películas guardadas",
    "errorText": "Error",
    "moviesResultsLabel": "Movies"
  },
  "movieItem": {
    "posterNotFound": "Poster no encontrado"
  },
  "movieDetails": {
    "movieRecommendationsLabel": "Te podría interesar",
    "originalTitleLabel": "Título original",
    "yearLabel": "Año",
    "durationLabel": "Duración",
    "countryLabel": "País",
    "productionCompaniesLabel": "Compañías",
    "castLabel": "Reparto",
    "directionLabel": "Direción",
    "screenplayLabel": "Guión",
    "musicLabel": "Música",
    "photographyLabel": "Fotografía"
  },
  "profile": {
    "mainTitle": "Mi perfil",
    "userIdLabel": "ID usuario",
    "goToWebButtonText": "Ver en Web",
    "logoutButtonText": "Cerrar sesión",
    "cancelLogoutButtonText": "Cancelar",
    "logoutModalQuestion": "¿Seguro que deseas salir?"
  },
  "theme": {
    "mainTitle": "Tema",
    "darkThemeLabel": "Oscuro",
    "lightThemeLabel": "Claro"
  },
  "language": {
    "mainTitle": "Idioma"
  },
  "helpAndFeedback": {
    "mainTitle": "Ayuda y Feedback",
    "contact": {
      "mainTitle": "Contactar con el desarrollador",
      "mailSubject": "Te invito a un café",
      "mailBody": "¡Hola! \n\nMe gustaría invitarte a un café virtual para charlar sobre My Movie Hub y ponernos en contacto. \n\n¡Espero tu respuesta! \n\nSaludos, [ Tu Nombre ]"
    },
    "feedback": {
      "mainTitle": "Reportar un bug / Sugerir una funcionalidad",
      "mailSubject": "Reporte de bug o solicitud de funcionalidad",
      "mailBody": "Hola, \n\nHe encontrado un problema en My Movie Hub que quiero reportar. Aquí están los detalles: \n[Descripción breve del bug o problema] \n\nDispositivo y versión del sistema operativo: \n[Información del dispositivo y versión del SO] \n\nO, \n\nTengo una idea para una nueva funcionalidad que podría ser genial para My Movie Hub: \n[Descripción de la funcionalidad sugerida] \n\nGracias por tu atención. \n\nSaludos, [ Tu Nombre ]"
    }
  },
  "about": {
    "mainTitle": "Acerca de",
    "openSourceLicenses": "Licencias Open Source",
    "attributionText": "Todos los metadatos de películas usados en My Movie Hub, incluyendo actores, directores, estudios, sinopsis, fechas de estreno y pósters son proporcionados por "
  },
  "orderType": {
    "ascendent": "Latest",
    "descendent": "Oldest"
  },
  "genres": {
    "action": "Acción",
    "adventure": "Aventura",
    "animation": "Animación",
    "comedy": "Comedia",
    "crime": "Crimen",
    "documentary": "Documental",
    "drama": "Drama",
    "family": "Familiar",
    "fantasy": "Fantasía",
    "history": "Historia",
    "horror": "Horror",
    "music": "Musica",
    "mystery": "Misterio",
    "romance": "Romance",
    "scienceFiction": "Ciencia ficción",
    "tvMovie": "TV Movie",
    "thriller": "Thriller",
    "war": "Guerra",
    "western": "Western"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "es": _es};
}
