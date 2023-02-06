import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/save_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/save_sesion_usecase.dart';

class SaveSesionRepositoryMock extends Mock implements SesionRepository {}

void main() {
  var repository = SaveSesionRepositoryMock();
  var saveSesion = SaveSesionUseCase(repository);

  var sesion =
      Sesion(description: "description", data: DateTime.now().toString());
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
