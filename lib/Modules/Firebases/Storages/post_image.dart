import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostImage {
  Future<String> sendImage(XFile imageFile) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id_key');
    String url;
    String seed;

    if (imageFile != null) {
      seed = getRandomString(20);

      Reference ref = FirebaseStorage.instance.ref('users').child("$id-$seed");

      final metadata = SettableMetadata(
        //contentType: 'image',
        customMetadata: {'picked-file-path': imageFile.path},
      );

      //return await ref.putData(await imageFile.readAsBytes(), metadata);
      await ref.putData(await imageFile.readAsBytes(), metadata);

      url = await ref.getDownloadURL();
    } else {
      url = null;
    }

    return url;
  }
}
