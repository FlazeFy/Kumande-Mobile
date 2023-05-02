import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/consume.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries_list.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Queries/queries_list.dart';

class GetAllConsumeListWPagination extends StatefulWidget {
  GetAllConsumeListWPagination({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetAllConsumeListWPagination createState() =>
      _GetAllConsumeListWPagination();
}

class _GetAllConsumeListWPagination extends State<GetAllConsumeListWPagination>
    with TickerProviderStateMixin {
  QueriesConsumeListService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeListService();
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAllConsumeList(10, "desc"),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumeListModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumeListModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesConsumeListModel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: contents.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return getConsumeListContainer(contents[index].listName,
              contents[index].listDesc, contents[index].listTag);
        });
  }
}
