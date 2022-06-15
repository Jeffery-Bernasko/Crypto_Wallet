import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future signIn(String email, String password) async {
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e){
    print(e);
    return false;
  }
}

Future registerUser(String email, String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e){
    if (e.code =='weak-password'){
      print('The password is too weak');
    } else if(e.code == 'email-already-in-use'){
      print('The account already exists for that email');
    }
    return false;
  } catch (e){
    print(e.toString());
    return false;
  }
}

Future addCoin(String id, String amount) async{
  try{
    String uid = FirebaseAuth.instance.currentUser.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('users').
    doc(uid).
    collection('coins').
    doc(id);

    FirebaseFirestore.instance.runTransaction((transaction) async{
      DocumentSnapshot snapshot = await transaction.get(documentReference);
    });
  } catch (e){
    return false;
  }
}
