import 'package:flutter/material.dart';
import 'package:masterwordle/styles/app_colors.dart';

class SmallDropdownAlert extends StatelessWidget {
  final String message;
  final bool hidden;
  const SmallDropdownAlert(
      {super.key, required this.message, required this.hidden});

  @override
  Widget build(BuildContext context) {
    return hidden
        ? const SizedBox.shrink()
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
  }
}
