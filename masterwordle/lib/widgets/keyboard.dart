import 'package:flutter/material.dart';
import 'package:masterwordle/widgets/key.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(letter: "q"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "w"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "e"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "r"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "t"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "y"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "u"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "i"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "o"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "p"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(letter: "a"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "s"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "d"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "f"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "g"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "h"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "j"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "k"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "l"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(letter: "enter"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "z"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "x"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "c"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "v"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "b"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "n"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "m"),
              SizedBox(
                width: 3,
              ),
              KeyWidget(letter: "delete"),
            ],
          )
        ],
      ),
    );
  }
}
