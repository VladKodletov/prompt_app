part of 'image_generator_bloc.dart';

abstract class ImageGeneratorState extends Equatable {
  const ImageGeneratorState();

  @override
  List<Object> get props => [];
}

class ImageGeneratorInitial extends ImageGeneratorState {
  final String? savedPrompt;

  const ImageGeneratorInitial({this.savedPrompt});

  @override
  List<Object> get props => [savedPrompt ?? ''];
}

class ImageGeneratorLoading extends ImageGeneratorState {}

class ImageGeneratorLoaded extends ImageGeneratorState {
  final String imageUrl;
  final String prompt;

  const ImageGeneratorLoaded({required this.imageUrl, required this.prompt});

  @override
  List<Object> get props => [imageUrl, prompt];
}

class ImageGeneratorError extends ImageGeneratorState {
  final String message;
  final String prompt;

  const ImageGeneratorError({required this.message, required this.prompt});

  @override
  List<Object> get props => [message, prompt];
}