import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

class AddConsumePage extends StatefulWidget {
  const AddConsumePage({Key key}) : super(key: key);

  @override
  State<AddConsumePage> createState() => _AddConsumePageState();
}

class _AddConsumePageState extends State<AddConsumePage> {
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
