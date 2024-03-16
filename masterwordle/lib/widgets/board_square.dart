import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

class MasterWordleBoardSquare extends StatelessWidget {
  final int row;
  final int column;
  const MasterWordleBoardSquare({super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(builder: (context, masterWordleModel, child) {
      bool currentSquare = (masterWordleModel.currentWord == row && masterWordleModel.currentLetter == column);
      String letter = masterWordleModel.boardSquareLetter(row, column).toUpperCase();
      bool empty = letter.isEmpty;
      bool rowComplete = masterWordleModel.rowComplete(row);
      return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: currentSquare
              ? AppColors.primaryColor.withAlpha(50)
              : rowComplete
                  ? AppColors.backgroundColor
                  : AppColors.whiteColor,
          border: Border.all(
            color: currentSquare
                ? AppColors.primaryColor
                : (!empty && !rowComplete)
                    ? AppColors.greyColor
                    : AppColors.lightGreyColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            letter,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      );
    });
  }
}
