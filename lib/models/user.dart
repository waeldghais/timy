import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;

  final String email;
  final String photoUrl;
  final String displayName;

  User({
    this.id,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  // we need to create a methode for deserialization to create instance of user

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      email: doc['email'],
      //username: doc['username'],
      photoUrl: doc['photoUrl'],
      displayName: doc['displayName'],
    );
  }
}
