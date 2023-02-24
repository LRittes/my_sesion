import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/update_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/update_sesion_usecase.dart';

class UpdateSesionRepositoryMock extends Mock implements SesionRepository {}

void main() {
  var repository = UpdateSesionRepositoryMock();
  var updateSesion = UpdateSesionUseCase(repository);

  var sesion =
      Sesion(description: "description", date: DateTime.now(), exercises: []);
  List<Sesion> db = [];
  test(
    'Should update sesion',
    () {
      db.add(sesion);
      var sesion2 =
          Sesion(description: 'description2', date: sesion.date, exercises: []);

      when(() => repository.updateSesion(sesion2)).thenAnswer((i) async {
        db.removeAt(0);
        db.insert(0, sesion2);
      });

      updateSesion(sesion2);
      expect(db, isNotEmpty);
      expect(db.length, equals(1));
      expect(db.first, isA<Sesion>());
      expect(db.first.description, equals("description2"));
      expect(db.first.date, equals(sesion.date));
      db.clear();
    },
  );

  test(
    'Should be UpdateSesionException when save sesion',
    () async {
      when(() => repository.updateSesion(sesion))
          .thenThrow(UpdateSesionException("Erro ao atualizar"));

      expect(() async => await updateSesion(sesion),
          throwsA(isA<UpdateSesionException>()));
      expect(db, isEmpty);
    },
  );

  test(
    'Should be a generic Exception when save sesion',
    () async {
      when(() => repository.saveSesion(sesion))
          .thenThrow(Exception("Erro ao salvar"));

      expect(() async => await updateSesion(sesion), throwsA(isA<Exception>()));
      expect(db, isEmpty);
    },
  );
}
