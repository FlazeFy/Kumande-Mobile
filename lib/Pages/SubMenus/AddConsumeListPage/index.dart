import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Commands/commands_list.dart';
import 'package:kumande/Modules/APIs/Consume/Services/Commands/commands_list.dart';
import 'package:kumande/Modules/Firebases/Firestores/Consume/commands_list.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/AddConsumeListPage/Usecases/post_consume_list.dart';
import 'package:kumande/Pages/SubMenus/ConsumeListPage/index.dart';

class AddConsumeListPage extends StatefulWidget {
  const AddConsumeListPage({Key key}) : super(key: key);

  @override
  State<AddConsumeListPage> createState() => _AddConsumeListPageState();
}

class _AddConsumeListPageState extends State<AddConsumeListPage> {
  var listDescCtrl = TextEditingController();
  var listNameCtrl = TextEditingController();
  ConsumeListCommandsService apiService;
  ConsumeListCommandsFirestore fireService;

  @override
  void initState() {
    super.initState();
    apiService = ConsumeListCommandsService();
    fireService = ConsumeListCommandsFirestore();
  }

  @override
  void dispose() {
    listNameCtrl.dispose();
    listDescCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Scaffold(
      appBar: getAppbar("Add Consume List"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          PostConsumeList(
              listNameCtrl: listNameCtrl, listDescCtrl: listDescCtrl)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () async {
          AddConsumeListModel data = AddConsumeListModel(
              listName: listNameCtrl.text,
              listDesc: listDescCtrl.text,
              listTag: selectedTagConsumeList);

          // Firebase
          try {
            var res = await fireService.addConsumeList(data);
            data.fireId = res;
            data.listTag = jsonEncode(selectedTagConsumeList);

            // API
            if (data.listName.isNotEmpty && data.listDesc.isNotEmpty) {
              apiService.addConsumeList(data).then((response) {
                setState(() => _isLoading = false);
                var status = response[0]['status'];
                var body = response[0]['body'];

                if (status == "success") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsumeListPage()),
                  );
                  setState(() {
                    page = 1;
                  });
                } else {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          FailedDialog(text: body));

                  listNameCtrl.clear();
                  listDescCtrl.clear();
                }
              });
            } else {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => FailedDialog(
                      text: "Add list, some field can't be empty"));
            }
          } catch (error) {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => FailedDialog(text: error));
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
