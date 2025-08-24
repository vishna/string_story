import 'package:flutter_test/flutter_test.dart';

import 'package:string_story/src/api/string_story_logger.dart';
import 'utils/mocks.dart';
import 'package:string_story/src/api/string_story_service.dart';

void main() {
  group('StringStoryLogger', () {
    late MockStringStoryService mockService;
    late StringStoryLogger logger;

    setUp(() {
      StringStoryService.resetInstanceForTest();
      mockService = MockStringStoryService();
      StringStoryService.setLazySingleton(() => mockService);
      logger = StringStoryLogger('TEST');
      mockService.logs.clear();
    });

    test('logs debug message', () {
      logger.d('debug message');
      expect(mockService.logs.length, 1);
      final log = mockService.logs.single;
      expect(log, contains('debug message'));
      expect(log, contains('[TEST]'));
      expect(log, contains('debug'));
    });

    test('logs error message with error and stackTrace', () {
      final error = Exception('fail');
      final stack = StackTrace.current;
      logger.e('error message', error: error, stackTrace: stack);
      expect(mockService.logs.length, 1);
      final log = mockService.logs.single;
      expect(log, contains('error message'));
      expect(log, contains('error: Exception: fail'));
      expect(log, contains('stackTrace:'));
    });

    test('logs info message with time', () {
      final now = DateTime.now();
      logger.i('info message', time: now);
      expect(mockService.logs.length, 1);
      final log = mockService.logs.single;
      expect(log, contains('info message'));
      expect(log, contains('time:'));
    });

    test('logs warning message', () {
      logger.w('warn message');
      expect(mockService.logs.length, 1);
      final log = mockService.logs.single;
      expect(log, contains('warn message'));
      expect(log, contains('warn'));
    });
  });
}
