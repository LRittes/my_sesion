class SaveSesionException implements Exception {
  final String error;
  final String? stackTrace;

  SaveSesionException(this.error, [this.stackTrace]);
}
