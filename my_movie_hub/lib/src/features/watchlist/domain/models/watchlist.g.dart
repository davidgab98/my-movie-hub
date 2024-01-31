// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchlistImpl _$$WatchlistImplFromJson(Map<String, dynamic> json) =>
    _$WatchlistImpl(
      movies: (json['results'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: json['total_pages'] as int? ?? 1,
      totalResults: json['total_results'] as int? ?? 0,
    );

Map<String, dynamic> _$$WatchlistImplToJson(_$WatchlistImpl instance) =>
    <String, dynamic>{
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
