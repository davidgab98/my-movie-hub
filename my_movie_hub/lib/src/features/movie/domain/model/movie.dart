// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @Default(false) bool adult,
    @Default('') String backdropPath,
    @Default([]) List<int> genreIds,
    @Default('') String originalLanguage,
    @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @Default('') String posterPath,
    @Default('') String releaseDate,
    @Default('') String title,
    @Default(false) bool video,
    @Default(0.0) double voteAverage,
    @Default(0) int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@freezed
class DetailedMovie with _$DetailedMovie {
  const factory DetailedMovie({
    required int id,
    @Default(false) bool adult,
    @Default('') String backdropPath,
    @Default([]) List<int> genreIds,
    @Default('') String originalLanguage,
    @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @Default('') String posterPath,
    @Default('') String releaseDate,
    @Default('') String title,
    @Default(false) bool video,
    @Default(0.0) double voteAverage,
    @Default(0) int voteCount,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    String? imdbId,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
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

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    String? logoPath,
    String? name,
    String? originCountry,
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
