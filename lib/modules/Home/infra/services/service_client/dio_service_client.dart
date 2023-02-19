import 'package:dio/dio.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class DioServiceClient implements ServiceClient {
  final dio = Dio();
  @override
  Future<void> deleteSesion(Map<String, dynamic> sesion) async {
    try {
      await dio
          .delete("${const String.fromEnvironment("url")}/${sesion['data']}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSesions() async {
    try {
      List result = (await dio.get(const String.fromEnvironment("url"))).data;
      final list = result.map((item) => item.cast<String, String>()).toList();

      return <Map<String, dynamic>>[...list];
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
