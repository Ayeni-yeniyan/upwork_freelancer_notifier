import 'package:logger/logger.dart';

var logger = Logger();
void infoLog(dynamic message) => logger.i(message);
void errorLog(dynamic message) => logger.e(message);
void displayLog(dynamic message) => logger.d(message);
