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
  static const String logOut = '/authentication/session';

  /// user_lists
  static const String favoriteMovies = '/account/favorite/movies';
  static const String watchlistMovies = '/account/watchlist/movies';
  static const String ratedMovies = '/account/rated/movies';

  /// public_lists
  static const String popularMovies = '/movie/popular';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String topRatedMovies = '/movie/top_rated';
  static const String upcomingMovies = '/movie/upcoming';
  static const String trendingMovies = '/trending/movie';

  /// movie
  static const String recommendations = '/recommendations';

  /// movie_states
  static const String movieToWatchlist = '/account/watchlist';
  static const String movieToFavorites = '/account/favorite';
  static const String movieRate = 'rating';
  static const String accountStates = '/account_states';
}
