import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Count/Models/Queries/queries_calorie.dart';
import 'package:kumande/Modules/APIs/Count/Services/Queries/queries_calorie.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';

class GetFulfillCalorie extends StatefulWidget {
  GetFulfillCalorie({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetFulfillCalorie createState() => _GetFulfillCalorie();
}

class _GetFulfillCalorie extends State<GetFulfillCalorie>
    with TickerProviderStateMixin {
  QueriesCountCalorieService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesCountCalorieService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService
            .getFulfillCalorie(getDateText(DateTime.now(), null, "datev2")),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesFulfillCalorieModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesFulfillCalorieModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesFulfillCalorieModel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   ctx,
        //   MaterialPageRoute(builder: (context) => route),
        // );
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primaryBg, secondaryBg],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/icons/Calorie.png',
                        width: fullWidth * 0.12),
                  ),
                  const Spacer(),
                  Text("Today \n Calories",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: whiteBg,
                          fontSize: textLg,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Container(
                  alignment: Alignment.centerRight,
                  width: fullWidth * 0.45,
                  margin: EdgeInsets.only(top: paddingContentSM),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "${contents[0].total} /",
                            style: TextStyle(
                                color: whiteBg, fontSize: textLg + textSm / 4)),
                        TextSpan(
                          text: " ${contents[0].target} Cal",
                          style: TextStyle(color: whiteBg, fontSize: textMd),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
