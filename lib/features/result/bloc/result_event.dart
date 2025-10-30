import 'package:equatable/equatable.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class GenerateImage extends ResultEvent {
  final String prompt;

  const GenerateImage(this.prompt);

  @override
  List<Object> get props => [prompt];
}

class RetryGeneration extends ResultEvent {
  final String prompt;

  const RetryGeneration(this.prompt);

  @override
  List<Object> get props => [prompt];
}
