import 'package:flutter/material.dart';
import 'package:i_attend/common/k_small_text.dart';

class KTextButton extends StatefulWidget {
  final void Function() onPressed;
  final String? taskTitle;
  // final void Function() bookFlip;

  KTextButton({
    super.key,
    this.taskTitle,
    required this.onPressed,
    // required this.bookFlip
  });

  @override
  State<KTextButton> createState() => _KTextButtonState();
}

class _KTextButtonState extends State<KTextButton> {
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation"),
        content: const Text('Have you completed your task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              widget.onPressed();
              Navigator.of(context).pop();
              // widget.bookFlip();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCompletionDialog,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KSmallText(
            text: "Mark as Done",
            textcolour: Colors.lightGreen,
          ),
          const Icon(
            Icons.check,
            color: Colors.lightGreen,
            size: 15,
          ),
        ],
      ),
    );
  }
}
