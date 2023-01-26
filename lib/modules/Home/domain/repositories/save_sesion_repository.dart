import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';

abstract class SaveSesionRepository {
  Future<void> saveSesion(Sesion sesion);
}
