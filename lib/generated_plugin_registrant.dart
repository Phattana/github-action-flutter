//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:firebase_performance_web/firebase_performance_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FirebaseAnalyticsWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  FirebasePerformanceWeb.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  ImagePickerWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
