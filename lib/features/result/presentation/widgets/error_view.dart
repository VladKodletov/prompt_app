import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_event.dart';

class ErrorView extends StatelessWidget {
  final String prompt;

  const ErrorView({
    super.key,
    required this.prompt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          size: 48,
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        Text(
          'Generation failed',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () {
            context.read<ResultBloc>().add(RetryGeneration(prompt));
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
