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
        return 'Acción';
      case MovieGenre.adventure:
        return 'Aventura';
      case MovieGenre.animation:
        return 'Animación';
      case MovieGenre.comedy:
        return 'Comedia';
      case MovieGenre.crime:
        return 'Crimen';
      case MovieGenre.documentary:
        return 'Documental';
      case MovieGenre.drama:
        return 'Drama';
      case MovieGenre.family:
        return 'Familiar';
      case MovieGenre.fantasy:
        return 'Fantasía';
      case MovieGenre.history:
        return 'Historia';
      case MovieGenre.horror:
        return 'Horror';
      case MovieGenre.music:
        return 'Musica';
      case MovieGenre.mystery:
        return 'Misterio';
      case MovieGenre.romance:
        return 'Romance';
      case MovieGenre.scienceFiction:
        return 'Ciencia ficción';
      case MovieGenre.tvMovie:
        return 'TV Movie';
      case MovieGenre.thriller:
        return 'Thriller';
      case MovieGenre.war:
        return 'Guerra';
      case MovieGenre.western:
        return 'Western';
    }
  }
}
