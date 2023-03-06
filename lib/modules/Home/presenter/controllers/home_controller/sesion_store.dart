import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/usecases/delete_sesion_usecase.dart';
import 'package:my_sesion/modules/Home/domain/usecases/get_sesion_usecase.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_state.dart';

class SesionStore extends ChangeNotifier {
  final _getSesionUseCase = Modular.get<GetSesionUseCase>();
  final _deleteSesionUseCase = Modular.get<DeleteSesionUseCase>();
  Sesion? todaySesion;
  SesionState state = SesionStateInitial();
  List<Sesion> sesions = [];

  SesionStore() {
    fetchSesions();
  }

  void _emit(SesionState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> fetchSesions() async {
    _emit(SesionStateLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      var list = await _getSesionUseCase();
      todaySesion = list.first;
      _emit(SesionStateSucess(list));
    } catch (e) {
      _emit(SesionStateFailure([]));
    }
  }

  Future<void> deleteSesion(Sesion sesion) async {
    _emit(SesionStateLoading());
    try {
      await _deleteSesionUseCase(sesion);
      var list = await _getSesionUseCase();
      _emit(SesionStateSucess(list));
    } catch (e) {
      _emit(SesionStateFailure([]));
    }
  }
}
