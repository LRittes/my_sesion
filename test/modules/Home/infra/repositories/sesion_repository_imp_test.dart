import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sesion/modules/Home/domain/entities/sesion.dart';
import 'package:my_sesion/modules/Home/domain/exceptions/get_sesions_exception.dart';
import 'package:my_sesion/modules/Home/infra/repositories/sesion_repository_imp.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';

class ServiceClientMock extends Mock implements ServiceClient {}

void main() {
  final client = ServiceClientMock();
  final repository = SesionRepositoryImp(client);
  group('Usecase get sesions:', (() {
    test('should return a sesion list', () async {
      var data = [
        {
          'description': "description",
          'data': DateTime.now().toString(),
        }
      ];
      when(() => client.getSesions("path")).thenAnswer((_) async => data);
      var result = await repository.getSesions();
      expect(result, isA<List<Sesion>>());
    });

    test('should throw a get sesions exception', () async {
      when(() => client.getSesions("path"))
          .thenThrow(GetSesionException("Erro ao pegar as sesions!"));
      expect(() => repository.getSesions(), throwsA(isA<GetSesionException>()));
    });

    test('should throw a generic exception from get sesions reposiory',
        () async {
      when(() => client.getSesions("path"))
          .thenThrow(Exception("Erro ao pegar as sesions!"));
      expect(() => repository.getSesions(), throwsA(isA<Exception>()));
    });
  }));

  group('Usecase save sesion:', (() {
    test('should save a sesion', () async {});

    test('should throw a save sesion exception', () async {});

    test('should throw a generic exception from save sesion reposiory',
        () async {});
  }));

  group('Usecase update sesion:', (() {
    test('should update a sesion', () async {});

    test('should throw a update sesion exception', () async {});

    test('should throw a generic exception from update sesion reposiory',
        () async {});
  }));

  group('Usecase delete sesion:', (() {
    test('should delete a sesion', () async {});

    test('should throw a delete sesion exception', () async {});

    test('should throw a generic exception from delete sesion reposiory',
        () async {});
  }));
}
