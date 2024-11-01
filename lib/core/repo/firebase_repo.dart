import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notifyme/core/models/failure.dart';
import 'package:notifyme/services/api_service.dart';

class FirebaseRepo implements ApiService {
  final _db = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;
  bool anomSignIn = true;

  @override
  int get currentVersion => 1;
  @override
  Future<Either<Failure, bool>> getUpdate() async {
    try {
      final docRef = _db.collection('update').doc('updatecontroller');
      final res = await docRef.get();
      return right(res.get('version') == currentVersion);
    } catch (e) {
      return left(Failure(''));
    }
  }

  @override
  Future<Either<Failure, bool>> signInAnonymously() async {
    try {
      userCredential = await _firebaseAuth.signInAnonymously();
      return right(true);
    } catch (e) {
      return left(Failure(''));
    }
  }

  @override
  Future<Either<Failure, bool>> signInwithEmail({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      anomSignIn = false;
      return right(true);
    } catch (e) {
      return left(Failure(''));
    }
  }

  @override
  Future<Either<Failure, bool>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      anomSignIn = false;
      return right(true);
    } catch (e) {
      return left(Failure(''));
    }
  }
}
