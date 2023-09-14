import 'package:cloud_firestore/cloud_firestore.dart';

class DbFirestore {
  DbFirestore._();
  static final DbFirestore _instace = DbFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DbFirestore._instace._firestore;
  }
}
