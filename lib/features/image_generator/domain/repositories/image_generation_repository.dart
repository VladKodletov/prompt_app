import 'package:prompt_app/features/image_generator/domain/entities/image_generation_entity.dart';

abstract class ImageGenerationRepository {
  Future<ImageGenerationEntity> generate(String prompt);
}