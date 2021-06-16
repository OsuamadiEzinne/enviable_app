library user;

import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as _l1;
import 'package:kt_dart/kt.dart';
import 'package:enviable_app/core/domain/entities/fields/fields.dart';
import 'package:enviable_app/core/domain/entities/role/role.dart';
import 'package:enviable_app/core/domain/entities/unique_id.dart';
import 'package:enviable_app/utils/utils.dart';

import 'auth_provider.dart';

part 'user.freezed.dart';

@freezed
@immutable
class User with _$User {
  const factory User({
    UniqueId<String>? id,
    Role? role,
    DisplayName? displayName,
    EmailAddress? email,
    bool? isEmailVerified,
    AuthProvider? provider,
    AuthProviders? providers,
    Phone? phone,
    String? photo,
    DateTime? createdAt,
    DateTime? lastSeenAt,
  }) = _User;

  factory User.guest() => User(
        id: UniqueId.fromExternal('guest-id'),
        displayName: DisplayName('Guest User'),
        email: EmailAddress('name@email.com'),
        isEmailVerified: false,
        phone: Phone('8100000002', Country.DEFAULT),
        photo: AppAssets.user,
        createdAt: App.today,
      );

  factory User.firebaseAuth({
    String? id,
    String? displayName,
    String? email,
    bool? isEmailVerified,
    List<_l1.UserInfo>? providers,
    String? phone,
    String? photoURL,
    DateTime? createdAt,
    DateTime? lastSeenAt,
  }) =>
      User(
        id: UniqueId.fromExternal(id),
        displayName: DisplayName(displayName ?? ''),
        email: EmailAddress('$email'),
        providers: mapProvidersToDomain(providers ?? []),
        isEmailVerified: isEmailVerified,
        phone: Phone(phone ?? '', Country.DEFAULT),
        photo: photoURL,
        createdAt: createdAt,
        lastSeenAt: lastSeenAt,
      );

  static AuthProviders mapProvidersToDomain(List<_l1.UserInfo> providers) =>
      AuthProviders(providers
          .map((el) => AuthProvider(
                id: el.uid,
                displayName: el.displayName,
                email: el.email,
                providerId: el.providerId,
                phoneNumber: el.phoneNumber,
                photoURL: el.photoURL,
              ))
          .toImmutableList());
}
