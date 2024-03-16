import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

class MasterWordleClue extends StatelessWidget {
  final int row;
  final bool greenClue;
  const MasterWordleClue({
    super.key,
    required this.row,
    required this.greenClue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(builder: (context, masterWordleModel, child) {
      final score = masterWordleModel.scores[row];
      final cluesActive = greenClue ? score[1] : score[0];
      bool topLeftActive = cluesActive >= 1 ? true : false;
      bool bottomLeftActive = cluesActive >= 2 ? true : false;
      bool topRightActive = cluesActive >= 3 ? true : false;
      bool bottomRightActive = cluesActive >= 4 ? true : false;
      final fillColor = greenClue ? AppColors.successColor : AppColors.warningColor;

      return Row(
        children: [
          Column(
            children: [
              MasterWordleClueCircle(fillColor: topLeftActive ? fillColor : Colors.transparent),
              const SizedBox(
                height: 3,
              ),
              MasterWordleClueCircle(fillColor: bottomLeftActive ? fillColor : Colors.transparent)
            ],
          ),
          const SizedBox(
            width: 3,
          ),
          Column(
            children: [
              MasterWordleClueCircle(fillColor: topRightActive ? fillColor : Colors.transparent),
              const SizedBox(
                height: 3,
              ),
              MasterWordleClueCircle(fillColor: bottomRightActive ? fillColor : Colors.transparent)
            ],
          ),
        ],
      );
    });
  }
}

class MasterWordleClueCircle extends StatelessWidget {
  final Color fillColor;
  const MasterWordleClueCircle({super.key, required this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(builder: (context, masterWordleModel, child) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
          border: Border.all(
            color: fillColor == Colors.transparent ? Colors.transparent : AppColors.blackColor,
            width: 1.0,
          ),
        ),
      );
    });
  }
}
