import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_sesion/modules/Home/domain/repositories/sesion_repository.dart';
import 'package:my_sesion/modules/Home/domain/usecases/delete_sesion_usecase.dart';
import 'package:my_sesion/modules/Home/domain/usecases/get_sesion_usecase.dart';
import 'package:my_sesion/modules/Home/infra/datasources/datasource.dart';
import 'package:my_sesion/modules/Home/infra/datasources/local/local_api.dart';
import 'package:my_sesion/modules/Home/infra/repositories/sesion_repository_imp.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/dio_service_client.dart';
import 'package:my_sesion/modules/Home/infra/services/service_client/service_client.dart';
import 'package:my_sesion/modules/Home/presenter/screens/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<ServiceClient>((i) => DioServiceClient()),
        Bind.factory<DataSource>((i) => LocalApiDataSource(i())),
        Bind.factory<SesionRepository>((i) => SesionRepositoryImp(i())),
        Bind.lazySingleton((i) => GetSesionUseCase(i())),
        Bind.lazySingleton((i) => DeleteSesionUseCase(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
