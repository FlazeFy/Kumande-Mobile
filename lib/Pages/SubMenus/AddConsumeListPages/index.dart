import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

class AddConsumeListPage extends StatefulWidget {
  const AddConsumeListPage({Key key}) : super(key: key);

  @override
  State<AddConsumeListPage> createState() => _AddConsumeListPageState();
}

class _AddConsumeListPageState extends State<AddConsumeListPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
