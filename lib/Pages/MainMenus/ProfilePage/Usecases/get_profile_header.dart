import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/tag.dart';
import 'package:kumande/Components/Others/image.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProfileHeader extends StatelessWidget {
  const ShowProfileHeader({Key key}) : super(key: key);

  Future<UserMiniProfile> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username_key');
    final image = prefs.getString('image_key');
    final gender = prefs.getString('gender_key');
    return UserMiniProfile(username: username, image: image, gender: gender);
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<UserMiniProfile>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            String username = snapshot.data.username;
            String image = snapshot.data.image;
            String gender = snapshot.data.gender;

            return Container(
              width: fullWidth,
              padding:
                  EdgeInsets.only(top: fullHeight * 0.04, right: 20, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getProfileImageSideBar(fullWidth, 0.35, image, gender),
                    SizedBox(height: paddingContainerLG),
                    Text(username,
                        style: TextStyle(
                            color: whiteBg,
                            fontSize: textJumbo * 0.8,
                            fontWeight: FontWeight.w500)),
                    getTagWhite(gender, textLg)
                  ]),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
