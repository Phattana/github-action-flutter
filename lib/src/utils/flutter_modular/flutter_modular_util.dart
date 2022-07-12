import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_core/modular_core.dart';

import '../../commons/errors/app_error.dart';
import '../../configs/error_messages/error_message_config.dart';
import '../error_code/error_code_util.dart';

class InitModuleError implements AppError {
  InitModuleError({
    required String message,
    required AppErrorCodes code,
  })  : _message = message,
        _code = code;

  final String _message;
  final AppErrorCodes _code;

  static const String errorContext = 'Error in init Module util:';

  @override
  String get message => _message;

  @override
  AppErrorCodes get code => _code;

  @override
  StackTrace? get stackTrace => throw '$errorContext $stackTrace';

  @override
  String toString() => '$errorContext code: $_code, message: $_message';
}

class MockModular {
  MockModular(
    this._module, {
    this.replaceBinds = const <BindContract<Object>>[],
  });

  Module _module;
  List<BindContract<Object>> replaceBinds;

  Module get module => _module;

  void initModule(
    Module newModule, {
    List<BindContract<Object>> newReplaceBinds = const <BindContract<Object>>[],
  }) {
    try {
      _module = newModule;
      replaceBinds = newReplaceBinds;

      final List<BindContract<Object>> bindModules =
          // ignore: invalid_use_of_visible_for_testing_member
          newModule.getProcessBinds();

      if (bindModules.length == newReplaceBinds.length) {
        for (int i = 0; i < bindModules.length; i++) {
          final BindContract<Object> item = bindModules[i];
          final BindContract<Object> dep = newReplaceBinds.firstWhere(
            (BindContract<Object> dep) {
              return item.runtimeType != dep.runtimeType;
            },
            orElse: () => BindEmpty(),
          );

          if (dep is! BindEmpty) {
            bindModules[i] = newReplaceBinds.asMap().containsKey(i)
                ? newReplaceBinds[i]
                : bindModules[i];
          }
        }

        newModule.changeBinds(bindModules);
        modularTracker.injector.addBindContext(_module);
      } else {
        throw InitModuleError(
          message: lengthNotEqual,
          code: AppErrorCodes.unknownError,
        );
      }
    } catch (e) {
      throw InitModuleError(
        message: e.toString(),
        code: AppErrorCodes.unknownError,
      );
    }
  }

  void disposeModule() {
    Modular.dispose();
    _module.dispose();
  }
}
