import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../configs/routes/route_config.dart';
import '../helpers/check_os/check_os_helper.dart';
import '../modules/todo_module/presentations/screens/not_found_screen.dart';
import '../modules/todo_module/todo_module.dart';
import '../utils/error_code/error_code_util.dart';
import '../utils/firebase/firebase_message_util.dart';

class AppModule extends Module {
  AppModule() {
    final FirebaseMessagingUtil fbMessaging = initFbMessaging(_os);

    _fbMessaging = fbMessaging;
    _fbMessaging.requestNotificationPermission();
  }

  final OsCodes _os = getOs();
  late final FirebaseMessagingUtil _fbMessaging;

  FirebaseMessagingUtil initFbMessaging(OsCodes os) {
    try {
      switch (os) {
        case OsCodes.web:
          return WebFirebaseMessagingUtil(
            messaging: FirebaseMessaging.instance,
            localNotification: WebLocalNotificationUtil(
              flutterLocalNotificationsPlugin:
                  FlutterLocalNotificationsPlugin(),
            ),
          );
        case OsCodes.android:
          return AndroidFirebaseMessagingUtil(
            messaging: FirebaseMessaging.instance,
            localNotification: AndroidLocalNotificationUtil(
              flutterLocalNotificationsPlugin:
                  FlutterLocalNotificationsPlugin(),
            ),
          );
        case OsCodes.ios:
          return IosFirebaseMessagingUtil(
            messaging: FirebaseMessaging.instance,
            localNotification: IosLocalNotificationUtil(
              flutterLocalNotificationsPlugin:
                  FlutterLocalNotificationsPlugin(),
            ),
          );
        default:
          throw FirebaseMessagingUtilError(
            message: 'Cannot init FbMessaging ',
            code: AppErrorCodes.unknownError,
          );
      }
    } catch (e) {
      throw FirebaseMessagingUtilError(
        message: e.toString(),
        code: AppErrorCodes.unknownError,
      );
    }
  }

  @override
  List<Bind<Object>> get binds => <Bind<Object>>[
        Bind<FirebaseMessagingUtil>(
          (_) => _fbMessaging,
        ),
        Bind<OsCodes>(
          (_) => _os,
        ),
      ];

  @override
  List<ModularRoute> get routes => <ModularRoute>[
        ModuleRoute<dynamic>(initialRoute, module: TodoModule()),
        ChildRoute<ChildRoute<String>>(
          notFoundRoute,
          child: (_, __) => const NotFoundScreen(),
        )
      ];
}
