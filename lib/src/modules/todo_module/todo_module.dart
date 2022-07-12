import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../configs/routes/route_config.dart';
import '../../utils/grpc/grpc_util.dart';
import '../../utils/image_picker/image_picker_util.dart';
import 'applications/bloc/task_bloc/task_bloc.dart';
import 'presentations/screens/task_create_screen.dart';
import 'presentations/screens/task_get_grpc_screen.dart';
import 'presentations/screens/task_get_screen.dart';
import 'presentations/screens/task_update_screen.dart';
import 'services/datasources/api_datasource.dart';
import 'services/datasources/grpc_datasource.dart';
import 'task_impl_repository.dart';
import 'task_impl_usecase.dart';

class TodoModule extends Module {
  final ImagePickerUtil _imagePicker = ImagePickerUtil();

  ImagePickerUtil get imagePicker => _imagePicker;

  @override
  List<Bind<Object>> get binds => <Bind<Object>>[
        Bind<TaskBloc>(
          (_) => TaskBloc(
            usecase: TaskImplUseCase(
              repository: TaskImplRepository(
                dataSource: ApiDataSource(
                  http: Dio(),
                ),
              ),
            ),
          ),
        ),
        Bind<IModularNavigator>((_) => Modular.to),
      ];

  @override
  List<ModularRoute> get routes => <ModularRoute>[
        ChildRoute<String>(
          initialRoute,
          child: (_, __) => TaskGetScreen(),
        ),
        ChildRoute<String>(
          createTaskRoute,
          child: (_, __) => TaskCreateScreen(
            imagePickerUtil: _imagePicker,
          ),
        ),
        ChildRoute<String>(
          updateTaskRoute,
          child: (_, __) => TaskUpdateScreen(
            imagePickerUtil: _imagePicker,
          ),
        ),
        ChildRoute<String>(
          getTaskGrpcRoute,
          child: (_, __) => TaskGetGrpcScreen(
            bloc: TaskBloc(
              usecase: TaskImplUseCase(
                repository: TaskImplRepository(
                  dataSource: GprcDataSource(
                    grpcClient: GrpcClientUtil(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ];
}
