import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:masterwordle/widgets/alerts/invalid_word.dart';
import 'package:masterwordle/widgets/alerts/show_alerts.dart';
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
    return Consumer<MasterWordleModel>(builder: (context, masterWordleModel, child) {
      return Stack(
        children: [
          SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                centerTitle: true,
                title: Title(
                    color: AppColors.backgroundColor,
                    child: const Text(
                      "MastterWordle",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w900),
                    )),
                actions: [
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlert(
                          context,
                          "Instructions",
                          """Enter a 4 letter word.
            
            A yellow circle means you have a correct letter in the wrong spot.
            
            A green circle means you have a correct letter in the correct spot.
            
            If no circles appear, you have no correct letters at all.
            
            Use this feedback to narrow your guesses and get todays word in 8 goes or less.""",
                          AlertType.neutral);
                    },
                    child: const Icon(
                      Icons.info_outline,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
              body: SafeArea(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // The board
                        Expanded(
                          child: ListView(
                            children: const [
                              MasterWordleBoard(),
                            ],
                          ),
                        ),
                        // Keyboard
                        const KeyboardWidget()
                      ],
                    ),
                  ),
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
