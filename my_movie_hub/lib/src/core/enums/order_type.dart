enum OrderType {
  asc,
  desc;

  @override
  String toString() {
    switch (this) {
      case asc:
        return 'Ascendent';
      case desc:
        return 'Descendent';
    }
  }

  String toApi() {
    switch (this) {
      case asc:
        return 'created_at.asc';
      case desc:
        return 'created_at.desc';
    }
  }
}
