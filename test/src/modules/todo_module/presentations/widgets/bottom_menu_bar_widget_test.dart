import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_starter_kit/src/configs/l10n/app_localizations.dart';
import 'package:flutter_starter_kit/src/configs/routes/route_config.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/applications/bloc/task_bloc/task_bloc.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/presentations/widgets/bottom_menu_bar_widget.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/todo_module.dart';
import 'package:flutter_starter_kit/src/utils/flutter_modular/flutter_modular_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_core/modular_core.dart';

import '../../../../utils/firebase/firebase_message_util_test.dart';
import '../../../app_module_test.mocks.dart';
import '../../task_impl_usecase_test.mocks.dart';

void main() {
  final IModularNavigator mockIModularNavigator = MockIModularNavigator();
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();

    final MockModular mockModular = MockModular(
      TodoModule(),
      replaceBinds: <BindContract<Object>>[
        Bind<Object>((_) => TaskBloc(usecase: MockTaskImplUseCase())),
        Bind<IModularNavigator>((_) => mockIModularNavigator),
      ],
    );
    mockModular.initModule(
      TodoModule(),
      newReplaceBinds: <BindContract<Object>>[
        Bind<Object>((_) => TaskBloc(usecase: MockTaskImplUseCase())),
        Bind<IModularNavigator>((_) => mockIModularNavigator),
      ],
    );
  });

  group('BottomMenuBarWidget Class', () {
    testWidgets('Should have mandatory menu', (WidgetTester tester) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              testContext = context;

              return BottomMenuBarWidget(
                currentTabIndex: 1,
              );
            },
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );

      expect(
        find.text(AppLocalizations.of(testContext).createBottomMenu),
        findsOneWidget,
      );
      expect(
        find.text(AppLocalizations.of(testContext).listBottomMenu),
        findsOneWidget,
      );
      expect(
        find.text(AppLocalizations.of(testContext).updateBottomMenu),
        findsOneWidget,
      );
      expect(
        find.text(AppLocalizations.of(testContext).grpcBottomMenu),
        findsOneWidget,
      );
    });

    testWidgets('Should navigate to screen (list, create, update)',
        (WidgetTester tester) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              testContext = context;

              return BottomMenuBarWidget(
                currentTabIndex: 1,
              );
            },
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // initialRoute: ,
        ),
      );

      when(mockIModularNavigator.pushNamed(initialRoute))
          .thenAnswer((_) => Future<void>.value());

      await tester
          .tap(find.text(AppLocalizations.of(testContext).listBottomMenu));

      await tester.pumpAndSettle();

      verify(mockIModularNavigator.pushNamed(initialRoute)).called(1);

      when(mockIModularNavigator.pushNamed(createTaskRoute))
          .thenAnswer((_) => Future<void>.value());

      await tester
          .tap(find.text(AppLocalizations.of(testContext).createBottomMenu));

      await tester.pumpAndSettle();

      verify(mockIModularNavigator.pushNamed(createTaskRoute)).called(1);

      when(mockIModularNavigator.pushNamed(updateTaskRoute))
          .thenAnswer((_) => Future<void>.value());

      await tester
          .tap(find.text(AppLocalizations.of(testContext).updateBottomMenu));

      await tester.pumpAndSettle();

      verify(mockIModularNavigator.pushNamed(updateTaskRoute)).called(1);
    });
  });
}
