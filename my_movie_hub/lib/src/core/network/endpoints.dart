class Endpoints {
  Endpoints._();

  /// environment
  static const String baseUrl = 'https://api.themoviedb.org/3';

  /// auth
  static const String createRequestToken = '/authentication/token/new';
  static const String validateRequestToken =
      '/authentication/token/validate_with_login';
  static const String createSession = '/authentication/session/new';
  static const String getAccount = '/account';

  /// account
  static const String favoriteMovies = '/account/favorite/movies';
  static const String watchlistMovies = '/account/watchlist/movies';
  static const String ratedMovies = '/account/rated/movies';
  static const String movieToWatchlist = '/account/watchlist';
  static const String movieToFavorites = '/account/favorite';
  static const String movieRating = '/account/rating';
  static const String accountStates = '/account_states';
}
