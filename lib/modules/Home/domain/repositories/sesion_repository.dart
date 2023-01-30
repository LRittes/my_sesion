import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';

abstract class SesionRepository {
  Future<List<Sesion>> getSesions();

  Future<void> saveSesion(Sesion sesion);
}
