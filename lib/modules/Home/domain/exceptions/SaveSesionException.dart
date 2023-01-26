class SaveSesionException implements Exception {
  final String error;
  String? stackTrace;

  SaveSesionException(this.error, [this.stackTrace]);
}
