import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_sesion/modules/Home/domain/usecases/get_sesion_usecase.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_state.dart';

class SesionStore extends ChangeNotifier {
  final _getSesionUseCase = Modular.get<GetSesionUseCase>();

  SesionState state = SesionStateInitial();

  void _emit(SesionState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> fetchSesions() async {
    _emit(SesionStateLoading());
    try {
      var list = await _getSesionUseCase();
      _emit(SesionStateSucess(list));
    } catch (e) {
      print(e.toString());
      _emit(SesionStateFailure([]));
    }
  }
}
