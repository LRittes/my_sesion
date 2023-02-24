import 'package:my_sesion/modules/Home/domain/exceptions/exceptions.dart';
import 'package:my_sesion/modules/Home/infra/datasources/datasource.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class LocalApiDataSource extends DataSource {
  final ServiceClient _service;

  LocalApiDataSource(this._service);

  @override
  Future<void> deleteSesion(Map<String, dynamic> sesion) async {
    try {
      await _service.deleteSesion(sesion);
    } on DeleteSesionException {
      throw DeleteSesionException("Erro ao deletar a sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSesions() async {
    try {
      return await _service.getSesions();
    } on GetSesionException {
      throw GetSesionException("Erro ao pegar as sesions!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveSesion(Map<String, dynamic> sesion) async {
    try {
      await _service.saveSesion(sesion);
    } on SaveSesionException {
      throw SaveSesionException("Erro ao savar uma sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateSesion(Map<String, dynamic> sesion) async {
    try {
      await _service.updateSesion(sesion);
    } on UpdateSesionException {
      throw UpdateSesionException("Erro ao atualizar a sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
