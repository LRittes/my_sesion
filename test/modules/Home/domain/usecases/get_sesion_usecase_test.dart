import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/get_sesions_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/get_sesion_usecase.dart';

class GetSesionRepositoryMock extends Mock implements SesionRepository {}

void main() {
  var repository = GetSesionRepositoryMock();
  var getSesions = GetSesionUseCase(repository);
  var db = <Sesion>[];
  var sesion =
      Sesion(description: "description", date: DateTime.now(), exercises: []);
  test('Should return a sesion list', () async {
    when(() => repository.getSesions()).thenAnswer((i) async {
      db.add(sesion);
      return db;
    });

    db = await getSesions();
    expect(db.length, equals(1));
    expect(db.first, isA<Sesion>());
    db.clear();
  });

  test(
    'Should be a GetSesionException when get sesions',
    () async {
      when(() => repository.getSesions())
          .thenThrow(GetSesionException("Erro ao carregar sesions"));

      expect(
          () async => await getSesions(), throwsA(isA<GetSesionException>()));
      expect(db, isEmpty);
    },
  );

  test(
    'Should be a generic Exception when get sesions',
    () async {
      when(() => repository.getSesions())
          .thenThrow(Exception("Erro genérico ao carregar sesions"));

      expect(() async => await getSesions(), throwsA(isA<Exception>()));
      expect(db, isEmpty);
    },
  );
}
