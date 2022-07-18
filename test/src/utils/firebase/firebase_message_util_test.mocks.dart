// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_starter_kit/test/src/utils/firebase/firebase_message_util_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart'
    as _i3;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i4;
import 'package:flutter_local_notifications/src/initialization_settings.dart'
    as _i7;
import 'package:flutter_local_notifications/src/notification_details.dart'
    as _i9;
import 'package:flutter_local_notifications/src/platform_specifics/ios/enums.dart'
    as _i11;
import 'package:flutter_local_notifications/src/types.dart' as _i12;
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart'
    as _i8;
import 'package:flutter_starter_kit/src/utils/firebase/firebase_message_util.dart'
    as _i13;
import 'package:mockito/mockito.dart' as _i1;
import 'package:timezone/timezone.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseApp_0 extends _i1.Fake implements _i2.FirebaseApp {}

class _FakeNotificationSettings_1 extends _i1.Fake
    implements _i3.NotificationSettings {}

class _FakeFlutterLocalNotificationsPlugin_2 extends _i1.Fake
    implements _i4.FlutterLocalNotificationsPlugin {}

/// A class which mocks [FirebaseMessaging].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseMessaging extends _i1.Mock implements _i5.FirebaseMessaging {
  MockFirebaseMessaging() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_0()) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  bool get isAutoInitEnabled =>
      (super.noSuchMethod(Invocation.getter(#isAutoInitEnabled),
          returnValue: false) as bool);
  @override
  _i6.Stream<String> get onTokenRefresh =>
      (super.noSuchMethod(Invocation.getter(#onTokenRefresh),
          returnValue: Stream<String>.empty()) as _i6.Stream<String>);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i6.Future<_i3.RemoteMessage?> getInitialMessage() =>
      (super.noSuchMethod(Invocation.method(#getInitialMessage, []),
              returnValue: Future<_i3.RemoteMessage?>.value())
          as _i6.Future<_i3.RemoteMessage?>);
  @override
  _i6.Future<void> deleteToken() =>
      (super.noSuchMethod(Invocation.method(#deleteToken, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String?> getAPNSToken() =>
      (super.noSuchMethod(Invocation.method(#getAPNSToken, []),
          returnValue: Future<String?>.value()) as _i6.Future<String?>);
  @override
  _i6.Future<String?> getToken({String? vapidKey}) => (super.noSuchMethod(
      Invocation.method(#getToken, [], {#vapidKey: vapidKey}),
      returnValue: Future<String?>.value()) as _i6.Future<String?>);
  @override
  bool isSupported() => (super.noSuchMethod(Invocation.method(#isSupported, []),
      returnValue: false) as bool);
  @override
  _i6.Future<_i3.NotificationSettings> getNotificationSettings() =>
      (super.noSuchMethod(Invocation.method(#getNotificationSettings, []),
              returnValue: Future<_i3.NotificationSettings>.value(
                  _FakeNotificationSettings_1()))
          as _i6.Future<_i3.NotificationSettings>);
  @override
  _i6.Future<_i3.NotificationSettings> requestPermission(
          {bool? alert = true,
          bool? announcement = false,
          bool? badge = true,
          bool? carPlay = false,
          bool? criticalAlert = false,
          bool? provisional = false,
          bool? sound = true}) =>
      (super.noSuchMethod(
              Invocation.method(#requestPermission, [], {
                #alert: alert,
                #announcement: announcement,
                #badge: badge,
                #carPlay: carPlay,
                #criticalAlert: criticalAlert,
                #provisional: provisional,
                #sound: sound
              }),
              returnValue: Future<_i3.NotificationSettings>.value(
                  _FakeNotificationSettings_1()))
          as _i6.Future<_i3.NotificationSettings>);
  @override
  _i6.Future<void> sendMessage(
          {String? to,
          Map<String, String>? data,
          String? collapseKey,
          String? messageId,
          String? messageType,
          int? ttl}) =>
      (super.noSuchMethod(
          Invocation.method(#sendMessage, [], {
            #to: to,
            #data: data,
            #collapseKey: collapseKey,
            #messageId: messageId,
            #messageType: messageType,
            #ttl: ttl
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setAutoInitEnabled(bool? enabled) =>
      (super.noSuchMethod(Invocation.method(#setAutoInitEnabled, [enabled]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setForegroundNotificationPresentationOptions(
          {bool? alert = false, bool? badge = false, bool? sound = false}) =>
      (super.noSuchMethod(
          Invocation.method(#setForegroundNotificationPresentationOptions, [],
              {#alert: alert, #badge: badge, #sound: sound}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> subscribeToTopic(String? topic) =>
      (super.noSuchMethod(Invocation.method(#subscribeToTopic, [topic]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> unsubscribeFromTopic(String? topic) =>
      (super.noSuchMethod(Invocation.method(#unsubscribeFromTopic, [topic]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [FlutterLocalNotificationsPlugin].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterLocalNotificationsPlugin extends _i1.Mock
    implements _i4.FlutterLocalNotificationsPlugin {
  MockFlutterLocalNotificationsPlugin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool?> initialize(
          _i7.InitializationSettings? initializationSettings,
          {_i8.SelectNotificationCallback? onSelectNotification}) =>
      (super.noSuchMethod(
          Invocation.method(#initialize, [initializationSettings],
              {#onSelectNotification: onSelectNotification}),
          returnValue: Future<bool?>.value()) as _i6.Future<bool?>);
  @override
  _i6.Future<_i8.NotificationAppLaunchDetails?>
      getNotificationAppLaunchDetails() => (super.noSuchMethod(
              Invocation.method(#getNotificationAppLaunchDetails, []),
              returnValue: Future<_i8.NotificationAppLaunchDetails?>.value())
          as _i6.Future<_i8.NotificationAppLaunchDetails?>);
  @override
  _i6.Future<void> show(int? id, String? title, String? body,
          _i9.NotificationDetails? notificationDetails, {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(#show, [id, title, body, notificationDetails],
              {#payload: payload}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> cancel(int? id, {String? tag}) =>
      (super.noSuchMethod(Invocation.method(#cancel, [id], {#tag: tag}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> cancelAll() =>
      (super.noSuchMethod(Invocation.method(#cancelAll, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> schedule(int? id, String? title, String? body,
          DateTime? scheduledDate, _i9.NotificationDetails? notificationDetails,
          {String? payload, bool? androidAllowWhileIdle = false}) =>
      (super.noSuchMethod(
          Invocation.method(#schedule, [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails
          ], {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> zonedSchedule(
          int? id,
          String? title,
          String? body,
          _i10.TZDateTime? scheduledDate,
          _i9.NotificationDetails? notificationDetails,
          {_i11.UILocalNotificationDateInterpretation?
              uiLocalNotificationDateInterpretation,
          bool? androidAllowWhileIdle,
          String? payload,
          _i12.DateTimeComponents? matchDateTimeComponents}) =>
      (super.noSuchMethod(
          Invocation.method(#zonedSchedule, [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails
          ], {
            #uiLocalNotificationDateInterpretation:
                uiLocalNotificationDateInterpretation,
            #androidAllowWhileIdle: androidAllowWhileIdle,
            #payload: payload,
            #matchDateTimeComponents: matchDateTimeComponents
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> periodicallyShow(
          int? id,
          String? title,
          String? body,
          _i8.RepeatInterval? repeatInterval,
          _i9.NotificationDetails? notificationDetails,
          {String? payload,
          bool? androidAllowWhileIdle = false}) =>
      (super.noSuchMethod(
          Invocation.method(#periodicallyShow, [
            id,
            title,
            body,
            repeatInterval,
            notificationDetails
          ], {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> showDailyAtTime(
          int? id,
          String? title,
          String? body,
          _i12.Time? notificationTime,
          _i9.NotificationDetails? notificationDetails,
          {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(
              #showDailyAtTime,
              [id, title, body, notificationTime, notificationDetails],
              {#payload: payload}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> showWeeklyAtDayAndTime(
          int? id,
          String? title,
          String? body,
          _i12.Day? day,
          _i12.Time? notificationTime,
          _i9.NotificationDetails? notificationDetails,
          {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(
              #showWeeklyAtDayAndTime,
              [id, title, body, day, notificationTime, notificationDetails],
              {#payload: payload}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<List<_i8.PendingNotificationRequest>>
      pendingNotificationRequests() => (super.noSuchMethod(
              Invocation.method(#pendingNotificationRequests, []),
              returnValue: Future<List<_i8.PendingNotificationRequest>>.value(
                  <_i8.PendingNotificationRequest>[]))
          as _i6.Future<List<_i8.PendingNotificationRequest>>);
}

/// A class which mocks [AndroidLocalNotificationUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockAndroidLocalNotificationUtil extends _i1.Mock
    implements _i13.AndroidLocalNotificationUtil {
  MockAndroidLocalNotificationUtil() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      (super.noSuchMethod(Invocation.getter(#flutterLocalNotificationsPlugin),
              returnValue: _FakeFlutterLocalNotificationsPlugin_2())
          as _i4.FlutterLocalNotificationsPlugin);
  @override
  _i6.Future<void> show({_i3.RemoteMessage? message}) =>
      (super.noSuchMethod(Invocation.method(#show, [], {#message: message}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [IosLocalNotificationUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockIosLocalNotificationUtil extends _i1.Mock
    implements _i13.IosLocalNotificationUtil {
  MockIosLocalNotificationUtil() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      (super.noSuchMethod(Invocation.getter(#flutterLocalNotificationsPlugin),
              returnValue: _FakeFlutterLocalNotificationsPlugin_2())
          as _i4.FlutterLocalNotificationsPlugin);
}

/// A class which mocks [WebLocalNotificationUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockWebLocalNotificationUtil extends _i1.Mock
    implements _i13.WebLocalNotificationUtil {
  MockWebLocalNotificationUtil() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      (super.noSuchMethod(Invocation.getter(#flutterLocalNotificationsPlugin),
              returnValue: _FakeFlutterLocalNotificationsPlugin_2())
          as _i4.FlutterLocalNotificationsPlugin);
}
