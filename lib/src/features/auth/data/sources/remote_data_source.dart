// lib/data/data_sources/auth_remote_data_source.dart (Interface)

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:framework/src/core/constants/app_constants.dart';
import 'package:framework/src/core/error/app_exception.dart';
import 'package:framework/src/core/error/exception_thower.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class AuthRemoteDataSource {
  Future<User?> signInWithGoogle();
  Future<bool> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required this.secureStorage,
    required this.googleSignIn,
  });

  final FlutterSecureStorage secureStorage;
  final GoogleSignIn googleSignIn;

  @override
  Future<User?> signInWithGoogle() async {
    const scopes = <String>[
      'email',
    ];

    // Initialize the GoogleSignIn instance with the defined scopes.
    final googleSignIn = GoogleSignIn(
      clientId: kIsWeb
          ? '500030851669-voqs2ckobif8ob5s2mhg88p893oigj38.apps.googleusercontent.com'
          : null, // For mobile, the clientId is usually fetched from the configuration file.
      scopes: scopes,
    );

    try {
      // Start the sign-in process.
      final account = await googleSignIn.signIn();
      if (account == null) {
        // The user canceled the sign-in.
        return null;
      }

      // On the web, verify that the required scopes are authorized.
      if (kIsWeb) {
        var isAuthorized = await googleSignIn.canAccessScopes(scopes);
        if (!isAuthorized) {
          isAuthorized = await googleSignIn.requestScopes(scopes);
          if (!isAuthorized) {
            // The user did not grant the required scopes.
            return null;
          }
        }
      }

      final googleAuth = await account.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final auth = await FirebaseAuth.instance.signInWithCredential(authCredential);

      await saveAuthToken(auth.user!.uid);

      return auth.user;
    } on FirebaseAuthException catch (e, s) {
      throw Exp.firebaseServerException(
        firebaseException: e,
        dartStackTrace: s,
        methodName: 'sign in with google',
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      Exp.unknownException(
        error: e,
        stackTrace: s,
        methodName: 'Sign in with Google',
      );
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
      await clearAuthToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveAuthToken(String token) async {
    await secureStorage.write(key: AppConstants.secureStorageKey, value: token);
  }

  Future<void> clearAuthToken() async {
    await secureStorage.delete(key: AppConstants.secureStorageKey);
  }
}
