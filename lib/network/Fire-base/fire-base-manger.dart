import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/network/Models/fire-store-Model.dart';

class FireBaseManager {

  collectionRefrence(){
    return
      FirebaseFirestore.instance.collection("Movies").withConverter<FireStoreModel>(
        fromFirestore: (snapshot, options) => FireStoreModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),);

  }

  Future<FireStoreModel?> addMovie(FireStoreModel movie) async {
    var collection = collectionRefrence();
    var doc = collection.doc(movie.id.toString());
    doc.set(movie);
  }

  Stream<QuerySnapshot<FireStoreModel>> getFromFireStore()  {
    var collection = collectionRefrence();
    var data = collection.snapshots();

    return data;
  }

  deleteFromFireStore(String? id){
    var collection = collectionRefrence();
    var doc = collection.doc(id);
    return doc.delete();
  }
}