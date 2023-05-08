import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Commands/commands_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumeListCommandsFirestore {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('consume_list');

  Future<String> addConsumeList(AddConsumeListModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id_key');

    try {
      DocumentReference doc = await firestore.add({
        'list_name': data.listName,
        'list_desc': data.listDesc,
        'list_tag': data.listTag,
        'created_at': DateTime.tryParse(DateTime.now().toIso8601String()),
        'created_by': userid,
        'updated_at': null,
        'updated_by': null
      });
      return doc.id;
    } catch (err) {
      return err;
    }
  }
}
