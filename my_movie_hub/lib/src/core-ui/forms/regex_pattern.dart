class RegexPattern {
  static final RegExp email = RegExp(
    r"^[\p{L}0-9.\p{L}0-9.!#$%&'*+-/=?^_`{|}~]+@[\p{L}0-9]+\.[\p{L}]+",
    unicode: true,
  );

  static final RegExp username = RegExp(
    r'^[A-Za-z0-9_.-]{0,20}$',
    unicode: true,
  );

  static final RegExp password = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!*?_+./])[A-Za-z\d!*?_+./]{8,16}$',
    unicode: true,
  );
}
