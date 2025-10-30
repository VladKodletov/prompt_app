import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/image_generator/domain/usecases/generate_image_usecase.dart';

part 'image_generator_event.dart';
part 'image_generator_state.dart';

class ImageGeneratorBloc extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  final GenerateImageUseCase generateImageUseCase;
  String? _currentPrompt;

  ImageGeneratorBloc({required this.generateImageUseCase}) 
      : super(const ImageGeneratorInitial()) {
    on<GenerateImageEvent>(_onGenerateImageEvent);
    on<ResetGeneratorEvent>(_onResetGeneratorEvent);
  }

  Future<void> _onGenerateImageEvent(
    GenerateImageEvent event,
    Emitter<ImageGeneratorState> emit,
  ) async {
    _currentPrompt = event.prompt;
    emit(ImageGeneratorLoading());
    
    try {
      final result = await generateImageUseCase(event.prompt);
      emit(ImageGeneratorLoaded(
        imageUrl: result.imageUrl,
        prompt: event.prompt,
      ));
    } catch (e) {
      emit(ImageGeneratorError(
        message: e.toString(),
        prompt: event.prompt,
      ));
    }
  }

  void _onResetGeneratorEvent(
    ResetGeneratorEvent event,
    Emitter<ImageGeneratorState> emit,
  ) {
    emit(ImageGeneratorInitial(savedPrompt: _currentPrompt));
  }
}