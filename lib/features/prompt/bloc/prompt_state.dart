import 'package:equatable/equatable.dart';

class PromptState extends Equatable {
  final String prompt;
  final bool isValid;

  const PromptState({
    this.prompt = '',
    this.isValid = false,
  });

  PromptState copyWith({
    String? prompt,
    bool? isValid,
  }) {
    return PromptState(
      prompt: prompt ?? this.prompt,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [prompt, isValid];
}
