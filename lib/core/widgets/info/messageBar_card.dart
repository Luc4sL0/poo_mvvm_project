import 'package:flutter/material.dart';

void showMessageBar({
  required BuildContext context,
  IconData icon = Icons.info,
  required String content,
  bool error = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: error ? Colors.red : Colors.green,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        behavior: SnackBarBehavior.floating,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        )),
  );
}
