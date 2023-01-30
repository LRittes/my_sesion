import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/save_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';

class SaveSesionUseCase {
  final SesionRepository _repository;

  SaveSesionUseCase(this._repository);

  Future<void> call(Sesion sesion) async {
    try {
      await _repository.saveSesion(sesion);
    } on SaveSesionException {
      throw SaveSesionException("Erro ao salvar sesion!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
