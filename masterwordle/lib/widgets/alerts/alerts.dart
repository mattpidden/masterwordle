import 'package:flutter/material.dart';
import 'package:masterwordle/styles/app_colors.dart';

class CustomAlert extends StatefulWidget {
  final String title;
  final String message;
  final String buttonText;
  final String? actionButtonText;
  final VoidCallback? actionButton;
  final Color? actionButtonColour;
  final Color alertColor;
  final IconData icon;

  const CustomAlert(
      {super.key,
      required this.title,
      required this.message,
      required this.buttonText,
      required this.alertColor,
      required this.icon,
      this.actionButtonText,
      this.actionButton,
      this.actionButtonColour});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  final double alertWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: alertWidth,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: -40.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Icon(
                      widget.icon,
                      size: 36.0,
                      color: widget.alertColor,
                    ),
                  ],
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8.0),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Flexible(
                    child: Text(
                  widget.message,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (widget.actionButtonText != null)
                        ? Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                Flexible(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(widget.buttonText),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (widget.actionButton != null) {
                                        widget.actionButton!();
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(widget.actionButtonText!),
                                  ),
                                ),
                              ]))
                        : TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              widget.buttonText,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WarningAlert extends CustomAlert {
  const WarningAlert({
    super.key,
    required super.title,
    required super.message,
  }) : super(
            buttonText: 'Understood',
            alertColor: AppColors.warningColor,
            icon: Icons.report);
}

class ErrorAlert extends CustomAlert {
  const ErrorAlert({
    super.key,
    required super.title,
    required super.message,
  }) : super(
            buttonText: 'Understood',
            alertColor: AppColors.errorColor,
            icon: Icons.error);
}

class SuccessAlert extends CustomAlert {
  const SuccessAlert({
    super.key,
    required super.title,
    required super.message,
  }) : super(
            buttonText: 'Great',
            alertColor: AppColors.successColor,
            icon: Icons.check_circle);
}

class NeutralAlert extends CustomAlert {
  const NeutralAlert({
    super.key,
    required super.title,
    required super.message,
  }) : super(
            buttonText: 'Done',
            alertColor: AppColors.primaryColor,
            icon: Icons.info);
}

class ActionAlert extends CustomAlert {
  const ActionAlert(
      {super.key,
      required super.title,
      required super.message,
      required super.actionButtonText,
      required super.actionButton,
      super.actionButtonColour = AppColors.primaryColor})
      : super(
            buttonText: 'Cancel',
            alertColor: AppColors.primaryColor,
            icon: Icons.priority_high);
}
