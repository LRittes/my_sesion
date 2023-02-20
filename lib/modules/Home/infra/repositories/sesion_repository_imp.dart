import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/exceptions.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';
import 'package:my_sesion/modules/Home/infra/datasources/datasource.dart';

class SesionRepositoryImp implements SesionRepository {
  final DataSource _service;

  SesionRepositoryImp(this._service);

  @override
  Future<void> deleteSesion(Sesion sesion) async {
    try {
      await _service.deleteSesion(SesionDTO.toMap(sesion));
    } on DeleteSesionException {
      throw DeleteSesionException("$runtimeType: Erro ao deletar a sesion!");
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
      throw SaveSesionException("$runtimeType: Erro ao savar uma sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateSesion(Sesion sesion) async {
    try {
      await _service.updateSesion(SesionDTO.toMap(sesion));
    } on UpdateSesionException {
      throw UpdateSesionException("$runtimeType: Erro ao atualizar a sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
