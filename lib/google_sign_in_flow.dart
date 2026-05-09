import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/root_messenger.dart';

String _firebaseAuthMessage(FirebaseAuthException e) {
  final String code = e.code;
  if (code.contains('configuration-not-found')) {
    return 'Firebase Auth is not enabled for this Firebase project. Open '
        'Firebase Console → Build → Authentication → Get started, then '
        'turn on the Google provider (and any others you need).';
  }
  final String base = (e.message != null && e.message!.trim().isNotEmpty)
      ? e.message!
      : code;
  return switch (code) {
    'operation-not-allowed' =>
      '$base — In Firebase Console open Authentication → Sign-in method and enable Google.',
    'unauthorized-domain' =>
      '$base — Add this site\'s domain under Authentication → Settings → Authorized domains.',
    'popup-closed-by-user' => 'Sign-in was cancelled.',
    'popup-blocked' =>
      '$base — Allow pop-ups for this site or try again after unblocking.',
    _ => '$code: $base',
  };
}

Future<void> signInWithGoogle(BuildContext context) async {
  void feedback(String message) {
    debugPrint('[Google sign-in] $message');
    rootMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  try {
    if (kIsWeb) {
      final GoogleAuthProvider provider = GoogleAuthProvider();
      provider.setCustomParameters(const <String, String>{'prompt': 'select_account'});
      await FirebaseAuth.instance.signInWithPopup(provider);
    } else {
      final GoogleSignInAccount account =
          await GoogleSignIn.instance.authenticate(
        scopeHint: const <String>['email', 'profile', 'openid'],
      );
      final String? idToken = account.authentication.idToken;
      if (idToken == null) {
        feedback('Google Sign-In did not return an ID token.');
        return;
      }
      await FirebaseAuth.instance.signInWithCredential(
        GoogleAuthProvider.credential(idToken: idToken),
      );
    }
    if (!context.mounted) return;
    final String? email = FirebaseAuth.instance.currentUser?.email;
    feedback(email != null ? 'Signed in as $email' : 'Signed in with Google');
  } on FirebaseAuthException catch (e) {
    if (!context.mounted) return;
    feedback(_firebaseAuthMessage(e));
  } on FirebaseException catch (e) {
    if (!context.mounted) return;
    feedback('[${e.code}] ${e.message ?? e.toString()}');
  } on GoogleSignInException catch (e) {
    if (e.code == GoogleSignInExceptionCode.canceled) return;
    if (!context.mounted) return;
    feedback(e.description ?? e.toString());
  } catch (e, stack) {
    debugPrint('[Google sign-in] $e\n$stack');
    if (!context.mounted) return;
    feedback(
      'Sign-in failed: $e',
    );
  }
}
