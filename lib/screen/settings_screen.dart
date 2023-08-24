import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

import '../component/number_row.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNum;

  const SettingsScreen({required this.maxNum, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNum = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    maxNum = widget.maxNum.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // body
              _Body(maxNum: maxNum),

              // footer
              _Footer(
                maxNum: maxNum,
                onSliderChanged: onSliderChagned,
                onButtonPressed: onButtonPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChagned(double val) {
    setState(() {
      maxNum = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNum.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNum;

  const _Body({required this.maxNum, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(num: maxNum.toInt()),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNum;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const _Footer(
      {required this.onButtonPressed,
      required this.maxNum,
      required this.onSliderChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNum,
          min: 1000,
          max: 1000000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: RED_COLOR,
          ),
          child: Text("저장!"),
        ),
      ],
    );
  }
}
