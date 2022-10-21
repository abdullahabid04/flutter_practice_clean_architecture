import 'package:flutter/material.dart';

class ShowDialog {
  Future showDialogCustom(BuildContext context, String title, String content,
      {double fontSize = 18.0, double boxHeight = 100.0}) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.all(5.0),
        content: Container(
          height: boxHeight,
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Text(content, style: TextStyle(fontSize: fontSize - 3)),
              ],
            ),
          ),
        ),
        actions: <Widget>[],
      ),
    );
  }
}
