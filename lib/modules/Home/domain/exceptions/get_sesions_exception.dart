class GetSesionException implements Exception {
  final String error;
  final String? stackTrace;

  GetSesionException(this.error, [this.stackTrace]);
}
