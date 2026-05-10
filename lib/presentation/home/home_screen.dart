import 'package:fun_english/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../core/theme.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match the light background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                _buildHeader(context),
                const SizedBox(height: 40),
                _buildBanner(),
                const SizedBox(height: 32),
                _buildPlayButton(context),
                const SizedBox(height: 32),
                _buildCategoryGrid(context),
                const SizedBox(height: 24),
                _buildFunFactCard(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('📚', style: TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FunEnglish',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.accentPink, // Matching the pink color in screenshot
                  ),
                ),
                Text(
                  'LEARN & PLAY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.push('/progress'),
          child: const Text('🌟', style: TextStyle(fontSize: 32)),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Column(
      children: [
        const Text('🎉', style: TextStyle(fontSize: 72)),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1E1E3F),
              height: 1.2,
              fontFamily: 'Nunito', // Assuming Nunito is used as per theme
            ),
            children: [
              TextSpan(text: "Let's Learn\n"),
              TextSpan(
                text: "English!",
                style: TextStyle(color: Color(0xFFCE93D8)), // Light purple as seen
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Pick a topic and start having fun! 🚀',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/quiz'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF06292), Color(0xFFBA68C8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBA68C8).withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🎮', style: TextStyle(fontSize: 22)),
            SizedBox(width: 12),
            Text(
              'Play Quiz Game!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12),
            Text('🎮', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.85,
      children: [
        CategoryCard(
          title: 'Alphabet',
          subtitle: 'Learn A to Z',
          gradient: const LinearGradient(
            colors: [Color(0xFFCE93D8), Color(0xFFF48FB1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: -10,
                top: 10,
                child: Transform.rotate(
                  angle: math.pi / 12,
                  child: _buildSquareIcon(const Color(0xFF9C27B0).withValues(alpha: 0.3), 'abc', fontSize: 18),
                ),
              ),
              Positioned(
                left: 10,
                top: 30,
                child: _buildSquareIcon(const Color(0xFF0288D1), 'abc', textColor: Colors.white, border: true, fontSize: 18),
              ),
            ],
          ),
          onTap: () => context.push('/alphabet'),
        ),
        CategoryCard(
          title: 'Animals',
          subtitle: 'Meet cute animals',
          gradient: const LinearGradient(
            colors: [Color(0xFF81C784), Color(0xFF4DB6AC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: 0,
                top: -5,
                child: Transform.rotate(
                  angle: math.pi / 6,
                  child: Text('🐾', style: TextStyle(fontSize: 55, color: Colors.green.shade800.withValues(alpha: 0.3))),
                ),
              ),
              Positioned(
                left: 15,
                top: 25,
                child: const Text('🐾', style: TextStyle(fontSize: 45)),
              ),
            ],
          ),
          onTap: () => context.push('/words_list/${AppConstants.categoryAnimals}'),
        ),
        CategoryCard(
          title: 'Colors',
          subtitle: 'Discover colors',
          gradient: const LinearGradient(
            colors: [Color(0xFFFFCA28), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: -5,
                top: 5,
                child: Transform.rotate(
                  angle: -math.pi / 8,
                  child: Text('🎨', style: TextStyle(fontSize: 55, color: Colors.orange.shade800.withValues(alpha: 0.3))),
                ),
              ),
              Positioned(
                left: 10,
                top: 20,
                child: const Text('🎨', style: TextStyle(fontSize: 50)),
              ),
            ],
          ),
          onTap: () => context.push('/words_list/${AppConstants.categoryColors}'),
        ),
        CategoryCard(
          title: 'Numbers',
          subtitle: 'Count 1 to 10',
          gradient: const LinearGradient(
            colors: [Color(0xFF4FC3F7), Color(0xFF29B6F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: 0,
                top: 5,
                child: Transform.rotate(
                  angle: -math.pi / 12,
                  child: _buildSquareIcon(const Color(0xFF0288D1).withValues(alpha: 0.3), '1 2\n3 4', fontSize: 16),
                ),
              ),
              Positioned(
                left: 20,
                top: 25,
                child: _buildSquareIcon(const Color(0xFF0277BD), '1 2\n3 4', textColor: Colors.white, border: true, fontSize: 16),
              ),
            ],
          ),
          onTap: () => context.push('/words_list/${AppConstants.categoryNumbers}'),
        ),
        CategoryCard(
          title: 'Food',
          subtitle: 'Yummy words',
          gradient: const LinearGradient(
            colors: [Color(0xFFEF5350), Color(0xFFF06292)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Transform.rotate(
                  angle: math.pi / 6,
                  child: Text('🍕', style: TextStyle(fontSize: 55, color: Colors.red.shade900.withValues(alpha: 0.3))),
                ),
              ),
              Positioned(
                left: 15,
                top: 20,
                child: Transform.rotate(
                  angle: -math.pi / 12,
                  child: const Text('🍕', style: TextStyle(fontSize: 45)),
                ),
              ),
            ],
          ),
          onTap: () => context.push('/words_list/${AppConstants.categoryFood}'),
        ),
        CategoryCard(
          title: 'Body Parts',
          subtitle: 'Know your body',
          gradient: const LinearGradient(
            colors: [Color(0xFF9575CD), Color(0xFF7E57C2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          iconContent: Stack(
            children: [
              Positioned(
                right: 5,
                top: 5,
                child: Text('🖐️', style: TextStyle(fontSize: 55, color: Colors.deepPurple.shade900.withValues(alpha: 0.3))),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: const Text('🖐️', style: TextStyle(fontSize: 45)),
              ),
            ],
          ),
          onTap: () => context.push('/words_list/${AppConstants.categoryBodyParts}'),
        ),
      ],
    );
  }

  Widget _buildSquareIcon(Color bgColor, String text, {Color textColor = Colors.white, bool border = false, double fontSize = 14}) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: bgColor,
        border: border ? Border.all(color: Colors.black, width: 2) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildFunFactCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text('💡', style: TextStyle(fontSize: 40)),
          const SizedBox(height: 16),
          Text(
            'Fun Fact: The most common letter in English is "E"!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.deepPurple.shade700,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
