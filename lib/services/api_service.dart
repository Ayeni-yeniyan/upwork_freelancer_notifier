import 'package:fpdart/fpdart.dart';
import 'package:notifyme/core/models/failure.dart';

abstract interface class ApiService {
  ApiService(this.currentVersion);
  final int currentVersion;
  Future<Either<Failure, bool>> getUpdate();
}
