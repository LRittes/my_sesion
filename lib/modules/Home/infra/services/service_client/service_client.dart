abstract class ServiceClient {
  Future<void> deleteSesion(Map<String, dynamic> sesion);

  Future<List<Map<String, dynamic>>> getSesions();

  Future<void> saveSesion(Map<String, dynamic> sesion);

  Future<void> updateSesion(Map<String, dynamic> sesion);
}
