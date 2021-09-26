import 'package:flutter/material.dart';

confirmDismiss(BuildContext context, DismissDirection direction) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Confirmation"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Delete")),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}
