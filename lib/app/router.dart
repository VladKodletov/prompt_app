import 'package:go_router/go_router.dart';
import '../features/image_generator/presentation/pages/prompt_page.dart';
import '../features/image_generator/presentation/pages/result_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const PromptPage(),
    ),
    GoRoute(
      path: '/result',
      name: 'result',
      builder: (context, state) => const ResultPage(),
    ),
  ],
);