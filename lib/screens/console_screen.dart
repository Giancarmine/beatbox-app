import 'package:beatbox_app/components/beat_button.dart';
import 'package:beatbox_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ConsoleScreen extends StatefulWidget {
  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: GridView.builder(
        itemCount: 30,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return BeatButton(
            mFileName: index.toString(),
          );
        },
      ),
    );
  }
}
