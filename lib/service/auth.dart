import 'package:final_app/model/user.dart';
import 'package:final_app/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_app/model/food_item.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
   FoodItem item;
  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null ? User(uid: user.uid) : null;
  }
  
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }


  Future signInWithEmailAndPassword (String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword (String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(user.uid.toString());
      await DatabaseService(uid: user.uid).uploadService(item);


      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
      return null;
    }
  }

}