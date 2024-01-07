import 'package:atmiya_community/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<UserModel?> getUserData(String email) async {
    try {
      final adminData = await _firestore.collection('admin').doc('admin').get();
      final adminEmails = adminData['emails'] as List<dynamic>;
      var collectionRef = 'users';

      if (adminEmails.contains(email)) {
        collectionRef = 'admins';
      }

      final data = await _firestore.collection(collectionRef).doc(email).get();
      if (data.data() == null) return null;
      return UserModel.fromMap(data.data()!);
    }catch(_) {
      rethrow;
    }
  }
}
