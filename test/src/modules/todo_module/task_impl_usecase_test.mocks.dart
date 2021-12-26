// Mocks generated by Mockito 5.0.17 from annotations
// in flutter_starter_kit/test/src/modules/todo_module/task_impl_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:flutter_starter_kit/src/modules/todo_module/domains/entities/task_create_entity.dart'
    as _i3;
import 'package:flutter_starter_kit/src/modules/todo_module/domains/entities/task_delete_entity.dart'
    as _i8;
import 'package:flutter_starter_kit/src/modules/todo_module/domains/entities/task_get_entity.dart'
    as _i7;
import 'package:flutter_starter_kit/src/modules/todo_module/domains/entities/task_update_entity.dart'
    as _i4;
import 'package:flutter_starter_kit/src/modules/todo_module/domains/repositories/task_repository.dart'
    as _i2;
import 'package:flutter_starter_kit/src/modules/todo_module/task_impl_usecase.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTaskRepository_0 extends _i1.Fake implements _i2.TaskRepository {}

class _FakeTaskCreateResponseEntity_1 extends _i1.Fake
    implements _i3.TaskCreateResponseEntity {}

class _FakeTaskUpdateResponseEntity_2 extends _i1.Fake
    implements _i4.TaskUpdateResponseEntity {}

/// A class which mocks [TaskImplUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskImplUseCase extends _i1.Mock implements _i5.TaskImplUseCase {
  MockTaskImplUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TaskRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTaskRepository_0()) as _i2.TaskRepository);
  @override
  _i6.Future<_i3.TaskCreateResponseEntity> create(
          {_i3.TaskCreateRequestEntity? task}) =>
      (super.noSuchMethod(Invocation.method(#create, [], {#task: task}),
              returnValue: Future<_i3.TaskCreateResponseEntity>.value(
                  _FakeTaskCreateResponseEntity_1()))
          as _i6.Future<_i3.TaskCreateResponseEntity>);
  @override
  _i6.Future<List<_i7.TaskGetResponseEntity>?> get(
          {_i7.TaskGetRequestEntity? query}) =>
      (super.noSuchMethod(Invocation.method(#get, [], {#query: query}),
              returnValue: Future<List<_i7.TaskGetResponseEntity>?>.value())
          as _i6.Future<List<_i7.TaskGetResponseEntity>?>);
  @override
  _i6.Future<_i4.TaskUpdateResponseEntity> update(
          {_i4.TaskUpdateQueryParamsRequestEntity? queryParams,
          _i4.TaskUpdateBodyRequestEntity? task}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #update, [], {#queryParams: queryParams, #task: task}),
              returnValue: Future<_i4.TaskUpdateResponseEntity>.value(
                  _FakeTaskUpdateResponseEntity_2()))
          as _i6.Future<_i4.TaskUpdateResponseEntity>);
  @override
  _i6.Future<void> delete(
          {_i8.TaskDeleteQueryParamsRequestEntity? queryParams}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [], {#queryParams: queryParams}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}
