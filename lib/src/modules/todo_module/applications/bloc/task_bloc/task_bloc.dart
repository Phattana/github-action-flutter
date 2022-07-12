import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../commons/errors/app_error.dart';
import '../../../../../commons/exceptions/app_exception.dart';
import '../../../domains/entities/task_create_entity.dart';
import '../../../domains/entities/task_delete_entity.dart';
import '../../../domains/entities/task_get_entity.dart';
import '../../../domains/entities/task_update_entity.dart';
import '../../../task_impl_usecase.dart';
import '../../models/error_bloc_model.dart';
import '../../models/exception_bloc_model.dart';
import '../../models/task_bloc_models/task_create_bloc_model.dart';
import '../../models/task_bloc_models/task_delete_bloc_model.dart';
import '../../models/task_bloc_models/task_get_bloc_model.dart';
import '../../models/task_bloc_models/task_update_bloc_model.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required TaskImplUseCase usecase})
      : _usecase = usecase,
        super(TaskInitialState()) {
    on<TaskGotEvent>(_mapTaskGotEventToState);
    on<TaskCreatedEvent>(_mapTaskCreatedEventToState);
    on<TaskUpdatedEvent>(_mapTaskUpdatedEventToState);
    on<TaskSelectedToUpdatedEvent>(_mapTaskSelectedToUpdateEventToState);
    on<TaskDeletedEvent>(_mapTaskDeletedEventToState);
  }

  final TaskImplUseCase _usecase;

  Future<void> _mapTaskCreatedEventToState(
    TaskCreatedEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _usecase.create(
        task: TaskCreateRequestEntity(
          title: event.task.title,
          imageUrl: event.task.imageUrl,
        ),
      );

      emit(const TaskCreateState(status: TaskStatusState.success));
    } catch (e) {
      emit(
        TaskCreateState(
          error: e is AppError
              ? ErrorBlocModel(message: e.message, code: e.code)
              : null,
          exception: e is AppException
              ? ExceptionBlocModel(message: e.message, code: e.code)
              : null,
          status: TaskStatusState.failure,
        ),
      );
    }
  }

  Future<void> _mapTaskGotEventToState(
    TaskGotEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(TaskLoadingState());

      final List<TaskGetResponseEntity>? responseUseCase = await _usecase.get(
        query: TaskGetRequestEntity(
          sortBy: event.model.sortBy,
          orderBy: event.model.orderBy,
        ),
      );

      final List<TaskGetResponseBlocModel> taskGetResponseBlocModel =
          responseUseCase == null
              ? <TaskGetResponseBlocModel>[]
              : responseUseCase.map((TaskGetResponseEntity task) {
                  return TaskGetResponseBlocModel(
                    id: task.id,
                    title: task.title,
                    isDone: task.isDone,
                    imageUrl: task.imageUrl,
                    createdAt: task.createdAt,
                  );
                }).toList();

      emit(
        TaskGetState(
          status: TaskStatusState.success,
          data: taskGetResponseBlocModel,
          query: event.model,
        ),
      );
    } catch (e) {
      emit(
        TaskGetState(
          status: TaskStatusState.failure,
          query: event.model,
          error: e is AppError
              ? ErrorBlocModel(message: e.message, code: e.code)
              : null,
          exception: e is AppException
              ? ExceptionBlocModel(message: e.message, code: e.code)
              : null,
        ),
      );
    }
  }

  Future<void> _mapTaskSelectedToUpdateEventToState(
    TaskSelectedToUpdatedEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      TaskUpdateState(
        data: TaskUpdateBlocModel(
          id: event.model.id,
          title: event.model.title,
          isDone: event.model.isDone,
          imageUrl: event.model.imageUrl,
        ),
      ),
    );
  }

  Future<void> _mapTaskUpdatedEventToState(
    TaskUpdatedEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      final TaskUpdateBodyRequestEntity taskUpdateRequestEntity =
          TaskUpdateBodyRequestEntity(
        title: event.model.title,
        imageUrl: event.model.imageUrl,
        isDone: event.model.isDone,
      );

      final TaskUpdateQueryParamsRequestEntity
          taskUpdateQueryParamRequestEntity =
          TaskUpdateQueryParamsRequestEntity(
        id: event.queryParams.id,
      );

      await _usecase.update(
        queryParams: taskUpdateQueryParamRequestEntity,
        task: taskUpdateRequestEntity,
      );

      emit(
        const TaskUpdateState(
          status: TaskStatusState.success,
        ),
      );
    } catch (e) {
      emit(
        TaskUpdateState(
          status: TaskStatusState.failure,
          error: e is AppError
              ? ErrorBlocModel(message: e.message, code: e.code)
              : null,
          exception: e is AppException
              ? ExceptionBlocModel(message: e.message, code: e.code)
              : null,
        ),
      );
    }
  }

  Future<void> _mapTaskDeletedEventToState(
    TaskDeletedEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      final TaskDeleteQueryParamsRequestEntity
          taskDeleteQueryParamsRequestEntity =
          TaskDeleteQueryParamsRequestEntity(
        id: event.queryParams.id,
      );

      await _usecase.delete(
        queryParams: taskDeleteQueryParamsRequestEntity,
      );

      emit(
        const TaskDeleteState(
          status: TaskStatusState.success,
        ),
      );
    } catch (e) {
      emit(
        TaskDeleteState(
          status: TaskStatusState.failure,
          error: e is AppError
              ? ErrorBlocModel(message: e.message, code: e.code)
              : null,
          exception: e is AppException
              ? ExceptionBlocModel(message: e.message, code: e.code)
              : null,
        ),
      );
    }
  }
}
