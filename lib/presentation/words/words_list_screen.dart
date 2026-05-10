import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fun_english/core/theme.dart';
import 'package:fun_english/data/mock_data.dart';
import 'package:fun_english/data/providers/audio_provider.dart';
import 'package:fun_english/presentation/widgets/word_card.dart';

class WordsListScreen extends StatelessWidget {
  final String category;

  const WordsListScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = MockData.words.where((w) => w.category == category).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          category.toUpperCase(),
          style: const TextStyle(letterSpacing: 2, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: AppTheme.softGreen.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Explore ${category.toLowerCase()} words',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${words.length} items to learn',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryPurple,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: words.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('🔍', style: TextStyle(fontSize: 64)),
                        const SizedBox(height: 16),
                        Text(
                          'More words coming soon!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final wordItem = words[index];
                      return WordCard(
                        word: wordItem.word,
                        emoji: wordItem.emoji,
                        hint: wordItem.hint,
                        onListen: () {
                          context.read<AudioProvider>().speak(wordItem.word);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
