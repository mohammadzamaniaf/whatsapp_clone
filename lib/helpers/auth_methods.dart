import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/helpers/storage_methods.dart';
import '/models/user.dart' as model;

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signup({
    required String bio,
    required String email,
    required String fullName,
    required String password,
    required Uint8List file,
  }) async {
    String res = 'An Error Occurred';

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log('Auth Methods - Signup : ${userCredential.user?.uid}');

      await auth.currentUser!.sendEmailVerification();

      // this method requires user to be logged in
      String imageUrl = await StorageMethods().uploadImageToStorage(file);

      model.User? user;

      /// Add user to the database
      if (userCredential.user != null) {
        user = model.User(
          email: email,
          password: password,
          bio: bio,
          fullName: fullName,
          imageUrl: imageUrl,
          uid: userCredential.user!.uid,
          username: email.replaceAll('@gmail.com', ''),
        );
      }

      // save user info in firestore database to later upload in profile
      if (user != null) {
        firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
      }

      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.code;
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = 'An Error Occurred';

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.code;
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> logout() async {
    String res = 'An Error Occurred';
    try {
      await auth.signOut();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> verifyUser() async {
    final user = auth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      return 'user does not exist.';
    }
    return 'success';
  }
}
