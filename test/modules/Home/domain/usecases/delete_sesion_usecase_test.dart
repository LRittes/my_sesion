import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/delete_sesion_exception.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/delete_sesion_usecase.dart';

class DeleteSesionRepositoryMock extends Mock implements SesionRepository {}

void main() {
  var repository = DeleteSesionRepositoryMock();
  var deleteSesion = DeleteSesionUseCase(repository);

  var sesion = Sesion(
      description: "description",
      date: DateTime.now().toString(),
      exercises: []);
  List<Sesion> db = [sesion];
  test(
    'Should delete a sesion',
    () async {
      when(() => repository.deleteSesion(sesion))
          .thenAnswer((i) async => db.remove(sesion));

      await deleteSesion(sesion);
      expect(db, isEmpty);
      expect(db.length, equals(0));
    },
  );

  test(
    'Should be DeleteSesionException when delete a sesion',
    () async {
      when(() => repository.deleteSesion(sesion))
          .thenThrow(DeleteSesionException("Erro ao deletar"));

      expect(() async => await deleteSesion(sesion),
          throwsA(isA<DeleteSesionException>()));
    },
  );

  test(
    'Should be a generic Exception when delete a sesion',
    () async {
      when(() => repository.deleteSesion(sesion))
          .thenThrow(Exception("Erro genérico ao deletar"));

      expect(() async => await deleteSesion(sesion), throwsA(isA<Exception>()));
    },
  );
}
