import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_bloc.dart';
import 'package:prompt_app/features/result/bloc/result_state.dart';
import 'package:prompt_app/features/result/presentation/widgets/error_view.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildContent(BuildContext context, ResultState state) {
    switch (state.status) {
      case ResultStatus.loading:
        return const CircularProgressIndicator();
      case ResultStatus.success:
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.network(
            state.imageUrl!,
            key: ValueKey(state.imageUrl),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
          ),
        );
      case ResultStatus.failure:
        return ErrorView(prompt: state.prompt);
      default:
        return const SizedBox.shrink();
    }
  }
}
