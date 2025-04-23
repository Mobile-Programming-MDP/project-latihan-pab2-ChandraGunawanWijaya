import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  final String title;
  final String description;
  String? imageUrl;
  Timestamp? createdAt;
  Timestamp> updatedAt;


}
