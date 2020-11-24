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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BeatButton(
                  mFileName: '1',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '2',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '3',
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BeatButton(
                  mFileName: '4',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '5',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '6',
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BeatButton(
                  mFileName: '7',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '8',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '9',
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BeatButton(
                  mFileName: '10',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '11',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '12',
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BeatButton(
                  mFileName: '13',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '14',
                )),
                Expanded(
                    child: BeatButton(
                  mFileName: '15',
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
