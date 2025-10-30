import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/router.dart';
import 'features/image_generator/data/datasources/image_generation_remote_data_source.dart';
import 'features/image_generator/data/repositories/image_generation_repository_impl.dart';
import 'features/image_generator/domain/usecases/generate_image_usecase.dart';
import 'features/image_generator/presentation/bloc/image_generator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageGeneratorBloc>(
          create: (context) => ImageGeneratorBloc(
            generateImageUseCase: GenerateImageUseCase(
              ImageGenerationRepositoryImpl(
                remoteDataSource: ImageGenerationRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Image Generator',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
