class DeleteSesionException implements Exception {
  final String error;
  final String? stackTrace;

  DeleteSesionException(this.error, [this.stackTrace]);
}
