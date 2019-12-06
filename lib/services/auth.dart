import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class User {
  FirebaseUser firebaseUser;
  List<dynamic> roles;
  Map<dynamic, dynamic> claims;
  User({this.roles, this.claims, this.firebaseUser});
}

class UserFromFuture extends User {
  UserFromFuture({roles, claims, firebaseUser})
      : super(roles: roles, claims: claims, firebaseUser: firebaseUser);
}

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Future<UserFromFuture> get getUser async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    if (firebaseUser == null)
      return UserFromFuture(firebaseUser: null, claims: {}, roles: []);
    else {
      var idToken = await firebaseUser.getIdToken(refresh: true);
      var claims = (idToken == null) ? {} : idToken.claims;
      var roles = [];
      if (claims != null) {
        roles = claims['roles'] ?? [];
      }
      return UserFromFuture(firebaseUser: firebaseUser, claims: {}, roles: roles);
    }
  }

  Stream<User> get user {
    final user = _auth.onAuthStateChanged;

    final toLocalUser = StreamTransformer<FirebaseUser, User>.fromHandlers(
      handleData: (FirebaseUser user, sink) async {
        if (user == null)
          sink.add(User(firebaseUser: null, claims: {}, roles: [])); //re
        else {
          var idToken = await user.getIdToken(refresh: true);
          var claims = (idToken == null) ? {} : idToken.claims;
          var roles = [];
          if (claims != null) {
            roles = claims['roles'] ?? [];
          }
          sink.add(User(firebaseUser: user, claims: claims, roles: roles)); //
        }
      },
    );
    return user.transform(toLocalUser);
  }


  Future<FirebaseUser> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      updateUserData(user);

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }
  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }
  Future<FirebaseUser> signUp(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print('result'+result.toString());
    FirebaseUser user = result.user;
    return user;
  }



  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection('reports').document(user.uid);
    return reportRef.setData({'uid': user.uid, 'lastActivity': DateTime.now()}, merge: true);
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    return _auth.signOut();
  }
}

// keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
