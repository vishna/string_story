import 'package:string_story/src/api/string_story_service.dart';

/// The log levels available for the [StringStoryLogger].
///
/// Used to categorize log messages by severity.
enum StringStoryServiceLogLevel { debug, info, warn, error }

/// A simple logger for the String Story service.
///
/// Provides methods for logging messages at different levels (debug, info, warn, error)
/// and automatically tags each message with the provided tag.
class StringStoryLogger {
  /// Creates a logger with the given [tag].
  StringStoryLogger(this._tag);

  /// The tag used to identify log messages from this logger.
  final String _tag;

  /// Formats the log [message] by prepending the tag.
  String _format(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final buffer = StringBuffer('[$_tag] $message');
    if (time != null) buffer.write(' | time: $time');
    if (error != null) buffer.write(' | error: $error');
    if (stackTrace != null) buffer.write(' | stackTrace: $stackTrace');
    return buffer.toString();
  }

  /// Internal method to send a log [message] at the given [level].
  void _log(
    StringStoryServiceLogLevel level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      StringStoryService.instance.log?.call(
        level,
        _format(
          message,
          time: time,
          error: error,
          stackTrace: stackTrace,
        ),
      );

  /// Logs a debug [message].
  ///
  /// Optional parameters: [time], [error], [stackTrace].
  void d(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _log(
      StringStoryServiceLogLevel.debug,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs an error [message].
  ///
  /// Optional parameters: [time], [error], [stackTrace].
  void e(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _log(
      StringStoryServiceLogLevel.error,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs an info [message].
  ///
  /// Optional parameters: [time], [error], [stackTrace].
  void i(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _log(
      StringStoryServiceLogLevel.info,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a warning [message].
  ///
  /// Optional parameters: [time], [error], [stackTrace].
  void w(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _log(
      StringStoryServiceLogLevel.warn,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
