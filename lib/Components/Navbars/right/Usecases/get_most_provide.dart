import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';

class GetConsumeProvide extends StatefulWidget {
  const GetConsumeProvide({Key key}) : super(key: key);

  @override
  State<GetConsumeProvide> createState() => _GetConsumeProvideState();
}

class _GetConsumeProvideState extends State<GetConsumeProvide> {
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalConsumeByProvide(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumePieChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            provideList.clear();
            List<QueriesConsumePieChartModel> contents = snapshot.data;

            if (provideList.isEmpty) {
              for (var e in contents) {
                bool found = false;
                if (selectedProvideList.isNotEmpty) {
                  for (var x in selectedProvideList) {
                    if (x == e.ctx) {
                      found = true;
                    }
                  }
                  if (!found) {
                    provideList.add({
                      "slug_name": e.ctx,
                      "tag_name": "${e.ctx} (${e.total})"
                    });
                  }
                } else {
                  provideList.add({
                    "slug_name": e.ctx,
                    "tag_name": "${e.ctx} (${e.total})"
                  });
                }
              }
            }

            return _buildListView(provideList);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> contents) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      generateTag(contents, _refreshPage, "tag_consume_filter"),
      generateSelectedTag(
          selectedProvideList, _refreshPage, "tag_consume_filter")
    ]);
  }
}
