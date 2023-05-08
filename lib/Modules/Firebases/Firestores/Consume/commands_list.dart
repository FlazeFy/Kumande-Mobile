import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Commands/commands_list.dart';

class ConsumeListCommandsFirestore {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('consume_list');

  Future<String> addConsumeList(AddConsumeListModel data) async {
    try {
      DocumentReference doc = await firestore.add({
        'list_name': data.listName,
        'list_desc': data.listDesc,
        'list_tag': data.listTag,
        'created_at': DateTime.tryParse(DateTime.now().toIso8601String()),
        'created_by': null,
      });
      return doc.id;
    } catch (err) {
      return err;
    }
  }
}
