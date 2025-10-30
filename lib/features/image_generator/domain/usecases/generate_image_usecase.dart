

import 'package:prompt_app/features/image_generator/domain/entities/image_generation_entity.dart';
import 'package:prompt_app/features/image_generator/domain/repositories/image_generation_repository.dart';

class GenerateImageUseCase implements UseCase<ImageGenerationEntity, String> {
  final ImageGenerationRepository repository;

  GenerateImageUseCase(this.repository);

  @override
  Future<ImageGenerationEntity> call(String prompt) async {
    return await repository.generate(prompt);
  }
}