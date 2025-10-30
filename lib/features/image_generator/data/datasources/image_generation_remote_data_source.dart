import 'package:prompt_app/features/image_generator/domain/entities/image_generation_entity.dart';

abstract class ImageGenerationRemoteDataSource {
  Future<ImageGenerationEntity> generate(String prompt);
}

class ImageGenerationRemoteDataSourceImpl
    implements ImageGenerationRemoteDataSource {
  @override
  Future<ImageGenerationEntity> generate(String prompt) async {
    // Delay imitation
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));

    // 50% error
    final random = DateTime.now().millisecond;
    if (random % 2 == 0) {
      throw Exception('Failed to generate image');
    }

    return ImageGenerationEntity(
      imageUrl:
          'https://picsum.photos/300/300?random=${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
