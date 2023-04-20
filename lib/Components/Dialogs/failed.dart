import 'package:flutter/material.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Variables/style.dart';

class FailedDialog extends StatefulWidget {
  FailedDialog({Key key, this.text}) : super(key: key);
  var text;

  @override
  _FailedDialog createState() => _FailedDialog();
}

class _FailedDialog extends State<FailedDialog> {
  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      title: const Text('Error'),
      content: SizedBox(
        width: fullWidth,
        height: 210,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset('assets/icons/Sorry.png',
                    width: fullWidth * 0.4),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(getMessageResponseFromObject(widget.text),
                      style: TextStyle(
                          color: dangerBg,
                          fontSize: textSm,
                          fontWeight: FontWeight.w500)))
            ]),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
            backgroundColor: MaterialStatePropertyAll<Color>(successBg),
          ),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
