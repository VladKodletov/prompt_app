import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prompt_app/features/image_generator/presentation/widgets/action_buttons.dart';

class GeneratorLoadedWidget extends StatelessWidget {
  final String imageUrl;
  final String prompt;
  final VoidCallback onNewPrompt;
  final VoidCallback onTryAgain;

  const GeneratorLoadedWidget({
    super.key,
    required this.imageUrl,
    required this.prompt,
    required this.onNewPrompt,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
        ),
        ActionButtons(
          onNewPrompt: onNewPrompt,
          onActionButton: onTryAgain,
          actionButtonText: 'Try Another',
        ),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}
