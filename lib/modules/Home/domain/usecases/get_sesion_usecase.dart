import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/get_sesions_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';

class GetSesionUseCase {
  final SesionRepository _repository;

  GetSesionUseCase(this._repository);

  Future<List<Sesion>> call() async {
    try {
      return await _repository.getSesions();
    } on GetSesionException {
      throw GetSesionException("Erro ao carregar Sesions");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
