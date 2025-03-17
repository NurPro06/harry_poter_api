import 'package:flutter/material.dart';
import 'package:harry_poter_api/model.dart';

class DetailsScreen extends StatelessWidget {
  final Model character;

  const DetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (character.image.isNotEmpty)
              Center(
                child: Image.network(
                  character.image,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              'Full Name: ${character.fullName}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Hogwarts House: ${character.hogwartsHouse}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}