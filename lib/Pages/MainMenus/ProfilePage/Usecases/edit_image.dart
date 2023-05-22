import 'package:flutter/material.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/APIs/Models/User/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/User/Commands/commands.dart';
import 'package:kumande/Modules/Firebases/Storages/Images/delete_image.dart';
import 'package:kumande/Modules/Firebases/Storages/Images/post_image.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditImage extends StatefulWidget {
  const EditImage({Key key}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  UserCommandsService commandService;
  PostImage fireServicePost;
  DeleteImage fireServiceDelete;
  XFile file;

  @override
  void initState() {
    super.initState();
    commandService = UserCommandsService();
    fireServicePost = PostImage();
    fireServiceDelete = DeleteImage();
  }

  Future<XFile> getImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    bool isLoading;

    Future<UserMiniProfile> getToken() async {
      final prefs = await SharedPreferences.getInstance();
      final image = prefs.getString('image_key');
      return UserMiniProfile(username: null, image: image, gender: null);
    }

    Widget getResetImageProfile(String exist) {
      if (exist != null && exist != "null") {
        return FSMenuItem(
            icon: Icon(Icons.refresh, color: whiteBg),
            text: Text('Reset', style: TextStyle(fontSize: textMd)),
            gradient: redGradient,
            onTap: () async {
              await fireServiceDelete.deleteImageUser().then((value) {
                if (value == true) {
                  EditUserImageModel data = EditUserImageModel(imageUrl: null);

                  commandService.editImage(data).then((response) {
                    setState(() => isLoading = false);
                    var status = response[0]['message'];
                    var body = response[0]['body'];

                    if (status == "success") {
                      FullScreenMenu.hide();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomBar()),
                      );
                    } else {
                      FullScreenMenu.hide();
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              FailedDialog(text: body));
                    }
                  });
                } else {
                  FullScreenMenu.hide();
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          FailedDialog(text: "Failed to reset image"));
                }
              });
            });
      } else {
        return const SizedBox();
      }
    }

    return FutureBuilder<UserMiniProfile>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            String image = snapshot.data.image;

            return Positioned(
                top: 110,
                left: 130,
                child: InkWell(
                    onTap: () {
                      FullScreenMenu.show(
                        context,
                        items: [
                          FSMenuItem(
                              icon: Icon(Icons.camera, color: whiteBg),
                              text: Text('Camera',
                                  style: TextStyle(fontSize: textMd)),
                              gradient: orangeGradient,
                              onTap: () {}),
                          FSMenuItem(
                            icon: Icon(Icons.folder, color: whiteBg),
                            gradient: orangeGradient,
                            text: Text('File Picker',
                                style: TextStyle(fontSize: textMd)),
                            onTap: () async {
                              var file = await getImage();

                              if (file != null) {
                                await fireServicePost
                                    .sendImageUser(file)
                                    .then((value) {
                                  EditUserImageModel data =
                                      EditUserImageModel(imageUrl: value);

                                  commandService
                                      .editImage(data)
                                      .then((response) {
                                    setState(() => isLoading = false);
                                    var status = response[0]['message'];
                                    var body = response[0]['body'];

                                    if (status == "success") {
                                      FullScreenMenu.hide();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomBar()),
                                      );
                                    } else {
                                      FullScreenMenu.hide();
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              FailedDialog(text: body));
                                    }
                                  });
                                });
                              }
                            },
                          ),
                          getResetImageProfile(image)
                        ],
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(paddingContentSM * 1.5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: whiteBg),
                            color: containerBgThird,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset('assets/icons/Camera.png',
                              width: fullWidth * 0.1),
                        ))));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
