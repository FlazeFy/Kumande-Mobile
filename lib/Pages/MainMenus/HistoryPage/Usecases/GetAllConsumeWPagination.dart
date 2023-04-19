import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/consume.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Queries/queries.dart';

class GetAllConsumeWPagination extends StatefulWidget {
  const GetAllConsumeWPagination({Key key}) : super(key: key);

  @override
  _GetAllConsumeWPagination createState() => _GetAllConsumeWPagination();
}

class _GetAllConsumeWPagination extends State<GetAllConsumeWPagination>
    with TickerProviderStateMixin {
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAllConsume(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumeModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumeModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesConsumeModel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: contents.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return getConsumeHistoryContainer(
              contents[index].consumeName,
              contents[index].paymentPrice,
              contents[index].consumeComment,
              contents[index].consumeType,
              contents[index].consumeFrom,
              contents[index].consumeDetail,
              contents[index].consumeTag);
        });
  }
}