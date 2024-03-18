// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
    @Default([])
    List<MovieGenre> genres,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'release_date') @Default('') String releaseDate,
    @Default('') String title,
    @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
    @JsonKey(name: 'account_states') AccountStates? accountStates,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

List<MovieGenre> _convertGenreIdsToGenres(List<dynamic> genreIds) {
  return genreIds
      .whereType<int>()
      .map(MovieGenre.fromId)
      .whereType<MovieGenre>()
      .toList();
}

@freezed
class DetailedMovie with _$DetailedMovie {
  const factory DetailedMovie({
    required int id,
    @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'release_date') @Default('') String releaseDate,
    @Default('') String title,
    @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
    @JsonKey(name: 'account_states') AccountStates? accountStates,
    @JsonKey(fromJson: Credits.fromLimitedJson)
    @Default(Credits())
    Credits credits,
    int? budget,
    String? homepage,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'production_companies')
    List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries')
    List<ProductionCountry>? productionCountries,
    int? revenue,
    int? runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
  }) = _DetailedMovie;

  factory DetailedMovie.fromJson(Map<String, dynamic> json) =>
      _$DetailedMovieFromJson(json);

  factory DetailedMovie.fromMovie(Movie movie) {
    return DetailedMovie.fromJson({
      ...movie.toJson(),
    });
  }
}

List<MovieGenre> convertToJsonList(List<Map<String, dynamic>> genreMaps) {
  return genreMaps
      .map((genreMap) {
        // Aquí asumimos que 'id' siempre está presente y es un int.
        return MovieGenre.fromId(genreMap['id'] as int);
      })
      .whereType<MovieGenre>()
      .toList(); // Esto asegura que se filtren valores nulos si los hubiera.
}

@freezed
class Credits with _$Credits {
  const factory Credits({
    @Default([]) List<CrewMember> crew,
    @Default([]) List<CastMember> cast,
  }) = _Credits;

  const Credits._();

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  factory Credits.fromLimitedJson(Map<String, dynamic> json) {
    final credits = Credits.fromJson(json);

    final limitedCast =
        credits.cast.length > 10 ? credits.cast.sublist(0, 10) : credits.cast;

    final limitedCrew = credits.crew.where((member) {
      return [
        'Screenplay',
        'Director',
        'Director of Photography',
        'Original Music Composer',
      ].contains(member.job);
    }).toList();

    return credits.copyWith(cast: limitedCast, crew: limitedCrew);
  }
}

@freezed
class CrewMember with _$CrewMember {
  const factory CrewMember({
    required int id,
    required String name,
    required String department,
    required String job,
    String? profilePath,
  }) = _CrewMember;

  factory CrewMember.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberFromJson(json);
}

@freezed
class CastMember with _$CastMember {
  const factory CastMember({
    required int id,
    required String name,
    String? character,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CastMember;

  factory CastMember.fromJson(Map<String, dynamic> json) =>
      _$CastMemberFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    String? name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') required String isoCode,
    String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'iso_639_1') required String isoCode,
    String? name,
    @JsonKey(name: 'english_name') String? englishName,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

@freezed
class AccountStates with _$AccountStates {
  const factory AccountStates({
    @Default(false) bool favorite,
    @Default(false) bool watchlist,
    @JsonKey(fromJson: _ratedFromJson) double? rated,
  }) = _AccountStates;

  factory AccountStates.fromJson(Map<String, dynamic> json) =>
      _$AccountStatesFromJson(json);
}

double? _ratedFromJson(dynamic json) {
  if (json is bool) {
    return null;
  } else if (json is Map<String, dynamic>) {
    return json['value'] as double?;
  } else {
    return null;
  }
}
