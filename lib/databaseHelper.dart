import 'package:firebase_database/firebase_database.dart';

import 'Castle.dart';

class DatabaseHelper{
    // method to write message to data base
   static void writeMessageToFirebase(){
     final databaseReference= FirebaseDatabase.instance.ref();
     databaseReference.child('mess')
     .set({'mess':'start work !'})
     .then((value) => print("Message written successfully"))
     .catchError((err)=> print("Falid to write message :$err"));

   }
   static void sendList_to_database(

       String data_Name, List<Map<String,dynamic>>data_List
       ){
     DatabaseReference databaseReference= FirebaseDatabase.instance.ref(data_Name);
     if (data_List.isNotEmpty){
       for (var element in data_List) {
         databaseReference.push().set(element)
           .then((value) => print("dataList data saved successfully !"))
           .catchError((err)=> print("Faild to write message : $err")) ;

       }
     }
     else {
       print("data list is empty!");
     }


   }

   static void readData(Function(List<Castle>) castleListCallback) {
     DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
     databaseReference.child('datass').onValue.listen((event) {
       final castleDataSnapshot = event.snapshot;
       if (castleDataSnapshot.exists) {
         List<Castle> castleList = [];
         castleDataSnapshot.children.forEach((element) {
           CastleData castleData = CastleData.fromJson(Map<dynamic, dynamic>.from(element.value as Map));
           Castle castle = Castle(element.key!, castleData); // Assuming the key is not null here
           castleList.add(castle);
         });
         castleListCallback(castleList);
       } else {
         print("The data does not exist!");
       }
     });
   }
}





