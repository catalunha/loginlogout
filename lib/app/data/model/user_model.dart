import 'dart:convert';

class UserModel {
  static const String collection = 'users';

  final String id;
  final String uid;
  final String email;
  final String? photoURL;
  final String? displayName;
  UserModel({
    required this.id,
    required this.uid,
    required this.email,
    this.photoURL,
    this.displayName,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? email,
    String? photoURL,
    String? displayName,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'email': email,
      'photoURL': photoURL,
      'displayName': displayName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'],
      displayName: map['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, email: $email, photoURL: $photoURL, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.uid == uid &&
        other.email == email &&
        other.photoURL == photoURL &&
        other.displayName == displayName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        photoURL.hashCode ^
        displayName.hashCode;
  }
}
