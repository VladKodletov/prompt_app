import 'package:prompt_app/features/image_generator/data/datasources/image_generation_remote_data_source.dart';
import 'package:prompt_app/features/image_generator/domain/entities/image_generation_entity.dart';
import 'package:prompt_app/features/image_generator/domain/repositories/image_generation_repository.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final ImageGenerationRemoteDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageGenerationEntity> generate(String prompt) async {
    try {
      return await remoteDataSource.generate(prompt);
    } catch (e) {
      rethrow;
    }
  }
}
