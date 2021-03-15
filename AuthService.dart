import 'package:firebase_auth/firebase_auth.dart';
import 'services/database.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? user.uid :null ;
  }
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      return result;
    }
    catch(e)
    {
      print(e.toString());
      print('hii');
      return null;
    }
  }
  Future signInWithEmailPassword(String email,String password)
  async
  {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return result;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  Future registerWithEmail(String email ,String password)
  async
  {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}
