import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_starter_kit/src/configs/routes/route_config.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/applications/bloc/task_bloc/task_bloc.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/presentations/screens/task_create_screen.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/presentations/screens/task_get_grpc_screen.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/presentations/screens/task_get_screen.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/presentations/screens/task_update_screen.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/services/datasources/grpc_datasource.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/task_impl_repository.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/task_impl_usecase.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/todo_module.dart';
import 'package:flutter_starter_kit/src/utils/grpc/grpc_util.dart';
import 'package:flutter_starter_kit/src/utils/image_picker/image_picker_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_core/modular_core.dart';

import '../../utils/image_picker/image_picker_util_test.mocks.dart';

void main() {
  final TodoModule expectTodoModule = TodoModule();
  final List<Type> expectBinds = <Type>[TaskBloc, IModularNavigator];
  final TaskBloc expectBloc = TaskBloc(
    usecase: TaskImplUseCase(
      repository: TaskImplRepository(
        dataSource: GprcDataSource(
          grpcClient: GrpcClientUtil(),
        ),
      ),
    ),
  );


  group('TodoModule Class', () {
    test('Should have TodoModule Class', () {
      expect(TodoModule, TodoModule);
    });

    test('Should have mandatory properties', () async {
      expect(expectTodoModule.imagePicker, isA<ImagePickerUtil>());
    });

    test('Should have method get binds', () {
      for (int i = 0; i < expectTodoModule.binds.length; i++) {
        expect(
          expectTodoModule.binds[i].bindType,
          expectBinds[i],
        );
      }
      // expect(expectTodoModule.binds.length, 1);
    });

    test('Should have method get routes', () {
      final List<String> expectPath = <String>[
        initialRoute,
        createTaskRoute,
        updateTaskRoute,
        getTaskGrpcRoute,
      ];
      final List<
          StatelessWidget Function(
        BuildContext context,
        ModularArguments arg,
      )> expectChild = <
          StatelessWidget Function(
        BuildContext context,
        ModularArguments arg,
      )>[
        (BuildContext context, ModularArguments arg) => TaskGetScreen(),
        (BuildContext context, ModularArguments arg) =>
            TaskCreateScreen(imagePickerUtil: MockImagePickerUtil()),
        (BuildContext context, ModularArguments arg) =>
            TaskUpdateScreen(imagePickerUtil: MockImagePickerUtil()),
        (BuildContext context, ModularArguments arg) => TaskGetGrpcScreen(
              bloc: expectBloc,
            ),
      ];

      for (final ModularRoute value in expectTodoModule.routes) {
        expect(expectPath.contains(value.name), true);
        expect(
          expectChild.indexWhere(
                (
                  StatelessWidget Function(
                    BuildContext context,
                    ModularArguments arg,
                  )
                      element,
                ) =>
                    element.runtimeType ==
                    (value as ChildRoute<dynamic>).child.runtimeType,
              ) >
              -1,
          true,
        );
      }

      expect(expectTodoModule.routes.length, 4);
    });
  });
}
