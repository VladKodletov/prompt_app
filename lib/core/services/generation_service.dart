import 'dart:math';

class GenerationService {
  Future<String> generate(String prompt) async {
    // Simulate delay
    await Future.delayed(
      Duration(milliseconds: 2000 + Random().nextInt(1000)),
    );

    // 50% chance of failure
    if (Random().nextBool()) {
      throw Exception('Failed to generate image');
    }

    // Return placeholder image URL
    return 'https://picsum.photos/400/600';
  }
}
