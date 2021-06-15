import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:firebase_auth/firebase_auth.dart' as _l1;

extension FirebaseUserX on _l1.User {
  User get domain {
    return User.firebaseAuth(
      id: uid,
      displayName: displayName ??
          providerData
              .firstWhere(
                (info) => info.displayName != null || info.displayName != '',
              )
              .displayName,
      email: email ??
          providerData
              .firstWhere(
                (info) => info.email != null || info.email != '',
              )
              .email,
      isEmailVerified: emailVerified,
      providers: providerData,
      phone: phoneNumber ??
          providerData
              .firstWhere(
                (info) => info.phoneNumber != null || info.phoneNumber != '',
              )
              .phoneNumber,
      photoURL: photoURL ??
          providerData
              .firstWhere(
                (info) => info.photoURL != null || info.photoURL != '',
              )
              .photoURL,
      createdAt: metadata.creationTime,
      lastSeenAt: metadata.lastSignInTime,
    );
  }
}
