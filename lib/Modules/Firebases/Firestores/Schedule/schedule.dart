import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kumande/Modules/APIs/Models/Schedule/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleCommandsFirestore {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('schedule');

  Future<String> addSchedule(AddScheduleModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userid = prefs.getString('id_key');
      DocumentReference doc = await firestore.add({
        'schedule_consume': data.scheduleConsume,
        'consume_type': data.consumeType,
        'consume_detail': data.consumeDetail,
        'schedule_desc': data.scheduleDesc,
        'schedule_tag': data.scheduleTag,
        'schedule_time': data.scheduleTime,
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
