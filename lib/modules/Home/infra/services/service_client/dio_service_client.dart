import 'package:dio/dio.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class DioServiceClient implements ServiceClient {
  final dio = Dio();
  @override
  Future<void> deleteSesion(Map<String, dynamic> sesion) async {
    try {
      await dio.delete(const String.fromEnvironment("url"), data: sesion);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSesions() async {
    try {
      List<Map<String, String>> result =
          (await dio.get(const String.fromEnvironment("url"))).data
              as List<Map<String, String>>;
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveSesion(Map<String, dynamic> sesion) {
    // TODO: implement saveSesion
    throw UnimplementedError();
  }

  @override
  Future<void> updateSesion(Map<String, dynamic> sesion) {
    // TODO: implement updateSesion
    throw UnimplementedError();
  }
}
