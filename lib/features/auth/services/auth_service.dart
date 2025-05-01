import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login method
  Future<bool> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else {
        throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Signup method
  Future<bool> signup(String email, String password) async {
    try {
      print('Attempting to create user with email: $email');
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created successfully: ${userCredential.user?.uid}');
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException during signup: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'weak-password':
          throw Exception('The password provided is too weak. Please use a stronger password.');
        case 'email-already-in-use':
          throw Exception('An account already exists with this email address.');
        case 'invalid-email':
          throw Exception('The email address is not valid.');
        case 'operation-not-allowed':
          throw Exception('Email/password accounts are not enabled. Please contact support.');
        default:
          throw Exception('Signup failed: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error during signup: $e');
      throw Exception('Signup failed: $e');
    }
  }

  // Password reset method
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email.');
      } else {
        throw Exception('Password reset failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}