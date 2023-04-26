import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Commands/commandsList.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class PostConsumeList extends StatefulWidget {
  PostConsumeList({Key key, this.listNameCtrl, this.listDescCtrl})
      : super(key: key);
  TextEditingController listNameCtrl;
  TextEditingController listDescCtrl;

  @override
  State<PostConsumeList> createState() => _PostConsumeListState();
}

class _PostConsumeListState extends State<PostConsumeList> {
  var listDescCtrl = TextEditingController();
  var listNameCtrl = TextEditingController();
  ConsumeListCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ConsumeListCommandsService();
  }

  void _refreshPage() {
    setState(() {});
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getInputLabel("Consume", primaryBg, textLg),
        const SizedBox(height: 10),
        getInputLabel("Name", textPrimary, textSm),
        getInputTextMain(widget.listNameCtrl, "ex : healthy food", 50),
        const SizedBox(height: 10),
        Divider(
          height: paddingDivider,
          thickness: 1,
        ),
        getInputLabel("Description", primaryBg, textLg),
        const SizedBox(height: 10),
        getInputDescMain(widget.listDescCtrl,
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
    );
  }
}
