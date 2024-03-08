import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:masterwordle/widgets/alerts/invalid_word.dart';
import 'package:masterwordle/widgets/board.dart';
import 'package:masterwordle/widgets/keyboard.dart';
import 'package:provider/provider.dart';

class MasterWordlePage extends StatefulWidget {
  const MasterWordlePage({super.key});

  @override
  State<MasterWordlePage> createState() => _MasterWordlePageState();
}

class _MasterWordlePageState extends State<MasterWordlePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MasterWordleModel>(context, listen: false).populateValidWords();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(
        builder: (context, masterWordleModel, child) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                title: Title(
                    color: AppColors.backgroundColor,
                    child: const Text(
                      "MasterWordle",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w900),
                    ))),
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // The board
                    Expanded(
                      child: ListView(
                        children: [
                          MasterWordleBoard(),
                        ],
                      ),
                    ),
                    // Keyboard
                    KeyboardWidget()
                  ],
                ),
              ),
            ),
          ),
          SmallDropdownAlert(
            message: "INVALID WORD",
            hidden: !masterWordleModel.showInvalidWord,
          )
        ],
      );
    });
  }
}
