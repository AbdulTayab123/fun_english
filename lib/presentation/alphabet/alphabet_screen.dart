import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/mock_data.dart';
import '../../data/providers/audio_provider.dart';
import '../widgets/animated_flip_card.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Learn the Alphabet'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: MockData.alphabet.length,
        itemBuilder: (context, index) {
          final item = MockData.alphabet[index];
          
          // Generate a gradient based on the index
          final gradients = [
            const [Color(0xFFCE93D8), Color(0xFFF48FB1)],
            const [Color(0xFF81C784), Color(0xFF4DB6AC)],
            const [Color(0xFFFFCA28), Color(0xFFFF9800)],
            const [Color(0xFF4FC3F7), Color(0xFF29B6F6)],
            const [Color(0xFFEF5350), Color(0xFFF06292)],
            const [Color(0xFF9575CD), Color(0xFF7E57C2)],
          ];
          final colors = gradients[index % gradients.length];

          return AnimatedFlipCard(
            onFlip: () {
              context.read<AudioProvider>().speak('${item.letter} for ${item.exampleWord}');
            },
            front: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: colors.last.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                item.letter,
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            back: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: colors.first.withValues(alpha: 0.2), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.emoji,
                    style: const TextStyle(fontSize: 56),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.exampleWord,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: colors.last,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
