// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
      genres: json['genre_ids'] == null
          ? const []
          : _convertGenreIdsToGenres(json['genre_ids'] as List),
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
      'genre_ids': instance.genres.map((e) => _$MovieGenreEnumMap[e]!).toList(),
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

const _$MovieGenreEnumMap = {
  MovieGenre.action: 'action',
  MovieGenre.adventure: 'adventure',
  MovieGenre.animation: 'animation',
  MovieGenre.comedy: 'comedy',
  MovieGenre.crime: 'crime',
  MovieGenre.documentary: 'documentary',
  MovieGenre.drama: 'drama',
  MovieGenre.family: 'family',
  MovieGenre.fantasy: 'fantasy',
  MovieGenre.history: 'history',
  MovieGenre.horror: 'horror',
  MovieGenre.music: 'music',
  MovieGenre.mystery: 'mystery',
  MovieGenre.romance: 'romance',
  MovieGenre.scienceFiction: 'scienceFiction',
  MovieGenre.tvMovie: 'tvMovie',
  MovieGenre.thriller: 'thriller',
  MovieGenre.war: 'war',
  MovieGenre.western: 'western',
};

_$DetailedMovieImpl _$$DetailedMovieImplFromJson(Map<String, dynamic> json) =>
    _$DetailedMovieImpl(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
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
      credits: json['credits'] == null
          ? const Credits()
          : Credits.fromLimitedJson(json['credits'] as Map<String, dynamic>),
      budget: json['budget'] as int?,
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
      'credits': instance.credits,
      'budget': instance.budget,
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

_$CreditsImpl _$$CreditsImplFromJson(Map<String, dynamic> json) =>
    _$CreditsImpl(
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => CrewMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CreditsImplToJson(_$CreditsImpl instance) =>
    <String, dynamic>{
      'crew': instance.crew,
      'cast': instance.cast,
    };

_$CrewMemberImpl _$$CrewMemberImplFromJson(Map<String, dynamic> json) =>
    _$CrewMemberImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$$CrewMemberImplToJson(_$CrewMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'job': instance.job,
      'profilePath': instance.profilePath,
    };

_$CastMemberImpl _$$CastMemberImplFromJson(Map<String, dynamic> json) =>
    _$CastMemberImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      character: json['character'] as String?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$CastMemberImplToJson(_$CastMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
    };

_$ProductionCompanyImpl _$$ProductionCompanyImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionCompanyImpl(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$$ProductionCompanyImplToJson(
        _$ProductionCompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
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
      rated: _ratedFromJson(json['rated']),
    );

Map<String, dynamic> _$$AccountStatesImplToJson(_$AccountStatesImpl instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'watchlist': instance.watchlist,
      'rated': instance.rated,
    };
