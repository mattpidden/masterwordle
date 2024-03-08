import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/result_page.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

class KeyWidget extends StatefulWidget {
  final String letter;
  const KeyWidget({super.key, required this.letter});

  @override
  State<KeyWidget> createState() => _KeyWidgetState();
}

class _KeyWidgetState extends State<KeyWidget> {
  @override
  Widget build(BuildContext context) {
    bool borderThicker = false;

    return Consumer<MasterWordleModel>(
        builder: (context, masterWordleModel, child) {
      return Flexible(
        flex: (widget.letter == "delete" || widget.letter == "enter") ? 2 : 1,
        child: GestureDetector(
          onTapDown: (_) {
            setState(() {
              borderThicker = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              borderThicker = false;
            });
          },
          onTap: () {
            if (masterWordleModel.complete == false) {
              if (widget.letter == "delete") {
                masterWordleModel.handleDelete();
              } else if (widget.letter == "enter") {
                final result = masterWordleModel.handleEnter();
                if (result) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MasterWordleResultsPage()));
                }
              } else {
                masterWordleModel.letterTyped(widget.letter);
              }
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MasterWordleResultsPage()),
              );
            }
          },
          child: Container(
            height: 40,
            width: (widget.letter == "delete" || widget.letter == "enter")
                ? 80
                : 50,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(
                color: AppColors.blackColor,
                width: borderThicker ? 3.0 : 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                widget.letter.toUpperCase(),
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      (widget.letter == "delete" || widget.letter == "enter")
                          ? 10.0
                          : 16.0,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
