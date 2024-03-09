import 'package:flutter/material.dart';
import 'package:masterwordle/widgets/board_square.dart';
import 'package:masterwordle/widgets/clue.dart';

class MasterWordleBoard extends StatelessWidget {
  const MasterWordleBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: List.generate(
            8,
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MasterWordleClue(
                  row: row,
                  greenClue: false,
                ),
                SizedBox(
                  width: 5,
                ),
                MasterWordleBoardSquare(row: row, column: 0),
                SizedBox(
                  width: 3,
                ),
                MasterWordleBoardSquare(row: row, column: 1),
                SizedBox(
                  width: 3,
                ),
                MasterWordleBoardSquare(row: row, column: 2),
                SizedBox(
                  width: 3,
                ),
                MasterWordleBoardSquare(row: row, column: 3),
                SizedBox(
                  width: 5,
                ),
                MasterWordleClue(
                  row: row,
                  greenClue: true,
                ),
              ]),
            ),
          ),
        ));
  }
}