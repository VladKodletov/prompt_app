import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prompt_app/features/image_generator/presentation/bloc/image_generator_bloc.dart';


class PromptPage extends StatefulWidget {
  final String? initialPrompt;

  const PromptPage({super.key, this.initialPrompt});

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  final TextEditingController _promptController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isGenerateEnabled = false; 

  @override
  void initState() {
    super.initState();
    if (widget.initialPrompt != null) {
      _promptController.text = widget.initialPrompt!;
    }
       _restorePrompt();
       _promptController.addListener(_updateGenerateButton);
  }

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _restorePrompt();
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _generateImage() {
    if (_formKey.currentState!.validate()) {
      context.read<ImageGeneratorBloc>().add(
        GenerateImageEvent(_promptController.text.trim()),
      );
    }
  }
   void _restorePrompt() {
    final bloc = context.read<ImageGeneratorBloc>();
    final currentState = bloc.state;
    
    if (currentState.savedPrompt != null && currentState.savedPrompt!.isNotEmpty) {
      _promptController.text = currentState.savedPrompt!;
    }
    _updateGenerateButton(); 
  }
    void _updateGenerateButton() {
    setState(() {
      _isGenerateEnabled = _promptController.text.trim().isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageGeneratorBloc, ImageGeneratorState>(
      listener: (context, state) {
        if (state is ImageGeneratorLoaded || state is ImageGeneratorError) {
       context.go('/result');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.image_search,
                  size: 80,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 24),
                const Text(
                  'What would you like to see?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _promptController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Describe what you want to see...',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                      onPressed: (state is ImageGeneratorLoading || !_isGenerateEnabled) 
                            ? null 
                            : _generateImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: state is ImageGeneratorLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : const Text(
                                'Generate',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}