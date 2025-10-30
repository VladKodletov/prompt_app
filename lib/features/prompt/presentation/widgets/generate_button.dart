import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_bloc.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_state.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromptBloc, PromptState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: state.isValid
              ? () {
                  context.push('/result', extra: state.prompt);
                }
              : null,
          child: const Text('Generate'),
        );
      },
    );
  }
}
