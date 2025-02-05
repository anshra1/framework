// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:framework/src/core/system/secqure_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

// // Define custom exception types
// class AuthException implements Exception {
//   AuthException(this.message);
//   final String message;

//   @override
//   String toString() => 'AuthException: $message';
// }

// abstract class AuthRemoteDataSource {
//   Future<User> signInWithGoogle();
//   Future<void> signOut();
//   Future<User?> getUser();
//   Future<void> cacheUser(User user);
//   Future<void> clearUser();
// }

// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   AuthRemoteDataSourceImpl({
//     required this.client,
//     required this.secureStorage,
//     required this.appStorage,
//   });

//   final http.Client client;
//   final FlutterSecureStorage secureStorage;
//   final AppStorage<String> appStorage;
//   final String apiKey = 'YOUR_API_KEY';
//   final String googleClientId = 'YOUR_GOOGLE_CLIENT_ID';
//   final String redirectUri = 'YOUR_REDIRECT_URI';

//   @override
//   Future<User> signInWithGoogle() async {
//     try {
//       if (kIsWeb ||
//           defaultTargetPlatform == TargetPlatform.android ||
//           defaultTargetPlatform == TargetPlatform.iOS) {
//         final googleSignIn = GoogleSignIn();
//         final googleUser = await googleSignIn.signIn();
//         final googleAuth = await googleUser?.authentication;

//         if (googleAuth?.idToken != null) {
//           final credential = GoogleAuthProvider.credential(
//             idToken: googleAuth?.idToken,
//             accessToken: googleAuth?.accessToken,
//           );

//           final userCredential =
//               await FirebaseAuth.instance.signInWithCredential(credential);
//           final user = userCredential.user;

//           if (user != null) {
//             await appStorage.write('user_uid', user.uid);
//             return user;
//           } else {
//             throw AuthException('Could not sign in with Google credentials.');
//           }
//         } else {
//           throw AuthException('Could not get Google ID token.');
//         }
//       } else {
//         return _signInWithGoogleDesktop();
//       }
//     } catch (e) {
//       rethrow; // Re-throw the exception
//     }
//   }

//   Future<User> _signInWithGoogleDesktop() async {
//     try {
//       final authUrl = Uri.parse(
//         'https://accounts.google.com/o/oauth2/v2/auth?client_id=$googleClientId&redirect_uri=$redirectUri&response_type=code&scope=openid%20profile%20email',
//       );

//       if (await canLaunchUrl(authUrl)) {
//         await launchUrl(authUrl);

//         final authorizationCode = await _getAuthorizationCodeFromRedirect();
//         if (authorizationCode == null) {
//           throw AuthException('Authorization code was null');
//         }

//         final tokenResponse = await _exchangeCodeForToken(authorizationCode);
//         if (tokenResponse == null) {
//           throw AuthException(
//             'Error exchanging code for token: $tokenResponse',
//           );
//         }
//         final token = tokenResponse;

//         final userCredential = await FirebaseAuth.instance.signInWithCustomToken(token);
//         final user = userCredential.user;
//         if (user != null) {
//           await appStorage.write('user_uid', user.uid);
//           return user;
//         } else {
//           throw AuthException('Could not sign in with custom token.');
//         }
//       } else {
//         throw AuthException('Could not launch $authUrl');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<String?> _getAuthorizationCodeFromRedirect() async {
//     // Implement platform-specific logic to capture the authorization code.
//     // Placeholder for now.
//     return Future.delayed(const Duration(seconds: 5), () => 'authorization_code');
//   }

//   Future<String?> _exchangeCodeForToken(String authorizationCode) async {
//     final url = Uri.parse('https://oauth2.googleapis.com/token');

//     final body = {
//       'client_id': googleClientId,
//       'redirect_uri': redirectUri,
//       'code': authorizationCode,
//       'grant_type': 'authorization_code',
//     };

//     try {
//       final response = await http.post(url, body: body);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final token = data['id_token'];
//         return token;
//       } else {
//         throw AuthException(
//           'Error exchanging code for token: ${response.body}',
//         );
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       await appStorage.delete('user_uid');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<User?> getUser() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         return user;
//       } else {
//         final cachedUserId = await appStorage.read('user_uid');
//         if (cachedUserId != null) {
//           return FirebaseAuth.instance.currentUser;
//         }
//         return null;
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> cacheUser(User user) async {
//     // Not needed as we cache the user ID in signInWithGoogle
//   }

//   @override
//   Future<void> clearUser() async {
//     await appStorage.delete('user_uid');
//   }
// }


