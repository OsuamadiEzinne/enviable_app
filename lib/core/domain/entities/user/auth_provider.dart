library auth_provider.dart;

import 'package:enviable_app/features/auth/domain/entities/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:enviable_app/utils/utils.dart';

part 'auth_provider.freezed.dart';

@freezed
@immutable
class AuthProvider with _$AuthProvider {
  const AuthProvider._();

  const factory AuthProvider({
    String? id,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoURL,
    String? providerId,
  }) = _AuthProvider;

  bool get isGoogleAuth =>
      providerId != null &&
      !providerId!.isNullOrBlank &&
      providerId == AuthProviderType.Google.name;

  bool get isPasswordAuth =>
      providerId != null &&
      !providerId!.isNullOrBlank &&
      providerId == AuthProviderType.Password.name;

  bool get isFacebookAuth =>
      providerId != null &&
      !providerId!.isNullOrBlank &&
      providerId == AuthProviderType.Facebook.name;
}
