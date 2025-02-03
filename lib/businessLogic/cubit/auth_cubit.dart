import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register new user
  Future<void> signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Authenticated(user: userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Signin user
  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Authenticated(user: userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInUserWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      emit(AuthLoading());
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      emit(Authenticated(user: userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

//Logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      emit(AuthLoading());
      await _auth.sendPasswordResetEmail(email: email);
      emit(AuthPasswordResetEmailSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error occurred'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Email validation logic
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return '*Email is required';
    }
    // Regular expression for basic email validation
    String emailPattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return '*Enter a valid email';
    }
    return null;
  }

//password validation
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '*Password is required';
    }
    if (password.length < 6) {
      return '*Password must be at least 6 characters long';
    }
    return null; // Return null if password is valid
  }

  // Check if user is signed in
  void checkAuthStatus() {
    final user = _auth.currentUser;
    if (user != null) {
      emit(Authenticated(user: user));
    } else {
      emit(AuthError(
          "the user status is not signed in")); // Or AuthError('User not authenticated') if preferred
    }
  }
}
