import 'package:flutter/material.dart';
import 'package:i_attend/common/k_small_text.dart';

class KTextButton extends StatefulWidget {
  final void Function() onPressed;

  const KTextButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<KTextButton> createState() => _KTextButtonState();
}

class _KTextButtonState extends State<KTextButton> {
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
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
