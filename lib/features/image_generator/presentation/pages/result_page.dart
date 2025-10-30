import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prompt_app/features/image_generator/presentation/bloc/image_generator_bloc.dart';
import 'package:prompt_app/features/image_generator/presentation/widgets/generator_error_widget.dart';
import 'package:prompt_app/features/image_generator/presentation/widgets/generator_loaded_widget.dart';
import 'package:prompt_app/features/image_generator/presentation/widgets/generator_loading_widget.dart';




class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Image'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
        builder: (context, state) => switch (state) {
          ImageGeneratorLoading() => const GeneratorLoadingWidget(),
          ImageGeneratorLoaded() => GeneratorLoadedWidget(
              imageUrl: state.imageUrl,
              prompt: state.prompt,
              onNewPrompt: () {
                context.read<ImageGeneratorBloc>().add(ResetGeneratorEvent());
                context.go('/');
              },
              onTryAgain: () => context
                  .read<ImageGeneratorBloc>()
                  .add(GenerateImageEvent(state.prompt)),
            ),
          ImageGeneratorError() => GeneratorErrorWidget(
              message: state.message,
              prompt: state.prompt,
              onNewPrompt: () {
                context.read<ImageGeneratorBloc>().add(ResetGeneratorEvent());
                context.go('/');
              },
              onRetry: () => context
                  .read<ImageGeneratorBloc>()
                  .add(GenerateImageEvent(state.prompt)),
            ),
          _ => const Center(child: Text('Something went wrong')),
        },
      ),
    );
  }
}
