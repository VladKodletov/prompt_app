import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onNewPrompt;
  final VoidCallback onActionButton;
  final String actionButtonText;

  const ActionButtons({
    super.key,
    required this.onNewPrompt,
    required this.onActionButton,
    required this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onActionButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(actionButtonText),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: OutlinedButton(
              onPressed: onNewPrompt,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.deepPurple),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'New Prompt',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
