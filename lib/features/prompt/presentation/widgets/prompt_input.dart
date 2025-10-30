import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_bloc.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_event.dart';

class PromptInput extends StatelessWidget {
  const PromptInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<PromptBloc>().add(PromptChanged(value));
      },
      decoration: const InputDecoration(
        hintText: 'Describe what you want to see...',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    );
  }
}
