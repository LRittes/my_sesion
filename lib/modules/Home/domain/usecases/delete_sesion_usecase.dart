import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/delete_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';

class DeleteSesionUseCase {
  final SesionRepository _repository;

  DeleteSesionUseCase(this._repository);

  Future<void> call(Sesion sesion) async {
    try {
      await _repository.deleteSesion(sesion);
    } on DeleteSesionException {
      throw DeleteSesionException("Error ao deletar uma seison!");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
