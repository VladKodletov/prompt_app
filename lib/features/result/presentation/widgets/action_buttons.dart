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
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.read<ResultBloc>().add(GenerateImage(prompt));
            },
            child: const Text('Try another'),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: BackButton(),
        ),
      ],
    );
  }
}
