// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  int get id => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
  List<MovieGenre> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {int id,
      bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
      List<MovieGenre> genres,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? backdropPath = null,
    Object? genres = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = null,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
      List<MovieGenre> genres,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? backdropPath = null,
    Object? genres = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = null,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_$MovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl(
      {required this.id,
      this.adult = false,
      @JsonKey(name: 'backdrop_path') this.backdropPath = '',
      @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
      final List<MovieGenre> genres = const [],
      @JsonKey(name: 'original_language') this.originalLanguage = '',
      @JsonKey(name: 'original_title') this.originalTitle = '',
      this.overview = '',
      this.popularity = 0.0,
      @JsonKey(name: 'poster_path') this.posterPath = '',
      @JsonKey(name: 'release_date') this.releaseDate = '',
      this.title = '',
      this.video = false,
      @JsonKey(name: 'vote_average') this.voteAverage = 0.0,
      @JsonKey(name: 'vote_count') this.voteCount = 0})
      : _genres = genres;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final List<MovieGenre> _genres;
  @override
  @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
  List<MovieGenre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey()
  final String overview;
  @override
  @JsonKey()
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'Movie(id: $id, adult: $adult, backdropPath: $backdropPath, genres: $genres, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      adult,
      backdropPath,
      const DeepCollectionEquality().hash(_genres),
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final int id,
      final bool adult,
      @JsonKey(name: 'backdrop_path') final String backdropPath,
      @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
      final List<MovieGenre> genres,
      @JsonKey(name: 'original_language') final String originalLanguage,
      @JsonKey(name: 'original_title') final String originalTitle,
      final String overview,
      final double popularity,
      @JsonKey(name: 'poster_path') final String posterPath,
      @JsonKey(name: 'release_date') final String releaseDate,
      final String title,
      final bool video,
      @JsonKey(name: 'vote_average') final double voteAverage,
      @JsonKey(name: 'vote_count') final int voteCount}) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  int get id;
  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @override
  @JsonKey(name: 'genre_ids', fromJson: _convertGenreIdsToGenres)
  List<MovieGenre> get genres;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  String get title;
  @override
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailedMovie _$DetailedMovieFromJson(Map<String, dynamic> json) {
  return _DetailedMovie.fromJson(json);
}

