import 'package:beatbox_app/components/beat_button.dart';
import 'package:beatbox_app/config.dart';
import 'package:beatbox_app/generated/l10n.dart';
import 'package:beatbox_app/screens/console_screen.dart';
import 'package:beatbox_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    currentConfig.afterFirstTime();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ConsoleScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: kInactiveCardColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: S.of(context).introTitle,
          body: S.of(context).introDetail,
          image: _buildImage('headphones'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).permissionTitle,
          body: S.of(context).permissionDetail,
          image: _buildImage('hdd'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).featuresTitle,
          body: S.of(context).featuresDetail,
          image: _buildImage('folder'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).testTitle,
          body: S.of(context).testDetail,
          footer: GridView.builder(
            itemCount: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, index) {
              return BeatButton(
                mFileName: '0',
              );
            },
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).lastTitle,
          body: S.of(context).lastDetail,
          image: _buildImage('headphones'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(S.of(context).skip),
      next: const Icon(Icons.arrow_forward),
      done: Text(S.of(context).done,
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: kRecordingColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
