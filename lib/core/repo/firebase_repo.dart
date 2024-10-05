import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notifyme/core/models/failure.dart';
import 'package:notifyme/services/api_service.dart';

class FirebaseRepo implements ApiService {
  final _db = FirebaseFirestore.instance;

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
}
