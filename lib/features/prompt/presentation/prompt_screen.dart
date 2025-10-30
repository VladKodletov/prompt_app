import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_bloc.dart';
import 'package:prompt_app/features/prompt/presentation/widgets/prompt_view.dart';

class PromptScreen extends StatelessWidget {
  const PromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PromptBloc(),
      child: const PromptView(),
    );
  }
}
