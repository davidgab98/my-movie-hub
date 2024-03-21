import 'package:easy_localization/easy_localization.dart';

enum MovieGenre {
  action(28),
  adventure(12),
  animation(16),
  comedy(35),
  crime(80),
  documentary(99),
  drama(18),
  family(10751),
  fantasy(14),
  history(36),
  horror(27),
  music(10402),
  mystery(9648),
  romance(10749),
  scienceFiction(878),
  tvMovie(10770),
  thriller(53),
  war(10752),
  western(37);

  const MovieGenre(this.id);
  final int id;

  static MovieGenre? fromId(int id) {
    return MovieGenre.values.firstWhere((genre) => genre.id == id);
  }

  String toTranslatedString() {
    switch (this) {
      case MovieGenre.action:
        return 'genres.action'.tr();
      case MovieGenre.adventure:
        return 'genres.adventure'.tr();
      case MovieGenre.animation:
        return 'genres.animation'.tr();
      case MovieGenre.comedy:
        return 'genres.comedy'.tr();
      case MovieGenre.crime:
        return 'genres.crime'.tr();
      case MovieGenre.documentary:
        return 'genres.documentary'.tr();
      case MovieGenre.drama:
        return 'genres.drama'.tr();
      case MovieGenre.family:
        return 'genres.family'.tr();
      case MovieGenre.fantasy:
        return 'genres.fantasy'.tr();
      case MovieGenre.history:
        return 'genres.history'.tr();
      case MovieGenre.horror:
        return 'genres.horror'.tr();
      case MovieGenre.music:
        return 'genres.music'.tr();
      case MovieGenre.mystery:
        return 'genres.mystery'.tr();
      case MovieGenre.romance:
        return 'genres.romance'.tr();
      case MovieGenre.scienceFiction:
        return 'genres.scienceFiction'.tr();
      case MovieGenre.tvMovie:
        return 'genres.tvMovie'.tr();
      case MovieGenre.thriller:
        return 'genres.thriller'.tr();
      case MovieGenre.war:
        return 'genres.war'.tr();
      case MovieGenre.western:
        return 'genres.western'.tr();
    }
  }
}
