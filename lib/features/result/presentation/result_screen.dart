import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/core/services/generation_service.dart';
import 'package:prompt_app/features/result/bloc/result_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_event.dart';
import 'package:prompt_app/features/result/presentation/widgets/result_view.dart';

class ResultScreen extends StatelessWidget {
  final String prompt;

  const ResultScreen({
    super.key,
    required this.prompt,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultBloc(
        prompt: prompt,
        generationService: GenerationService(),
      )..add(GenerateImage(prompt)),
      child: const ResultView(),
    );
  }
}
