import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_login_model.dart';

abstract class GoogleLoginRepository {
  Future<GoogleLoginModel?> signInWithGoogle();

  Future<void> signOut();
}

class GoogleLoginRepositoryImpl implements GoogleLoginRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleLoginModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // 로그인 취소
      }

      return GoogleLoginModel(
        email: googleUser.email,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
