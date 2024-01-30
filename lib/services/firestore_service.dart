import 'package:e_commerce_app/consts/consts.dart';

class FireStoreServices{

  // get users data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }

  // get products according to category
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }

  // get cart
  static getCart(uid){
    return firestore.collection(cartCollection).where("added_by", isEqualTo: uid).snapshots();
  }

  // delete document
  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

}