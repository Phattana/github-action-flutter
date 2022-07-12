import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_starter_kit/src/configs/routes/route_config.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/applications/bloc/task_bloc/task_bloc.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/todo_module.dart';
import 'package:flutter_starter_kit/src/utils/flutter_modular/flutter_modular_util.dart';
import 'package:flutter_starter_kit/src/utils/image_picker/image_picker_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_core/modular_core.dart';

import 'main_integration_test.mocks.dart';
import 'screens/task_create_screen_test.dart' as create_task_screen_test;
import 'screens/task_get_screen_test.dart' as get_task_screen_test;
import 'screens/task_update_screen_test.dart' as update_task_screen_test;

@GenerateMocks(<Type>[TaskBloc, ImagePickerUtil, IModularNavigator])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final MockTaskBloc mockBloc = MockTaskBloc();
  final MockImagePickerUtil mockImagePickerUtil = MockImagePickerUtil();
  IModularNavigator mockIModularNavigator = MockIModularNavigator();
  final MockModular mockModular = MockModular(
    TodoModule(),
    replaceBinds: <BindContract<Object>>[
      Bind<Object>((_) => mockBloc),
      Bind<IModularNavigator>((_) => mockIModularNavigator),
    ],
  );

  setUp(() {
    mockIModularNavigator = MockIModularNavigator();

    mockModular.initModule(
      TodoModule(),
      newReplaceBinds: <BindContract<Object>>[
        Bind<Object>((_) => mockBloc),
        Bind<IModularNavigator>((_) => mockIModularNavigator),
      ],
    );

    when(mockIModularNavigator.pushNamed(initialRoute))
        .thenAnswer((_) => Future<void>.value());
  });

  tearDown(() {
    mockModular.disposeModule();
  });

  group('Update task screen integration test', () {
    update_task_screen_test.screenTest(
        mockBloc,
        mockImagePickerUtil,
    );
  });

  group('Create task screen integration test', () {
    create_task_screen_test.screenTest(
        mockBloc,
        mockImagePickerUtil,
        mockIModularNavigator,
    );
  });

  group('Get task screen integration test', () {
    get_task_screen_test.screenTest(
        mockBloc,
        mockIModularNavigator,
    );
  });
}
