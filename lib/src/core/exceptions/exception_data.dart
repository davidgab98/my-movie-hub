class ExceptionData {
  ExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'ExceptionDetails(code: $code, message: $message)';
}
