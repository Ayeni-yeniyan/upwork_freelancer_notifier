import 'package:fpdart/fpdart.dart';
import 'package:notifyme/core/models/failure.dart';

abstract interface class ApiService {
  ApiService(this.currentVersion);
  final int currentVersion;
  Future<Either<Failure, bool>> getUpdate();
  Future<Either<Failure, bool>> signInAnonymously();
  Future<Either<Failure, bool>> signInwithEmail(
      {required String email, required String password});
  Future<Either<Failure, bool>> createUserWithEmailAndPassword(
      {required String email, required String password});
}
