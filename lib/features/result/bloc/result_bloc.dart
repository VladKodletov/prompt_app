import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/core/services/generation_service.dart';
import 'package:prompt_app/features/result/bloc/result_event.dart';
import 'package:prompt_app/features/result/bloc/result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final GenerationService _generationService;

  ResultBloc({
    required String prompt,
    required GenerationService generationService,
  })  : _generationService = generationService,
        super(ResultState(prompt: prompt)) {
    on<GenerateImage>(_onGenerateImage);
    on<RetryGeneration>(_onRetryGeneration);
  }

  Future<void> _onGenerateImage(
    GenerateImage event,
    Emitter<ResultState> emit,
  ) async {
    emit(state.copyWith(status: ResultStatus.loading));
    try {
      final imageUrl = await _generationService.generate(event.prompt);
      emit(state.copyWith(
        status: ResultStatus.success,
        imageUrl: imageUrl,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ResultStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRetryGeneration(
    RetryGeneration event,
    Emitter<ResultState> emit,
  ) async {
    emit(state.copyWith(status: ResultStatus.loading));
    try {
      final imageUrl = await _generationService.generate(event.prompt);
      emit(state.copyWith(
        status: ResultStatus.success,
        imageUrl: imageUrl,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ResultStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
