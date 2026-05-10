import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';
import '../../core/theme.dart';
import '../../data/mock_data.dart';
import '../../data/models/models.dart';
import '../../data/providers/progress_provider.dart';
import '../../data/providers/ad_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<QuizQuestion> _questions;
  int _currentIndex = 0;
  bool _answered = false;
  String _selectedOption = '';
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _questions = MockData.generateQuizzes();
    _questions.shuffle();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    
    // Load interstitial ad
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isPremium = context.read<ProgressProvider>().isPremium;
      if (!isPremium) {
        context.read<AdProvider>().loadInterstitialAd();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _checkAnswer(String option) {
    if (_answered) return;
    
    setState(() {
      _answered = true;
      _selectedOption = option;
    });

    final isCorrect = option == _questions[_currentIndex].correctAnswer;
    if (isCorrect) {
      _confettiController.play();
      context.read<ProgressProvider>().addStars(1);
      context.read<ProgressProvider>().incrementQuizScore();
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (_currentIndex < _questions.length - 1) {
          setState(() {
            _currentIndex++;
            _answered = false;
            _selectedOption = '';
          });
        } else {
          _showCompletionDialog();
        }
      }
    });
  }

  void _showCompletionDialog() {
    final isPremium = context.read<ProgressProvider>().isPremium;
    if (!isPremium) {
      context.read<AdProvider>().showInterstitialAd();
    }
    context.read<ProgressProvider>().incrementQuizAttempts();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete! 🎉'),
        content: const Text('Great job! You earned some stars.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back from quiz screen
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final question = _questions[_currentIndex];
    final progress = (_currentIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quiz - ${_currentIndex + 1}/${_questions.length}'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Progress Bar
                Container(
                  height: 12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFCE93D8), Color(0xFFBA68C8)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Question Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: AppTheme.softGreen.withValues(alpha: 0.3), width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (question.emojiHint != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            question.emojiHint!,
                            style: const TextStyle(fontSize: 80),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1E1E3F),
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Options Grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.3,
                    children: question.options.map((option) {
                      bool isCorrect = _answered && option == question.correctAnswer;
                      bool isSelectedWrong = _answered && option == _selectedOption && option != question.correctAnswer;

                      return GestureDetector(
                        onTap: () => _checkAnswer(option),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            gradient: isCorrect 
                              ? const LinearGradient(colors: [Color(0xFF81C784), Color(0xFF4DB6AC)])
                              : isSelectedWrong
                                ? const LinearGradient(colors: [Color(0xFFEF5350), Color(0xFFE57373)])
                                : LinearGradient(colors: [Colors.grey.shade50, Colors.grey.shade100]),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: isCorrect 
                                ? Colors.green.shade700
                                : isSelectedWrong
                                  ? Colors.red.shade700
                                  : Colors.grey.shade200,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: (isCorrect ? Colors.green : isSelectedWrong ? Colors.red : Colors.grey).withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: (_answered && (isCorrect || isSelectedWrong)) 
                                ? Colors.white 
                                : const Color(0xFF1E1E3F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
