import 'package:equatable/equatable.dart';

enum ResultStatus { initial, loading, success, failure }

class ResultState extends Equatable {
  final ResultStatus status;
  final String? imageUrl;
  final String? error;
  final String prompt;

  const ResultState({
    this.status = ResultStatus.initial,
    this.imageUrl,
    this.error,
    required this.prompt,
  });

  ResultState copyWith({
    ResultStatus? status,
    String? imageUrl,
    String? error,
    String? prompt,
  }) {
    return ResultState(
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      error: error ?? this.error,
      prompt: prompt ?? this.prompt,
    );
  }

  @override
  List<Object?> get props => [status, imageUrl, error, prompt];
}
