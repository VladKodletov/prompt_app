import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prompt_app/features/result/bloc/result_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_state.dart';
import 'package:prompt_app/features/result/presentation/widgets/action_buttons.dart';
import 'package:prompt_app/features/result/presentation/widgets/result_content.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Image'),
        leading: BackButton(
          onPressed: () => context.go('/'),
        ),
      ),
      body: BlocBuilder<ResultBloc, ResultState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                const Expanded(
                  flex: 15,
                  child: Center(
                    child: ResultContent(),
                  ),
                ),
                if (state.status == ResultStatus.success) ...[
                  const SizedBox(height: 16),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  ActionButtons(prompt: state.prompt),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
