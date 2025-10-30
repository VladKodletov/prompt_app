import 'package:flutter/material.dart';
import 'package:prompt_app/features/image_generator/presentation/widgets/action_buttons.dart';

class GeneratorErrorWidget extends StatelessWidget {
  final String message;
  final String prompt;
  final VoidCallback onNewPrompt;
  final VoidCallback onRetry;

  const GeneratorErrorWidget({
    super.key,
    required this.message,
    required this.prompt,
    required this.onNewPrompt,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final errorColor = Colors.red[400]!;

    return Column(
      children: [
        Expanded(
          flex: 15,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: errorColor),
                const SizedBox(height: 16),
                Text(
                  'Generation Failed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: errorColor,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        ActionButtons(
          onNewPrompt: onNewPrompt,
          onActionButton: onRetry,
          actionButtonText: 'Retry',
        ),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}
