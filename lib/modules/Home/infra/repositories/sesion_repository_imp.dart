import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/exceptions.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class SesionRepositoryImp implements SesionRepository {
  final ServiceClient _service;

  SesionRepositoryImp(this._service);

  @override
  Future<void> deleteSesion(Sesion sesion) async {
    try {
      await _service.deleteSesion(SesionDTO.toMap(sesion));
    } on DeleteSesionException {
      throw DeleteSesionException("Erro ao deletar a sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Sesion>> getSesions() async {
    try {
      return (await _service.getSesions())
          .map((sesion) => SesionDTO.fromMap(sesion))
          .toList();
    } on GetSesionException {
      throw GetSesionException("Erro ao pegar as sesions!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveSesion(Sesion sesion) async {
    try {
      await _service.saveSesion(SesionDTO.toMap(sesion));
    } on SaveSesionException {
      throw SaveSesionException("Erro ao savar uma sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateSesion(Sesion sesion) async {
    try {
      await _service.updateSesion(SesionDTO.toMap(sesion));
    } on UpdateSesionException {
      throw UpdateSesionException("Erro ao atualizar a sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}