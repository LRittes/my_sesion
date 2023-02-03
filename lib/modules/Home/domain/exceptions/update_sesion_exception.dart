class UpdateSesionException implements Exception {
  final String error;
  final String? stackTrace;

  UpdateSesionException(this.error, [this.stackTrace]);
}
