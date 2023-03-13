// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[300],
        appBar: AppBar(
          title: const Center(child: Text('Dice App')),
          backgroundColor: Colors.red,
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DiceApp(),
        )),
      ),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 5;
  bool isWon = false;
  @override
  Widget build(BuildContext context) {
    isWon = false;
    handleDiceButtonPress({String? btnPosition = 'Left'}) {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
      debugPrint('$btnPosition Button pressed $leftDiceNumber');
    }

    if (leftDiceNumber == rightDiceNumber) {
      isWon = true;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      handleDiceButtonPress();
                    },
                    child:
                        Image.asset('assets/images/dice$leftDiceNumber.png')),
              ),
              const SizedBox(
                width: 24.0,
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      handleDiceButtonPress(btnPosition: 'Right');
                      print('Right Button pressed $rightDiceNumber');
                    },
                    child:
                        Image.asset('assets/images/dice$rightDiceNumber.png')),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Text(
            isWon
                ? 'You won'
                : 'You rolled $leftDiceNumber and $rightDiceNumber',
            style: const TextStyle(fontFamily: 'Pacifico', fontSize: 24.0),
          )
        ],
      ),
    );
  }
}
