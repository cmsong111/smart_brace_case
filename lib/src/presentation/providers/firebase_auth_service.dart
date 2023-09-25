import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);

class FirebaseAuthService with ChangeNotifier {
  FirebaseAuthService({auth}) : _auth = auth ?? FirebaseAuth.instance;

  FirebaseAuth _auth;

  User? get currentUser => _auth.currentUser;

  /// Firebase Auth를 이용한 로그인
  /// [email]과 [password]를 받아서 로그인을 진행합니다.
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;

    if (user == null) {
      throw Exception('로그인에 실패하였습니다.');
    }
    notifyListeners();
  }

  /// Firebase Auth를 이용한 회원가입
  /// [email]과 [password]를 받아서 회원가입을 진행합니다.
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;

    if (user == null) {
      throw Exception('회원가입에 실패하였습니다.');
    }
    notifyListeners();
  }

  /// Google_sign_in을 이용한 로그인
  Future<void> SignInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user == null) {
      throw Exception('로그인에 실패하였습니다.');
    }

    _auth.currentUser!.updateDisplayName(googleUser.displayName);

    notifyListeners();
  }

  /// Firebase Auth를 이용한 로그아웃
  /// 현재 로그인된 사용자를 로그아웃합니다.
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
