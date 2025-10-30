import 'package:flutter/material.dart';
import 'package:prompt_app/features/prompt/presentation/widgets/generate_button.dart';
import 'package:prompt_app/features/prompt/presentation/widgets/prompt_input.dart';

class PromptView extends StatelessWidget {
  const PromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PromptInput(),
            SizedBox(height: 24),
            GenerateButton(),
          ],
        ),
      ),
    );
  }
}
