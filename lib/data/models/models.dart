class LetterItem {
  final String letter;
  final String exampleWord;
  final String imageUrl; // In a real app this would be a local asset or network URL
  final String emoji; // We'll use emojis for simplicity and fun!

  const LetterItem({
    required this.letter,
    required this.exampleWord,
    this.imageUrl = '',
    required this.emoji,
  });
}

class WordItem {
  final String word;
  final String category;
  final String hint;
  final String emoji;

  const WordItem({
    required this.word,
    required this.category,
    required this.hint,
    required this.emoji,
  });
}

class QuizQuestion {
  final String questionText;
  final String correctAnswer;
  final List<String> options;
  final String? emojiHint;

  const QuizQuestion({
    required this.questionText,
    required this.correctAnswer,
    required this.options,
    this.emojiHint,
  });
}
