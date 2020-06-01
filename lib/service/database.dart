import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/food_item.dart';
import 'package:final_app/model/user.dart';

class DatabaseService {
  
  final String uid;
 
  DatabaseService({this.uid, });
 
  final CollectionReference serviceCollection = Firestore.instance.collection('service');
 
  
  Future uploadService(FoodItem item) async {
    Map<String, dynamic> toMap() {
    return {
      'id': item.id,
      'title': item.title,
      'price': item.price,
      
    };
  }
      serviceCollection.document(uid).setData({
          
          'services' : FieldValue.arrayUnion([toMap()])
        },merge: true).then((onValue) {
          print('done');
        }).catchError((e) {
          print(e);
        });
           // 'services' : [toMap()],
  }

  Future deleteService(FoodItem item) async {
     Map<String, dynamic> toMap() {
    return {
      'id': item.id,
      'title': item.title,
      'price': item.price,
      
    };
  }
  serviceCollection.document(uid).setData({
          
          'services' : FieldValue.arrayRemove([toMap()])
        },merge: true).then((onValue) {
          print('done');
        }).catchError((e) {
          print(e);
        });
  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      id: snapshot.data['id'],
      title: snapshot.data['title'],
      price: snapshot.data['price']
    );
  }  

  Stream<UserData> get userData{
    return serviceCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}