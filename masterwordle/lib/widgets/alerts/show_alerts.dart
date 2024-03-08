import 'package:flutter/material.dart';
import 'alerts.dart';

enum AlertType { success, error, warning, neutral, action }

Future<void> showAlert(
    BuildContext context, String title, String message, AlertType type,
    {String? actionButtonText,
    VoidCallback? actionButton,
    Color? actionButtonColour,
    Function(String)? submitString}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      switch (type) {
        case AlertType.success:
          return SuccessAlert(title: title, message: message);
        case AlertType.error:
          return ErrorAlert(title: title, message: message);
        case AlertType.warning:
          return WarningAlert(title: title, message: message);
        case AlertType.neutral:
          return NeutralAlert(title: title, message: message);
        case AlertType.action:
          return ActionAlert(
            title: title,
            message: message,
            actionButtonText: actionButtonText,
            actionButton: actionButton,
            actionButtonColour: actionButtonColour,
          );
      }
    },
  );
}
