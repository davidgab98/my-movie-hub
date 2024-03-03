// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      accountStates: json['account_states'] == null
          ? null
          : AccountStates.fromJson(
              json['account_states'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genreIds': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'account_states': instance.accountStates,
    };

_$DetailedMovieImpl _$$DetailedMovieImplFromJson(Map<String, dynamic> json) =>
    _$DetailedMovieImpl(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      accountStates: json['account_states'] == null
          ? null
          : AccountStates.fromJson(
              json['account_states'] as Map<String, dynamic>),
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$$DetailedMovieImplToJson(_$DetailedMovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genreIds': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'account_states': instance.accountStates,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
    };

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProductionCompanyImpl _$$ProductionCompanyImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionCompanyImpl(
      id: json['id'] as int,
      logoPath: json['logoPath'] as String?,
      name: json['name'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$$ProductionCompanyImplToJson(
        _$ProductionCompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };

_$ProductionCountryImpl _$$ProductionCountryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionCountryImpl(
      isoCode: json['iso_3166_1'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProductionCountryImplToJson(
        _$ProductionCountryImpl instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.isoCode,
      'name': instance.name,
    };

_$SpokenLanguageImpl _$$SpokenLanguageImplFromJson(Map<String, dynamic> json) =>
    _$SpokenLanguageImpl(
      isoCode: json['iso_639_1'] as String,
      name: json['name'] as String?,
      englishName: json['english_name'] as String?,
    );

Map<String, dynamic> _$$SpokenLanguageImplToJson(
        _$SpokenLanguageImpl instance) =>
    <String, dynamic>{
      'iso_639_1': instance.isoCode,
      'name': instance.name,
      'english_name': instance.englishName,
    };

_$AccountStatesImpl _$$AccountStatesImplFromJson(Map<String, dynamic> json) =>
    _$AccountStatesImpl(
      favorite: json['favorite'] as bool? ?? false,
      watchlist: json['watchlist'] as bool? ?? false,
      rating: _ratedFromJson(json['rating']),
    );

Map<String, dynamic> _$$AccountStatesImplToJson(_$AccountStatesImpl instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'watchlist': instance.watchlist,
      'rating': instance.rating,
    };