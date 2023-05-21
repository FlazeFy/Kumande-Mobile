import 'package:flutter/material.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/APIs/Models/User/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/User/Commands/commands.dart';
import 'package:kumande/Modules/Firebases/Storages/post_image.dart';
import 'package:kumande/Modules/Variables/style.dart';

class EditImage extends StatefulWidget {
  const EditImage({Key key}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  UserCommandsService commandService;
  PostImage fireService;
  XFile file;

  @override
  void initState() {
    super.initState();
    commandService = UserCommandsService();
    fireService = PostImage();
  }

  Future<XFile> getImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    bool isLoading;

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
                      text: Text('Camera', style: TextStyle(fontSize: textMd)),
                      gradient: orangeGradient,
                      onTap: () {}),
                  FSMenuItem(
                    icon: Icon(Icons.folder, color: whiteBg),
                    gradient: orangeGradient,
                    text:
                        Text('File Picker', style: TextStyle(fontSize: textMd)),
                    onTap: () async {
                      var file = await getImage();

                      if (file != null) {
                        await fireService.sendImage(file).then((value) {
                          EditUserImageModel data =
                              EditUserImageModel(imageUrl: value);

                          commandService.editImage(data).then((response) {
                            setState(() => isLoading = false);
                            var status = response[0]['message'];
                            var body = response[0]['body'];

                            if (status == "success") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBar()),
                              );
                            } else {
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
                ],
              );
            },
            child: Container(
                padding: EdgeInsets.all(paddingContentSM * 1.5),
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: whiteBg),
                    color: containerBgThird,
                    borderRadius: const BorderRadius.all(Radius.circular(25))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.asset('assets/icons/Camera.png',
                      width: fullWidth * 0.1),
                ))));
  }
}
