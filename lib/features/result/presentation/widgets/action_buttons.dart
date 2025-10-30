import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_event.dart';

class ActionButtons extends StatelessWidget {
  final String prompt;

  const ActionButtons({
    super.key,
    required this.prompt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FilledButton(
        onPressed: () {
          context.read<ResultBloc>().add(GenerateImage(prompt));
        },
        child: const Text('Try another'),
      ),
    );
  }
}
