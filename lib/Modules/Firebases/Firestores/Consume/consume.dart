import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumeCommandsFirestore {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('consume');

  Future<String> addConsume(AddConsumeModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userid = prefs.getString('id_key');
      DocumentReference doc = await firestore.add({
        'consume_name': data.consumeName,
        'consume_type': data.consumeType,
        'consume_detail': data.consumeDetail,
        'consume_from': data.consumeFrom,
        'is_favorite': 0,
        'consume_tag': data.consumeTag,
        'consume_comment': data.consumeComment,
        'created_at': DateTime.tryParse(DateTime.now().toIso8601String()),
        'updated_at': null,
        'deleted_at': null,
        'created_by': userid,
        'updated_by': null,
        'deleted_by': null,
      });
      return doc.id;
    } catch (err) {
      return err;
    }
  }
}
