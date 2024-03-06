import 'package:flutter/widgets.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

class IEvent {
  IEvent() {
    debugPrint('Emiting Event: ${toString()}');
  }
}

/// Auth Events
class LogOutEvent extends IEvent {
  LogOutEvent();
}

/// Movie-user States Events
class AddMovieToWatchlistEvent extends IEvent {
  final Movie movie;

  AddMovieToWatchlistEvent({required this.movie});
}

class RemoveMovieFromWatchlistEvent extends IEvent {
  final Movie movie;

  RemoveMovieFromWatchlistEvent({required this.movie});
}

class AddMovieToFavoritesEvent extends IEvent {
  final Movie movie;

  AddMovieToFavoritesEvent({required this.movie});
}

class RemoveMovieFromFavoritesEvent extends IEvent {
  final Movie movie;

  RemoveMovieFromFavoritesEvent({required this.movie});
}

class RateMovieEvent extends IEvent {
  final Movie movie;
  final double rate;

  RateMovieEvent({required this.movie, required this.rate});
}
