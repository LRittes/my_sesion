import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/update_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';

class UpdateSesionUseCase {
  final SesionRepository _repository;

  UpdateSesionUseCase(this._repository);

  Future<void> call(Sesion sesion) async {
    try {
      await _repository.updateSesion(sesion);
    } on UpdateSesionException {
      throw UpdateSesionException("Erro ao atualizar sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