/// @nodoc
mixin _$DetailedMovie {
  int get id => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Credits.fromLimitedJson)
  Credits get credits => throw _privateConstructorUsedError;
  int? get budget => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdb_id')
  String? get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries =>
      throw _privateConstructorUsedError;
  int? get revenue => throw _privateConstructorUsedError;
  int? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedMovieCopyWith<DetailedMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedMovieCopyWith<$Res> {
  factory $DetailedMovieCopyWith(
          DetailedMovie value, $Res Function(DetailedMovie) then) =
      _$DetailedMovieCopyWithImpl<$Res, DetailedMovie>;
  @useResult
  $Res call(
      {int id,
      bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'account_states') AccountStates? accountStates,
      @JsonKey(fromJson: Credits.fromLimitedJson) Credits credits,
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
      String? tagline});

  $AccountStatesCopyWith<$Res>? get accountStates;
  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class _$DetailedMovieCopyWithImpl<$Res, $Val extends DetailedMovie>
    implements $DetailedMovieCopyWith<$Res> {
  _$DetailedMovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? backdropPath = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = null,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? accountStates = freezed,
    Object? credits = null,
    Object? budget = freezed,
    Object? homepage = freezed,
    Object? imdbId = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? revenue = freezed,
    Object? runtime = freezed,
    Object? spokenLanguages = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value.productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      spokenLanguages: freezed == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountStatesCopyWith<$Res>? get accountStates {
    if (_value.accountStates == null) {
      return null;
    }

    return $AccountStatesCopyWith<$Res>(_value.accountStates!, (value) {
      return _then(_value.copyWith(accountStates: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditsCopyWith<$Res> get credits {
    return $CreditsCopyWith<$Res>(_value.credits, (value) {
      return _then(_value.copyWith(credits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailedMovieImplCopyWith<$Res>
    implements $DetailedMovieCopyWith<$Res> {
  factory _$$DetailedMovieImplCopyWith(
          _$DetailedMovieImpl value, $Res Function(_$DetailedMovieImpl) then) =
      __$$DetailedMovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      String title,
      bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'account_states') AccountStates? accountStates,
      @JsonKey(fromJson: Credits.fromLimitedJson) Credits credits,
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
      String? tagline});

  @override
  $AccountStatesCopyWith<$Res>? get accountStates;
  @override
  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class __$$DetailedMovieImplCopyWithImpl<$Res>
    extends _$DetailedMovieCopyWithImpl<$Res, _$DetailedMovieImpl>
    implements _$$DetailedMovieImplCopyWith<$Res> {
  __$$DetailedMovieImplCopyWithImpl(
      _$DetailedMovieImpl _value, $Res Function(_$DetailedMovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adult = null,
    Object? backdropPath = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = null,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? accountStates = freezed,
    Object? credits = null,
    Object? budget = freezed,
    Object? homepage = freezed,
    Object? imdbId = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? revenue = freezed,
    Object? runtime = freezed,
    Object? spokenLanguages = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
  }) {
    return _then(_$DetailedMovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value._productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      spokenLanguages: freezed == spokenLanguages
          ? _value._spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedMovieImpl implements _DetailedMovie {
  const _$DetailedMovieImpl(
      {required this.id,
      this.adult = false,
      @JsonKey(name: 'backdrop_path') this.backdropPath = '',
      @JsonKey(name: 'original_language') this.originalLanguage = '',
      @JsonKey(name: 'original_title') this.originalTitle = '',
      this.overview = '',
      this.popularity = 0.0,
      @JsonKey(name: 'poster_path') this.posterPath = '',
      @JsonKey(name: 'release_date') this.releaseDate = '',
      this.title = '',
      this.video = false,
      @JsonKey(name: 'vote_average') this.voteAverage = 0.0,
      @JsonKey(name: 'vote_count') this.voteCount = 0,
      @JsonKey(name: 'account_states') this.accountStates,
      @JsonKey(fromJson: Credits.fromLimitedJson)
      this.credits = const Credits(),
      this.budget,
      this.homepage,
      @JsonKey(name: 'imdb_id') this.imdbId,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      this.revenue,
      this.runtime,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      this.status,
      this.tagline})
      : _productionCompanies = productionCompanies,
        _productionCountries = productionCountries,
        _spokenLanguages = spokenLanguages;

  factory _$DetailedMovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedMovieImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey()
  final String overview;
  @override
  @JsonKey()
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @override
  @JsonKey(name: 'account_states')
  final AccountStates? accountStates;
  @override
  @JsonKey(fromJson: Credits.fromLimitedJson)
  final Credits credits;
  @override
  final int? budget;
  @override
  final String? homepage;
  @override
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  final List<ProductionCompany>? _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies {
    final value = _productionCompanies;
    if (value == null) return null;
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductionCountry>? _productionCountries;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries {
    final value = _productionCountries;
    if (value == null) return null;
    if (_productionCountries is EqualUnmodifiableListView)
      return _productionCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? revenue;
  @override
  final int? runtime;
  final List<SpokenLanguage>? _spokenLanguages;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages {
    final value = _spokenLanguages;
    if (value == null) return null;
    if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? tagline;

  @override
  String toString() {
    return 'DetailedMovie(id: $id, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, accountStates: $accountStates, credits: $credits, budget: $budget, homepage: $homepage, imdbId: $imdbId, productionCompanies: $productionCompanies, productionCountries: $productionCountries, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedMovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.accountStates, accountStates) ||
                other.accountStates == accountStates) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies) &&
            const DeepCollectionEquality()
                .equals(other._productionCountries, _productionCountries) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            const DeepCollectionEquality()
                .equals(other._spokenLanguages, _spokenLanguages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        accountStates,
        credits,
        budget,
        homepage,
        imdbId,
        const DeepCollectionEquality().hash(_productionCompanies),
        const DeepCollectionEquality().hash(_productionCountries),
        revenue,
        runtime,
        const DeepCollectionEquality().hash(_spokenLanguages),
        status,
        tagline
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedMovieImplCopyWith<_$DetailedMovieImpl> get copyWith =>
      __$$DetailedMovieImplCopyWithImpl<_$DetailedMovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedMovieImplToJson(
      this,
    );
  }
}

abstract class _DetailedMovie implements DetailedMovie {
  const factory _DetailedMovie(
      {required final int id,
      final bool adult,
      @JsonKey(name: 'backdrop_path') final String backdropPath,
      @JsonKey(name: 'original_language') final String originalLanguage,
      @JsonKey(name: 'original_title') final String originalTitle,
      final String overview,
      final double popularity,
      @JsonKey(name: 'poster_path') final String posterPath,
      @JsonKey(name: 'release_date') final String releaseDate,
      final String title,
      final bool video,
      @JsonKey(name: 'vote_average') final double voteAverage,
      @JsonKey(name: 'vote_count') final int voteCount,
      @JsonKey(name: 'account_states') final AccountStates? accountStates,
      @JsonKey(fromJson: Credits.fromLimitedJson) final Credits credits,
      final int? budget,
      final String? homepage,
      @JsonKey(name: 'imdb_id') final String? imdbId,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      final int? revenue,
      final int? runtime,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      final String? status,
      final String? tagline}) = _$DetailedMovieImpl;

  factory _DetailedMovie.fromJson(Map<String, dynamic> json) =
      _$DetailedMovieImpl.fromJson;

  @override
  int get id;
  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  String get title;
  @override
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(name: 'account_states')
  AccountStates? get accountStates;
  @override
  @JsonKey(fromJson: Credits.fromLimitedJson)
  Credits get credits;
  @override
  int? get budget;
  @override
  String? get homepage;
  @override
  @JsonKey(name: 'imdb_id')
  String? get imdbId;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries;
  @override
  int? get revenue;
  @override
  int? get runtime;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages;
  @override
  String? get status;
  @override
  String? get tagline;
  @override
  @JsonKey(ignore: true)
  _$$DetailedMovieImplCopyWith<_$DetailedMovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return _Credits.fromJson(json);
}

/// @nodoc
mixin _$Credits {
  List<CrewMember> get crew => throw _privateConstructorUsedError;
  List<CastMember> get cast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditsCopyWith<Credits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditsCopyWith<$Res> {
  factory $CreditsCopyWith(Credits value, $Res Function(Credits) then) =
      _$CreditsCopyWithImpl<$Res, Credits>;
  @useResult
  $Res call({List<CrewMember> crew, List<CastMember> cast});
}

/// @nodoc
class _$CreditsCopyWithImpl<$Res, $Val extends Credits>
    implements $CreditsCopyWith<$Res> {
  _$CreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crew = null,
    Object? cast = null,
  }) {
    return _then(_value.copyWith(
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewMember>,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditsImplCopyWith<$Res> implements $CreditsCopyWith<$Res> {
  factory _$$CreditsImplCopyWith(
          _$CreditsImpl value, $Res Function(_$CreditsImpl) then) =
      __$$CreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CrewMember> crew, List<CastMember> cast});
}

/// @nodoc
class __$$CreditsImplCopyWithImpl<$Res>
    extends _$CreditsCopyWithImpl<$Res, _$CreditsImpl>
    implements _$$CreditsImplCopyWith<$Res> {
  __$$CreditsImplCopyWithImpl(
      _$CreditsImpl _value, $Res Function(_$CreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crew = null,
    Object? cast = null,
  }) {
    return _then(_$CreditsImpl(
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewMember>,
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastMember>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditsImpl extends _Credits {
  const _$CreditsImpl(
      {final List<CrewMember> crew = const [],
      final List<CastMember> cast = const []})
      : _crew = crew,
        _cast = cast,
        super._();

  factory _$CreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditsImplFromJson(json);

  final List<CrewMember> _crew;
  @override
  @JsonKey()
  List<CrewMember> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  final List<CastMember> _cast;
  @override
  @JsonKey()
  List<CastMember> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  @override
  String toString() {
    return 'Credits(crew: $crew, cast: $cast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditsImpl &&
            const DeepCollectionEquality().equals(other._crew, _crew) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_crew),
      const DeepCollectionEquality().hash(_cast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      __$$CreditsImplCopyWithImpl<_$CreditsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditsImplToJson(
      this,
    );
  }
}

abstract class _Credits extends Credits {
  const factory _Credits(
      {final List<CrewMember> crew,
      final List<CastMember> cast}) = _$CreditsImpl;
  const _Credits._() : super._();

  factory _Credits.fromJson(Map<String, dynamic> json) = _$CreditsImpl.fromJson;

  @override
  List<CrewMember> get crew;
  @override
  List<CastMember> get cast;
  @override
  @JsonKey(ignore: true)
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) {
  return _CrewMember.fromJson(json);
}

/// @nodoc
mixin _$CrewMember {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrewMemberCopyWith<CrewMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewMemberCopyWith<$Res> {
  factory $CrewMemberCopyWith(
          CrewMember value, $Res Function(CrewMember) then) =
      _$CrewMemberCopyWithImpl<$Res, CrewMember>;
  @useResult
  $Res call(
      {int id,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class _$CrewMemberCopyWithImpl<$Res, $Val extends CrewMember>
    implements $CrewMemberCopyWith<$Res> {
  _$CrewMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewMemberImplCopyWith<$Res>
    implements $CrewMemberCopyWith<$Res> {
  factory _$$CrewMemberImplCopyWith(
          _$CrewMemberImpl value, $Res Function(_$CrewMemberImpl) then) =
      __$$CrewMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class __$$CrewMemberImplCopyWithImpl<$Res>
    extends _$CrewMemberCopyWithImpl<$Res, _$CrewMemberImpl>
    implements _$$CrewMemberImplCopyWith<$Res> {
  __$$CrewMemberImplCopyWithImpl(
      _$CrewMemberImpl _value, $Res Function(_$CrewMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$CrewMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrewMemberImpl implements _CrewMember {
  const _$CrewMemberImpl(
      {required this.id,
      required this.name,
      required this.department,
      required this.job,
      this.profilePath});

  factory _$CrewMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrewMemberImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String department;
  @override
  final String job;
  @override
  final String? profilePath;

  @override
  String toString() {
    return 'CrewMember(id: $id, name: $name, department: $department, job: $job, profilePath: $profilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, department, job, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewMemberImplCopyWith<_$CrewMemberImpl> get copyWith =>
      __$$CrewMemberImplCopyWithImpl<_$CrewMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrewMemberImplToJson(
      this,
    );
  }
}

abstract class _CrewMember implements CrewMember {
  const factory _CrewMember(
      {required final int id,
      required final String name,
      required final String department,
      required final String job,
      final String? profilePath}) = _$CrewMemberImpl;

  factory _CrewMember.fromJson(Map<String, dynamic> json) =
      _$CrewMemberImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get department;
  @override
  String get job;
  @override
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$CrewMemberImplCopyWith<_$CrewMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CastMember _$CastMemberFromJson(Map<String, dynamic> json) {
  return _CastMember.fromJson(json);
}

/// @nodoc
mixin _$CastMember {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastMemberCopyWith<CastMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastMemberCopyWith<$Res> {
  factory $CastMemberCopyWith(
          CastMember value, $Res Function(CastMember) then) =
      _$CastMemberCopyWithImpl<$Res, CastMember>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? character,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class _$CastMemberCopyWithImpl<$Res, $Val extends CastMember>
    implements $CastMemberCopyWith<$Res> {
  _$CastMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastMemberImplCopyWith<$Res>
    implements $CastMemberCopyWith<$Res> {
  factory _$$CastMemberImplCopyWith(
          _$CastMemberImpl value, $Res Function(_$CastMemberImpl) then) =
      __$$CastMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? character,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class __$$CastMemberImplCopyWithImpl<$Res>
    extends _$CastMemberCopyWithImpl<$Res, _$CastMemberImpl>
    implements _$$CastMemberImplCopyWith<$Res> {
  __$$CastMemberImplCopyWithImpl(
      _$CastMemberImpl _value, $Res Function(_$CastMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? profilePath = freezed,
  }) {
    return _then(_$CastMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastMemberImpl implements _CastMember {
  const _$CastMemberImpl(
      {required this.id,
      required this.name,
      this.character,
      @JsonKey(name: 'profile_path') this.profilePath});

  factory _$CastMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastMemberImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? character;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @override
  String toString() {
    return 'CastMember(id: $id, name: $name, character: $character, profilePath: $profilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, character, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastMemberImplCopyWith<_$CastMemberImpl> get copyWith =>
      __$$CastMemberImplCopyWithImpl<_$CastMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastMemberImplToJson(
      this,
    );
  }
}

abstract class _CastMember implements CastMember {
  const factory _CastMember(
          {required final int id,
          required final String name,
          final String? character,
          @JsonKey(name: 'profile_path') final String? profilePath}) =
      _$CastMemberImpl;

  factory _CastMember.fromJson(Map<String, dynamic> json) =
      _$CastMemberImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get character;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$CastMemberImplCopyWith<_$CastMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return _ProductionCompany.fromJson(json);
}

/// @nodoc
mixin _$ProductionCompany {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_path')
  String? get logoPath => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  String? get originCountry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCompanyCopyWith<ProductionCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCompanyCopyWith<$Res> {
  factory $ProductionCompanyCopyWith(
          ProductionCompany value, $Res Function(ProductionCompany) then) =
      _$ProductionCompanyCopyWithImpl<$Res, ProductionCompany>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String? name,
      @JsonKey(name: 'origin_country') String? originCountry});
}

/// @nodoc
class _$ProductionCompanyCopyWithImpl<$Res, $Val extends ProductionCompany>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = freezed,
    Object? originCountry = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionCompanyImplCopyWith<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  factory _$$ProductionCompanyImplCopyWith(_$ProductionCompanyImpl value,
          $Res Function(_$ProductionCompanyImpl) then) =
      __$$ProductionCompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String? name,
      @JsonKey(name: 'origin_country') String? originCountry});
}

/// @nodoc
class __$$ProductionCompanyImplCopyWithImpl<$Res>
    extends _$ProductionCompanyCopyWithImpl<$Res, _$ProductionCompanyImpl>
    implements _$$ProductionCompanyImplCopyWith<$Res> {
  __$$ProductionCompanyImplCopyWithImpl(_$ProductionCompanyImpl _value,
      $Res Function(_$ProductionCompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = freezed,
    Object? originCountry = freezed,
  }) {
    return _then(_$ProductionCompanyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionCompanyImpl implements _ProductionCompany {
  const _$ProductionCompanyImpl(
      {required this.id,
      @JsonKey(name: 'logo_path') this.logoPath,
      this.name,
      @JsonKey(name: 'origin_country') this.originCountry});

  factory _$ProductionCompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionCompanyImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @override
  final String? name;
  @override
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionCompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, logoPath, name, originCountry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionCompanyImplCopyWith<_$ProductionCompanyImpl> get copyWith =>
      __$$ProductionCompanyImplCopyWithImpl<_$ProductionCompanyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionCompanyImplToJson(
      this,
    );
  }
}

abstract class _ProductionCompany implements ProductionCompany {
  const factory _ProductionCompany(
          {required final int id,
          @JsonKey(name: 'logo_path') final String? logoPath,
          final String? name,
          @JsonKey(name: 'origin_country') final String? originCountry}) =
      _$ProductionCompanyImpl;

  factory _ProductionCompany.fromJson(Map<String, dynamic> json) =
      _$ProductionCompanyImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'logo_path')
  String? get logoPath;
  @override
  String? get name;
  @override
  @JsonKey(name: 'origin_country')
  String? get originCountry;
  @override
  @JsonKey(ignore: true)
  _$$ProductionCompanyImplCopyWith<_$ProductionCompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return _ProductionCountry.fromJson(json);
}

/// @nodoc
mixin _$ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String get isoCode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCountryCopyWith<ProductionCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCountryCopyWith<$Res> {
  factory $ProductionCountryCopyWith(
          ProductionCountry value, $Res Function(ProductionCountry) then) =
      _$ProductionCountryCopyWithImpl<$Res, ProductionCountry>;
  @useResult
  $Res call({@JsonKey(name: 'iso_3166_1') String isoCode, String? name});
}

/// @nodoc
class _$ProductionCountryCopyWithImpl<$Res, $Val extends ProductionCountry>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoCode = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionCountryImplCopyWith<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  factory _$$ProductionCountryImplCopyWith(_$ProductionCountryImpl value,
          $Res Function(_$ProductionCountryImpl) then) =
      __$$ProductionCountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'iso_3166_1') String isoCode, String? name});
}

/// @nodoc
class __$$ProductionCountryImplCopyWithImpl<$Res>
    extends _$ProductionCountryCopyWithImpl<$Res, _$ProductionCountryImpl>
    implements _$$ProductionCountryImplCopyWith<$Res> {
  __$$ProductionCountryImplCopyWithImpl(_$ProductionCountryImpl _value,
      $Res Function(_$ProductionCountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoCode = null,
    Object? name = freezed,
  }) {
    return _then(_$ProductionCountryImpl(
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionCountryImpl implements _ProductionCountry {
  const _$ProductionCountryImpl(
      {@JsonKey(name: 'iso_3166_1') required this.isoCode, this.name});

  factory _$ProductionCountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionCountryImplFromJson(json);

  @override
  @JsonKey(name: 'iso_3166_1')
  final String isoCode;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProductionCountry(isoCode: $isoCode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionCountryImpl &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isoCode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionCountryImplCopyWith<_$ProductionCountryImpl> get copyWith =>
      __$$ProductionCountryImplCopyWithImpl<_$ProductionCountryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionCountryImplToJson(
      this,
    );
  }
}

abstract class _ProductionCountry implements ProductionCountry {
  const factory _ProductionCountry(
      {@JsonKey(name: 'iso_3166_1') required final String isoCode,
      final String? name}) = _$ProductionCountryImpl;

  factory _ProductionCountry.fromJson(Map<String, dynamic> json) =
      _$ProductionCountryImpl.fromJson;

  @override
  @JsonKey(name: 'iso_3166_1')
  String get isoCode;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductionCountryImplCopyWith<_$ProductionCountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

/// @nodoc
mixin _$SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  String get isoCode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'english_name')
  String? get englishName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res, SpokenLanguage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_639_1') String isoCode,
      String? name,
      @JsonKey(name: 'english_name') String? englishName});
}

/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res, $Val extends SpokenLanguage>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoCode = null,
    Object? name = freezed,
    Object? englishName = freezed,
  }) {
    return _then(_value.copyWith(
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpokenLanguageImplCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$$SpokenLanguageImplCopyWith(_$SpokenLanguageImpl value,
          $Res Function(_$SpokenLanguageImpl) then) =
      __$$SpokenLanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_639_1') String isoCode,
      String? name,
      @JsonKey(name: 'english_name') String? englishName});
}

/// @nodoc
class __$$SpokenLanguageImplCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res, _$SpokenLanguageImpl>
    implements _$$SpokenLanguageImplCopyWith<$Res> {
  __$$SpokenLanguageImplCopyWithImpl(
      _$SpokenLanguageImpl _value, $Res Function(_$SpokenLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isoCode = null,
    Object? name = freezed,
    Object? englishName = freezed,
  }) {
    return _then(_$SpokenLanguageImpl(
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpokenLanguageImpl implements _SpokenLanguage {
  const _$SpokenLanguageImpl(
      {@JsonKey(name: 'iso_639_1') required this.isoCode,
      this.name,
      @JsonKey(name: 'english_name') this.englishName});

  factory _$SpokenLanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpokenLanguageImplFromJson(json);

  @override
  @JsonKey(name: 'iso_639_1')
  final String isoCode;
  @override
  final String? name;
  @override
  @JsonKey(name: 'english_name')
  final String? englishName;

  @override
  String toString() {
    return 'SpokenLanguage(isoCode: $isoCode, name: $name, englishName: $englishName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpokenLanguageImpl &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isoCode, name, englishName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      __$$SpokenLanguageImplCopyWithImpl<_$SpokenLanguageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpokenLanguageImplToJson(
      this,
    );
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  const factory _SpokenLanguage(
          {@JsonKey(name: 'iso_639_1') required final String isoCode,
          final String? name,
          @JsonKey(name: 'english_name') final String? englishName}) =
      _$SpokenLanguageImpl;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$SpokenLanguageImpl.fromJson;

  @override
  @JsonKey(name: 'iso_639_1')
  String get isoCode;
  @override
  String? get name;
  @override
  @JsonKey(name: 'english_name')
  String? get englishName;
  @override
  @JsonKey(ignore: true)
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountStates _$AccountStatesFromJson(Map<String, dynamic> json) {
  return _AccountStates.fromJson(json);
}

/// @nodoc
mixin _$AccountStates {
  bool get favorite => throw _privateConstructorUsedError;
  bool get watchlist => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _ratedFromJson)
  int? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountStatesCopyWith<AccountStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStatesCopyWith<$Res> {
  factory $AccountStatesCopyWith(
          AccountStates value, $Res Function(AccountStates) then) =
      _$AccountStatesCopyWithImpl<$Res, AccountStates>;
  @useResult
  $Res call(
      {bool favorite,
      bool watchlist,
      @JsonKey(fromJson: _ratedFromJson) int? rating});
}

/// @nodoc
class _$AccountStatesCopyWithImpl<$Res, $Val extends AccountStates>
    implements $AccountStatesCopyWith<$Res> {
  _$AccountStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? watchlist = null,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountStatesImplCopyWith<$Res>
    implements $AccountStatesCopyWith<$Res> {
  factory _$$AccountStatesImplCopyWith(
          _$AccountStatesImpl value, $Res Function(_$AccountStatesImpl) then) =
      __$$AccountStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool favorite,
      bool watchlist,
      @JsonKey(fromJson: _ratedFromJson) int? rating});
}

/// @nodoc
class __$$AccountStatesImplCopyWithImpl<$Res>
    extends _$AccountStatesCopyWithImpl<$Res, _$AccountStatesImpl>
    implements _$$AccountStatesImplCopyWith<$Res> {
  __$$AccountStatesImplCopyWithImpl(
      _$AccountStatesImpl _value, $Res Function(_$AccountStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? watchlist = null,
    Object? rating = freezed,
  }) {
    return _then(_$AccountStatesImpl(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountStatesImpl implements _AccountStates {
  const _$AccountStatesImpl(
      {this.favorite = false,
      this.watchlist = false,
      @JsonKey(fromJson: _ratedFromJson) this.rating});

  factory _$AccountStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountStatesImplFromJson(json);

  @override
  @JsonKey()
  final bool favorite;
  @override
  @JsonKey()
  final bool watchlist;
  @override
  @JsonKey(fromJson: _ratedFromJson)
  final int? rating;

  @override
  String toString() {
    return 'AccountStates(favorite: $favorite, watchlist: $watchlist, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStatesImpl &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.watchlist, watchlist) ||
                other.watchlist == watchlist) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, favorite, watchlist, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStatesImplCopyWith<_$AccountStatesImpl> get copyWith =>
      __$$AccountStatesImplCopyWithImpl<_$AccountStatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountStatesImplToJson(
      this,
    );
  }
}

abstract class _AccountStates implements AccountStates {
  const factory _AccountStates(
          {final bool favorite,
          final bool watchlist,
          @JsonKey(fromJson: _ratedFromJson) final int? rating}) =
      _$AccountStatesImpl;

  factory _AccountStates.fromJson(Map<String, dynamic> json) =
      _$AccountStatesImpl.fromJson;

  @override
  bool get favorite;
  @override
  bool get watchlist;
  @override
  @JsonKey(fromJson: _ratedFromJson)
  int? get rating;
  @override
  @JsonKey(ignore: true)
  _$$AccountStatesImplCopyWith<_$AccountStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
