import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';

abstract class SesionState {}

class SesionStateInitial implements SesionState {
  final List<Sesion> sesions = [];
}

class SesionStateLoading implements SesionState {
  final String message = "Loading...";
}

class SesionStateSucess implements SesionState {
  final List<Sesion> sesions;

  SesionStateSucess(this.sesions);
}

class SesionStateFailure implements SesionState {
  final String message = "Ops... Algo de errado!";
  final List<Sesion> sesions;

  SesionStateFailure(this.sesions);
}
