import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants.dart';
import '../../core/theme.dart';
import '../widgets/category_card.dart';

class WordsCategoriesScreen extends StatelessWidget {
  const WordsCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': AppConstants.categoryAnimals, 'emoji': '🦁', 'color': AppTheme.softGreen},
      {'name': AppConstants.categoryColors, 'emoji': '🎨', 'color': AppTheme.accentPink},
      {'name': AppConstants.categoryNumbers, 'emoji': '🔢', 'color': AppTheme.brightYellow},
      {'name': AppConstants.categoryFood, 'emoji': '🍎', 'color': AppTheme.primaryPurple},
      {'name': AppConstants.categoryBodyParts, 'emoji': '👂', 'color': Colors.orangeAccent},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final baseColor = cat['color'] as Color;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              height: 150,
              child: CategoryCard(
                title: cat['name'] as String,
                subtitle: 'Learn ${cat['name']}',
                gradient: LinearGradient(
                  colors: [
                    baseColor.withValues(alpha: 0.6),
                    baseColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                iconContent: Center(
                  child: Text(
                    cat['emoji'] as String,
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
                onTap: () {
                  context.push('/words_list/${cat['name']}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
