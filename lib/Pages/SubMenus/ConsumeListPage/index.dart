import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/ConsumeListPage/Usecases/get_all_consume_list.dart';

class ConsumeListPage extends StatefulWidget {
  const ConsumeListPage({Key key}) : super(key: key);

  @override
  State<ConsumeListPage> createState() => _ConsumeListPageState();
}

class _ConsumeListPageState extends State<ConsumeListPage> {
  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Consume List"),
      body: GetAllConsumeListWPagination(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
