import 'dart:async';
import 'dart:io';

import 'package:beatbox_app/enums/button_status.dart';
import 'package:beatbox_app/generated/l10n.dart';
import 'package:beatbox_app/utils/constants.dart';
import 'package:beatbox_app/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

const int SAMPLE_RATE = 8000;

typedef fn();

class BeatButton extends StatefulWidget {
  final String mFileName;

  const BeatButton({Key key, this.mFileName}) : super(key: key);

  @override
  _BeatButtonState createState() => _BeatButtonState();
}

class _BeatButtonState extends State<BeatButton> {
  Color _color = kActiveCardColor;
  ButtonStatus _currentState = ButtonStatus.IDLE;
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mPlaybackReady = false;
  String _mPath;
  StreamSubscription _mRecordingDataSubscription;

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  void initAudio() async {
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    await _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    await _mRecorder.openAudioSession().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer.closeAudioSession();
    _mPlayer = null;

    stopRecorder();
    _mRecorder.closeAudioSession();
    _mRecorder = null;
    super.dispose();
  }

  Future<IOSink> createFile() async {
    Directory tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/${widget.mFileName}.pcm';
    File outputFile = File(_mPath);
    if (outputFile.existsSync()) await outputFile.delete();
    return outputFile.openWrite();
  }

  // ----------------------  Here is the code to record to a Stream ------------

  Future<void> record() async {
    assert(_mRecorderIsInited && _mPlayer.isStopped);
    IOSink sink = await createFile();
    StreamController<Food> recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription =
        recordingDataController.stream.listen((Food buffer) {
      if (buffer is FoodData) sink.add(buffer.data);
    });
    await _mRecorder.startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: SAMPLE_RATE,
    );
    setState(() {});
  }

  // --------------------- (it was very simple, wasn't it ?) -------------------

  Future<void> stopRecorder() async {
    await _mRecorder.stopRecorder();
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription.cancel();
      _mRecordingDataSubscription = null;
    }
    _mPlaybackReady = true;
  }

  fn getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) return null;
    return _mRecorder.isStopped
        ? record
        : () {
            stopRecorder().then((value) => setState(() {}));
          };
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mPlaybackReady &&
        _mRecorder.isStopped &&
        _mPlayer.isStopped);
    await _mPlayer.startPlayer(
        fromURI: _mPath,
        sampleRate: SAMPLE_RATE,
        codec: Codec.pcm16,
        numChannels: 1,
        whenFinished: () {
          setState(() {});
          play();
        }); // The readability of Dart is very special :-(
    setState(() {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer.stopPlayer();
  }

  fn getPlaybackFn() {
    if (!_mPlayerIsInited || !_mPlaybackReady || !_mRecorder.isStopped)
      return null;
    return _mPlayer.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void onPress() async {
    switch (_currentState) {
      case ButtonStatus.IDLE:
        Notifications.showToast(
          S.of(context).recording,
        );
        await record();
        setState(() {
          _color = kRecordingColor;
          _currentState = ButtonStatus.REC;
        });
        break;

      case ButtonStatus.REC:
        Notifications.showToast(
          S.of(context).audioStored,
        );
        stopRecorder();
        setState(() {
          _color = kPauseColor;
          _currentState = ButtonStatus.PAUSE;
        });
        break;

      case ButtonStatus.PLAY:
        Notifications.showToast(
          S.of(context).pause,
        );
        await stopPlayer();
        setState(() {
          _color = kPauseColor;
          _currentState = ButtonStatus.PAUSE;
        });
        break;

      case ButtonStatus.PAUSE:
        Notifications.showToast(
          S.of(context).playing,
        );
        play();
        setState(() {
          _color = kPlayColor;
          _currentState = ButtonStatus.PLAY;
        });
        break;

      default:
        onLongPress();
        break;
    }
  }

  void onLongPress() async {
    await stopRecorder();
    await stopPlayer();
    setState(() {
      Notifications.showToast(
        S.of(context).reset,
      );
      _color = kActiveCardColor;
      _currentState = ButtonStatus.IDLE;
    });
  }
}
