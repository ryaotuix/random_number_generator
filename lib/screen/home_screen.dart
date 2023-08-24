import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "랜덤숫자 생성기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),

              // MID ROW
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: randomNumbers
                        .asMap()
                        .entries
                        .map(
                          (e) => Padding(
                            padding:
                                EdgeInsets.only(bottom: e.key == 2 ? 0 : 20),
                            child: Row(
                                children: e.value
                                    .toString()
                                    .split('')
                                    .map(
                                      (x) => Image.asset(
                                        "asset/img/$x.png",
                                        height: 70,
                                        width: 50,
                                      ),
                                    )
                                    .toList()),
                          ),
                        )
                        .toList()),
              ),

              // FOOTER ROW
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RED_COLOR,
                  ),
                  onPressed: () {
                    final rand = Random();
                    final Set<int> newNms = {};

                    while(newNms.length != 3) {
                      final number = rand.nextInt(1000);
                      newNms.add(number);
                    }

                    setState(() {
                      randomNumbers = newNms.toList();
                    });

                    print(newNms);
                  },
                  child: Text("생성하기"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
