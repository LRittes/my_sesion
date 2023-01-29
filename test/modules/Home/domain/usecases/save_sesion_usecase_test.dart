import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/SaveSesionException.dart';
import 'package:my_sesion/modules/Home/domain/repositories/save_sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/save_sesion_usecase.dart';

class SaveSesionRepositoryMock extends Mock implements SaveSesionRepository {}

void main() {
  var repository = SaveSesionRepositoryMock();
  var saveSesion = SaveSesionUseCase(repository);

  var sesion = Sesion(description: "description", data: "wednesday;25/01/2023");
  List<Sesion> db = [];
  test(
    'Should save sesion',
    () {
      when(() => repository.saveSesion(sesion))
          .thenAnswer((i) async => db.add(sesion));

      saveSesion(sesion);
      expect(db, isNotEmpty);
      expect(db.length, equals(1));
      expect(db.first, isA<Sesion>());
      db.clear();
    },
  );

  test(
    'Should be SaveSesionException when save sesion',
    () async {
      when(() => repository.saveSesion(sesion))
          .thenThrow(SaveSesionException("Erro ao salvar"));

      expect(() async => await saveSesion(sesion),
          throwsA(isA<SaveSesionException>()));
      expect(db, isEmpty);
    },
  );

  test(
    'Should be a generic Exception when save sesion',
    () async {
      when(() => repository.saveSesion(sesion))
          .thenThrow(Exception("Erro ao salvar"));

      expect(() async => await saveSesion(sesion), throwsA(isA<Exception>()));
      expect(db, isEmpty);
    },
  );
}

// Na hora de testar um erro como tester cada tipo de erro por exemplo no msm try catch ter um erro generenico e um erro especifico 

// Faz todo os usecases e depois faz os tests? 