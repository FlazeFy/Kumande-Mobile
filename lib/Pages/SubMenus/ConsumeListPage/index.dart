import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ConsumeListPage extends StatefulWidget {
  const ConsumeListPage({Key key}) : super(key: key);

  @override
  State<ConsumeListPage> createState() => _ConsumeListPageState();
}

class _ConsumeListPageState extends State<ConsumeListPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: const [],
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
