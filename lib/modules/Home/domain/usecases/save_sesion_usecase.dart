import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/SaveSesionException.dart';
import 'package:my_sesion/modules/Home/domain/repositories/save_sesion_repository.dart';

class SaveSesionUseCase {
  final SaveSesionRepository _repository;

  SaveSesionUseCase(this._repository);

  Future<void> call(Sesion sesion) async {
    try {
      await _repository.saveSesion(sesion);
    } on SaveSesionException catch (e) {
      throw SaveSesionException(e.error, e.stackTrace);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
