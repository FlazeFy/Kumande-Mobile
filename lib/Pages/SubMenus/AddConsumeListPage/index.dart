import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class AddConsumeListPage extends StatefulWidget {
  const AddConsumeListPage({Key key}) : super(key: key);

  @override
  State<AddConsumeListPage> createState() => _AddConsumeListPageState();
}

class _AddConsumeListPageState extends State<AddConsumeListPage> {
  var consumeListDescCtrl = TextEditingController();
  var consumeListNameCtrl = TextEditingController();

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Add Consume List"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          getInputLabel("Consume", primaryBg, textLg),
          const SizedBox(height: 10),
          getInputLabel("Name", textPrimary, textSm),
          getInputTextMain(consumeListNameCtrl, "ex : healthy food", 50),
          const SizedBox(height: 10),
          Divider(
            height: paddingDivider,
            thickness: 1,
          ),
          getInputLabel("Description", primaryBg, textLg),
          const SizedBox(height: 10),
          getInputDescMain(consumeListDescCtrl,
              "ex : vegetables, fruits, juice, etc", 255, 5, 5),
          const SizedBox(height: 10),
          Divider(
            height: paddingDivider,
            thickness: 1,
          ),
          getInputLabel("My Tag", primaryBg, textLg),
          generateTag(tagListDummy, _refreshPage, "tag_consume_list"),
          const SizedBox(height: 10),
          generateSelectedTag(
              selectedTagConsumeList, _refreshPage, "tag_consume_list")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
