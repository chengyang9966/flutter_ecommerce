import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String alertTitle, String alertMessage,
    VoidCallback okFunction, VoidCallback? cancelFunction) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
      cancelFunction!();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Ok"),
    onPressed: () {
      Navigator.pop(context);
      okFunction();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(alertTitle),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            alertMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
