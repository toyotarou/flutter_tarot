// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Future<void> TarotDialog({required BuildContext context, required Widget widget}) {
  return showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        insetPadding: const EdgeInsets.all(30),
        child: widget,
      );
    },
  );
}
