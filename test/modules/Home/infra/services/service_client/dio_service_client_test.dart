import 'package:flutter_test/flutter_test.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/dio_service_client.dart';

void main() {
  test(
      "Should return a list of Map<String, dynamic> from dio service client's get",
      () async {
    final dio = DioServiceClient();
    var list = await dio.getSesions();
    expect(list, isA<List<Map<String, dynamic>>>());
  });
}
