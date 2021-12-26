import 'package:flutter_starter_kit/src/modules/todo_module/commons/exceptions/usecase_exception.dart';
import 'package:flutter_starter_kit/src/modules/todo_module/configs/usecasae_messages/usecase_message_config.dart';
import 'package:flutter_starter_kit/src/utils/test_data/mock_test_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FieldRequiredException Class', () {
    test('Should have FieldRequiredException Class', () {
      expect(FieldRequiredException, FieldRequiredException);
    });

    test('Should have mandatory properties', () {
      expect(
        expectTaskFieldValidationExceptionTitleEmpty.message,
        requiredTitleMessage,
      );
      expect(
        expectTaskFieldValidationExceptionTitleEmpty.code,
        expectDataSourceError.code,
      );
    });
  });

  group('Field ValidationException Class', () {
    test('Should have FieldValidationException Class', () {
      expect(FieldValidationException, FieldValidationException);
    });

    test('Should have mandatory properties', () {
      expect(
        expectTaskFieldValidationExceptionTitleEmpty.message,
        requiredTitleMessage,
      );
      expect(
        expectTaskFieldValidationExceptionTitleEmpty.code,
        expectDataSourceErrorRequiredField.code,
      );
    });
  });
}
