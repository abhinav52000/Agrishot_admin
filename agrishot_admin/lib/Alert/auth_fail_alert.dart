import 'package:flutter/material.dart';

authAlert({required var response, required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String errormessage;
      if (response['code'] == 422) {
        try {
          errormessage = response['errors']['password'][0];
        } catch (e) {
          errormessage = response['errors']['email'][0] +
              '\nor\n' +
              response['errors']['email'][1];
        }
      } else {
        errormessage = response['message'];
      }

      return AlertDialog(
        title: const Text("Error"),
        content: Text(
          errormessage,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
