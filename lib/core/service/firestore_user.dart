import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';

//this class the the main connection between the app and the firestore
class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users1');  // here we took a reference of collection
  /////CollectionReference--> Returns the ID of the referenced collection.

   Future<void> addUserToFireStore(UserModel userModel) async {
     return await _userCollectionRef
        .doc(userModel.userId)   //doc here is the user id and its unique value
        .set(userModel.toJson());
    ///set--> Transforms a [DocumentReference] to manipulate a custom object instead

  }

  Future<DocumentSnapshot> getCurrentUser(String uid)async{
     return await _userCollectionRef.doc(uid).get();
  }
}
