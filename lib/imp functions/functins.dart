
import 'package:flutter/material.dart';

snackbar(context) {

ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('snack'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Deleted SuccessFully',
              onPressed: () { },
            ),
          ));
}
