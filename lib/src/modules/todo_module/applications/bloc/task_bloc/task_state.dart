part of 'task_bloc.dart';

enum TaskStatusState { initial, loading, success, failure }

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => <Object?>[];
}

class TaskInitialState extends TaskState {
  final TaskStatusState _status = TaskStatusState.initial;

  TaskStatusState get status => _status;

  @override
  List<Object> get props => <Object>[_status];
}

class TaskLoadingState extends TaskState {
  final TaskStatusState _status = TaskStatusState.loading;

  TaskStatusState get status => _status;

  @override
  List<Object> get props => <Object>[_status];
}

class TaskCreateState extends TaskState {
  const TaskCreateState({
    ErrorBlocModel? error,
    ExceptionBlocModel? exception,
    required TaskStatusState status,
  })  : _error = error,
        _exception = exception,
        _status = status;

  final ErrorBlocModel? _error;
  final ExceptionBlocModel? _exception;
  final TaskStatusState _status;

  ErrorBlocModel? get error => _error;

  ExceptionBlocModel? get exception => _exception;

  TaskStatusState get status => _status;

  @override
  List<Object?> get props => <Object?>[_error, _exception, _status];
}

class TaskGetState extends TaskState {
  const TaskGetState({
    required TaskStatusState status,
    required TaskGetRequestBlocModel query,
    List<TaskGetResponseBlocModel>? data,
    ErrorBlocModel? error,
    ExceptionBlocModel? exception,
  })  : _status = status,
        _query = query,
        _data = data,
        _error = error,
        _exception = exception;

  final TaskStatusState _status;
  final TaskGetRequestBlocModel _query;
  final List<TaskGetResponseBlocModel>? _data;
  final ErrorBlocModel? _error;
  final ExceptionBlocModel? _exception;

  TaskStatusState get status => _status;

  TaskGetRequestBlocModel get query => _query;

  List<TaskGetResponseBlocModel>? get data => _data;

  ErrorBlocModel? get error => _error;

  ExceptionBlocModel? get exception => _exception;

  @override
  List<Object?> get props =>
      <Object?>[_status, _data, _query, _error, _exception];
}

class TaskUpdateState extends TaskState {
  const TaskUpdateState({
    TaskStatusState status = TaskStatusState.initial,
    TaskUpdateBlocModel? data,
    ErrorBlocModel? error,
    ExceptionBlocModel? exception,
  })  : _status = status,
        _data = data,
        _error = error,
        _exception = exception;

  final TaskStatusState _status;
  final TaskUpdateBlocModel? _data;
  final ErrorBlocModel? _error;
  final ExceptionBlocModel? _exception;

  TaskStatusState get status => _status;

  TaskUpdateBlocModel? get data => _data;

  ErrorBlocModel? get error => _error;

  ExceptionBlocModel? get exception => _exception;

  @override
  List<Object?> get props => <Object?>[_status, _data, _error, _exception];
}

class TaskDeleteState extends TaskState {
  const TaskDeleteState({
    TaskStatusState status = TaskStatusState.initial,
    ErrorBlocModel? error,
    ExceptionBlocModel? exception,
  })  : _status = status,
        _error = error,
        _exception = exception;

  final TaskStatusState _status;
  final ErrorBlocModel? _error;
  final ExceptionBlocModel? _exception;

  TaskStatusState get status => _status;

  ErrorBlocModel? get error => _error;

  ExceptionBlocModel? get exception => _exception;

  @override
  List<Object?> get props => <Object?>[_status, _error, _exception];
}
