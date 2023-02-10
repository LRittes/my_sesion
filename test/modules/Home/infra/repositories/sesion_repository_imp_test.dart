import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/exceptions.dart';
import 'package:my_sesion/modules/Home/infra/adapters/DTOS/sesion_dto.dart';
import 'package:my_sesion/modules/Home/infra/repositories/sesion_repository_imp.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class ServiceClientMock extends Mock implements ServiceClient {}

void main() {
  final client = ServiceClientMock();
  final repository = SesionRepositoryImp(client);
  var data = {
    'description': "description",
    'data': DateTime.now().toString(),
  };
  var db = [data];
  group('Usecase get sesions:', (() {
    test('should return a sesion list', () async {
      when(() => client.getSesions()).thenAnswer((_) async => db);
      var result = await repository.getSesions();
      expect(result, isA<List<Sesion>>());
    });

    test('should throw a get sesions exception', () async {
      when(() => client.getSesions())
          .thenThrow(GetSesionException("Erro ao pegar as sesions!"));
      expect(() => repository.getSesions(), throwsA(isA<GetSesionException>()));
    });

    test('should throw a generic exception from get sesions reposiory',
        () async {
      when(() => client.getSesions())
          .thenThrow(Exception("Erro ao pegar as sesions!"));
      expect(() => repository.getSesions(), throwsA(isA<Exception>()));
    });
  }));

  group('Usecase delete sesion:', (() {
    test('should delete a sesion', () async {
      when(() => client.deleteSesion(data)) //
          .thenAnswer(
        (i) async => db.removeWhere((e) => e['data'] == data['data']),
      );
      var sesion = SesionDTO.fromMap(data);
      repository.deleteSesion(sesion);
      expect(db, isEmpty);
    });

    test('should throw a delete sesion exception', () async {
      when(() => client.deleteSesion(data)) //
          .thenThrow(DeleteSesionException("Error ao deletar uma sesion"));
      var sesion = SesionDTO.fromMap(data);
      expect(() async => repository.deleteSesion(sesion),
          throwsA(isA<DeleteSesionException>()));
    });

    test('should throw a generic exception from delete sesion reposiory',
        () async {
      when(() => client.deleteSesion(data)) //
          .thenThrow(Exception("Error Generénico ao deletar uma sesion"));
      var sesion = SesionDTO.fromMap(data);
      expect(() async => repository.deleteSesion(sesion),
          throwsA(isA<Exception>()));
    });
  }));
}
