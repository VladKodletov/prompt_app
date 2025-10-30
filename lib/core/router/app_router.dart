import 'package:go_router/go_router.dart';
import 'package:prompt_app/features/prompt/presentation/prompt_screen.dart';
import 'package:prompt_app/features/result/presentation/result_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PromptScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final prompt = state.extra as String;
        return ResultScreen(prompt: prompt);
      },
    ),
  ],
);
