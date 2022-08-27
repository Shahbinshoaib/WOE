
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

class FirebaseAuthService{
  //final FirebaseAuth _firebaseAuth;

 // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin fb = FacebookLogin();
 // final GoogleSignIn _googleSignIn;

  // FirebaseAuthService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
  //     : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  //       _googleSignIn = googleSignin ?? GoogleSignIn();
  //
  // User _userFromFirebase(FirebaseUser user) {
  //   if (user == null) {
  //     return null;
  //   }
  //   return User(
  //     uid: user.uid,
  //     email: user.email,
  //     displayName: user.displayName,
  //     photoUrl: user.photoUrl,
  //   );
  // }
  //
  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid, email: user.email, username: user.displayName, photo: user.photoUrl) : null;
  // }

  // Stream<User> get user {
  //   return _auth.onAuthStateChanged
  //       .map(_userFromFirebaseUser);
  // }

  // Future<User> signInWithGoogle() async {
  //   final googleUser = await _googleSignIn.signIn();
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   final authResult = await _firebaseAuth.signInWithCredential(credential);
  //   return _userFromFirebase(authResult.user);
  // }
  //sign in with Google
  // Future signInWithGoogle() async{
  //   try{
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount account = await googleSignIn.signIn();
  //     print(account);
  //     if (account == null)
  //       return false;
  //     AuthResult res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
  //       idToken: (await account.authentication).idToken,
  //       accessToken: (await account.authentication).accessToken,
  //     ));
  //     FirebaseUser user = res.user;
  //     print(user);
  //     //await DatabaseService().updateUserData(user.displayName, user.email, user.photoUrl);
  //     if(user == null)
  //       return false;
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //
  // final fbLogin = FacebookLogin();
  // Future signInFB() async {
  //   final FacebookLoginResult result = await fbLogin.logIn(["email"]);
  //   final String token = result.accessToken.token;
  //   final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: token);
  //   final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  //   // final response = await       http.get('https://graph.facebook.com/v2.12/me?fields=nam56e,first_name,last_name,email&access_token=${token}');
  //  // final profile = jsonDecode(response.body);
  //   print('////////////////$user');
  //   //print(profile);
  //   //return profile;
  // }

  // Future<Null> _logOut() async {
  //   await facebookSignIn.logOut();
  // }

  //sign in with email & pw
  // Future signInWithEmailAndPassword(String email, String password) async{
  //   try {
  //     AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user = result.user;
  //     if(user == null)
  //       return false;
  //     return _userFromFirebaseUser(user);
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }



  //register
  // Future registerWithEmailAndPassword(String email, String password) async{
  //   try {
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user = result.user;
  //     if(user == null)
  //       return false;
  //     return _userFromFirebaseUser(user);
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // Future signOut() async{
  //   try{
  //     return await _auth.signOut();
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // Future passwordReset(String email) async{
  //   try{
  //     return await _auth.sendPasswordResetEmail(email: email);
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
@immutable
class User {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}