import 'package:flutter/material.dart';
import 'package:task3/features/tasbeeh/presentation/widgets/tasbeeh_screen_body/tasbeeh_screen_body.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'السبحة الالكترونية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
        ),
      ),
      body: TasbeehScreenBody(),
    );
  }
}
