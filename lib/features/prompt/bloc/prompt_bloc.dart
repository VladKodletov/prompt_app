import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_event.dart';
import 'package:prompt_app/features/prompt/bloc/prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(const PromptState()) {
    on<PromptChanged>(_onPromptChanged);
  }

  void _onPromptChanged(
    PromptChanged event,
    Emitter<PromptState> emit,
  ) {
    emit(
      state.copyWith(
        prompt: event.prompt,
        isValid: event.prompt.trim().isNotEmpty,
      ),
    );
  }
}
