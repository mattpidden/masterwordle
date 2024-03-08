import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

class MasterWordleBoardSquare extends StatelessWidget {
  final int row;
  final int column;
  const MasterWordleBoardSquare(
      {super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(
        builder: (context, masterWordleModel, child) {
      bool currentSquare = (masterWordleModel.currentWord == row &&
          masterWordleModel.currentLetter == column);
      bool lastSquare = (masterWordleModel.currentWord == row &&
          masterWordleModel.currentLetter - 1 == column);
      return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: currentSquare
              ? AppColors.primaryColor.withAlpha(50)
              : AppColors.backgroundColor,
          border: Border.all(
            color: (currentSquare || lastSquare)
                ? AppColors.primaryColor
                : AppColors.blackColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            masterWordleModel.boardSquareLetter(row, column).toUpperCase(),
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
