import 'package:flutter/material.dart';

class GeneratorLoadingWidget extends StatelessWidget {
  const GeneratorLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.deepPurple),
          SizedBox(height: 16),
          Text(
            'Generating your image...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
