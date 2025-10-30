import 'package:equatable/equatable.dart';

abstract class PromptEvent extends Equatable {
  const PromptEvent();

  @override
  List<Object> get props => [];
}

class PromptChanged extends PromptEvent {
  final String prompt;

  const PromptChanged(this.prompt);

  @override
  List<Object> get props => [prompt];
}

class PromptSubmitted extends PromptEvent {
  final String prompt;

  const PromptSubmitted(this.prompt);

  @override
  List<Object> get props => [prompt];
}
