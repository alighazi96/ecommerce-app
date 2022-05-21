import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productsCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory()async{
    var value = await _categoryCollectionRef.get();  //.get mean give all the data which saved in this ref
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling()async{
    var value = await _productsCollectionRef.get();  //.get mean give all the data which saved in this ref
    return value.docs;
  }
}