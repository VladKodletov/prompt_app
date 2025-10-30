part of 'image_generator_bloc.dart';

abstract class ImageGeneratorState extends Equatable {
  final String? savedPrompt; 

  const ImageGeneratorState({this.savedPrompt});

  @override
  List<Object> get props => [savedPrompt ?? ''];
}

class ImageGeneratorInitial extends ImageGeneratorState {
  const ImageGeneratorInitial({super.savedPrompt});
}

class ImageGeneratorLoading extends ImageGeneratorState {
  const ImageGeneratorLoading({super.savedPrompt});
}

class ImageGeneratorLoaded extends ImageGeneratorState {
  final String imageUrl;
  final String prompt;

  const ImageGeneratorLoaded({
    required this.imageUrl,
    required this.prompt,
    String? savedPrompt,
  }) : super(savedPrompt: savedPrompt ?? prompt); 

  @override
  List<Object> get props => [imageUrl, prompt, savedPrompt ?? ''];
}

class ImageGeneratorError extends ImageGeneratorState {
  final String message;
  final String prompt;

  const ImageGeneratorError({
    required this.message,
    required this.prompt,
    String? savedPrompt,
  }) : super(savedPrompt: savedPrompt ?? prompt);  

  @override
  List<Object> get props => [message, prompt, savedPrompt ?? ''];
}