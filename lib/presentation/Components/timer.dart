import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wasel_app/presentation/constants.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _start = 59;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_start ~/ 60).toString().padLeft(2, '0');
    String seconds = (_start % 60).toString().padLeft(2, '0');
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'Resend code in ',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      TextSpan(
        text: '$minutes:$seconds',
        style: TextStyle(fontSize: 18, color: blue),
      )
    ]));
  }
}
