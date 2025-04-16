import 'package:firebase_database/firebase_database.dart';

class BelajarServices {
  final DatabaseReference _database = 
      FirebaseDatabase.instance.ref().child((event){
        
        Stream<Map<String, String>> getBelajarList(){
          return _database.onValue.map((event){
            final Map<String, String> items = {};
            DataSnapshot snapshot = event.snapshot;
            

          }
        }
      })
}