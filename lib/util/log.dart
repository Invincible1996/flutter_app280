import 'package:logger/logger.dart';

///
/// @date: 2021/12/20 16:22
/// @author: kevin
/// @description: dart
var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

class Log {
  ///
  ///
  static d(msg) {
    logger.d(msg ?? '');
  }
}
