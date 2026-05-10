import '../core/constants.dart';
import 'models/models.dart';

class MockData {
  static const List<LetterItem> alphabet = [
    LetterItem(letter: 'A', exampleWord: 'Apple', emoji: '🍎'),
    LetterItem(letter: 'B', exampleWord: 'Bear', emoji: '🐻'),
    LetterItem(letter: 'C', exampleWord: 'Cat', emoji: '🐱'),
    LetterItem(letter: 'D', exampleWord: 'Dog', emoji: '🐶'),
    LetterItem(letter: 'E', exampleWord: 'Elephant', emoji: '🐘'),
    LetterItem(letter: 'F', exampleWord: 'Frog', emoji: '🐸'),
    LetterItem(letter: 'G', exampleWord: 'Giraffe', emoji: '🦒'),
    LetterItem(letter: 'H', exampleWord: 'Horse', emoji: '🐴'),
    LetterItem(letter: 'I', exampleWord: 'Ice Cream', emoji: '🍦'),
    LetterItem(letter: 'J', exampleWord: 'Juice', emoji: '🧃'),
    LetterItem(letter: 'K', exampleWord: 'Kite', emoji: '🪁'),
    LetterItem(letter: 'L', exampleWord: 'Lion', emoji: '🦁'),
    LetterItem(letter: 'M', exampleWord: 'Monkey', emoji: '🐒'),
    LetterItem(letter: 'N', exampleWord: 'Nest', emoji: '🪹'),
    LetterItem(letter: 'O', exampleWord: 'Owl', emoji: '🦉'),
    LetterItem(letter: 'P', exampleWord: 'Pig', emoji: '🐷'),
    LetterItem(letter: 'Q', exampleWord: 'Queen', emoji: '👸'),
    LetterItem(letter: 'R', exampleWord: 'Rabbit', emoji: '🐰'),
    LetterItem(letter: 'S', exampleWord: 'Sun', emoji: '☀️'),
    LetterItem(letter: 'T', exampleWord: 'Tiger', emoji: '🐯'),
    LetterItem(letter: 'U', exampleWord: 'Umbrella', emoji: '☂️'),
    LetterItem(letter: 'V', exampleWord: 'Violin', emoji: '🎻'),
    LetterItem(letter: 'W', exampleWord: 'Watermelon', emoji: '🍉'),
    LetterItem(letter: 'X', exampleWord: 'Xylophone', emoji: '🎹'), // Close enough emoji
    LetterItem(letter: 'Y', exampleWord: 'Yak', emoji: '🐃'),
    LetterItem(letter: 'Z', exampleWord: 'Zebra', emoji: '🦓'),
  ];

  static const List<WordItem> words = [
    // Animals
    WordItem(word: 'Dog', category: AppConstants.categoryAnimals, hint: 'Barks and wags its tail', emoji: '🐶'),
    WordItem(word: 'Cat', category: AppConstants.categoryAnimals, hint: 'Meows and purrs', emoji: '🐱'),
    WordItem(word: 'Elephant', category: AppConstants.categoryAnimals, hint: 'Has a long trunk', emoji: '🐘'),
    WordItem(word: 'Lion', category: AppConstants.categoryAnimals, hint: 'King of the jungle', emoji: '🦁'),
    WordItem(word: 'Monkey', category: AppConstants.categoryAnimals, hint: 'Loves climbing trees', emoji: '🐒'),
    WordItem(word: 'Rabbit', category: AppConstants.categoryAnimals, hint: 'Has long ears and hops', emoji: '🐰'),
    WordItem(word: 'Tiger', category: AppConstants.categoryAnimals, hint: 'Large orange cat with stripes', emoji: '🐯'),
    WordItem(word: 'Zebra', category: AppConstants.categoryAnimals, hint: 'Has black and white stripes', emoji: '🦓'),
    
    // Colors
    WordItem(word: 'Red', category: AppConstants.categoryColors, hint: 'Color of an apple', emoji: '🍎'),
    WordItem(word: 'Blue', category: AppConstants.categoryColors, hint: 'Color of the sky', emoji: '🌌'),
    WordItem(word: 'Green', category: AppConstants.categoryColors, hint: 'Color of grass', emoji: '🌿'),
    WordItem(word: 'Yellow', category: AppConstants.categoryColors, hint: 'Color of the sun', emoji: '☀️'),
    WordItem(word: 'Purple', category: AppConstants.categoryColors, hint: 'Color of grapes', emoji: '🍇'),
    WordItem(word: 'Orange', category: AppConstants.categoryColors, hint: 'Color of an orange', emoji: '🍊'),
    WordItem(word: 'Pink', category: AppConstants.categoryColors, hint: 'Color of a flamingo', emoji: '🦩'),

    // Numbers
    WordItem(word: 'One', category: AppConstants.categoryNumbers, hint: 'First number', emoji: '1️⃣'),
    WordItem(word: 'Two', category: AppConstants.categoryNumbers, hint: 'One plus one', emoji: '2️⃣'),
    WordItem(word: 'Three', category: AppConstants.categoryNumbers, hint: 'Follows two', emoji: '3️⃣'),
    WordItem(word: 'Four', category: AppConstants.categoryNumbers, hint: 'Two plus two', emoji: '4️⃣'),
    WordItem(word: 'Five', category: AppConstants.categoryNumbers, hint: 'Fingers on one hand', emoji: '5️⃣'),
    WordItem(word: 'Ten', category: AppConstants.categoryNumbers, hint: 'All fingers', emoji: '🔟'),

    // Food
    WordItem(word: 'Apple', category: AppConstants.categoryFood, hint: 'Keeps the doctor away', emoji: '🍎'),
    WordItem(word: 'Banana', category: AppConstants.categoryFood, hint: 'Monkeys love this', emoji: '🍌'),
    WordItem(word: 'Pizza', category: AppConstants.categoryFood, hint: 'Round with cheese and toppings', emoji: '🍕'),
    WordItem(word: 'Burger', category: AppConstants.categoryFood, hint: 'Meat in a bun', emoji: '🍔'),
    WordItem(word: 'Egg', category: AppConstants.categoryFood, hint: 'Comes from a chicken', emoji: '🥚'),
    WordItem(word: 'Milk', category: AppConstants.categoryFood, hint: 'White drink for strong bones', emoji: '🥛'),

    // Body Parts
    WordItem(word: 'Eye', category: AppConstants.categoryBodyParts, hint: 'You use it to see', emoji: '👁️'),
    WordItem(word: 'Ear', category: AppConstants.categoryBodyParts, hint: 'You use it to hear', emoji: '👂'),
    WordItem(word: 'Hand', category: AppConstants.categoryBodyParts, hint: 'Has five fingers', emoji: '🖐️'),
    WordItem(word: 'Nose', category: AppConstants.categoryBodyParts, hint: 'You use it to smell', emoji: '👃'),
    WordItem(word: 'Mouth', category: AppConstants.categoryBodyParts, hint: 'You use it to eat and talk', emoji: '👄'),
    WordItem(word: 'Foot', category: AppConstants.categoryBodyParts, hint: 'You use it to walk', emoji: '🦶'),
  ];

  static List<QuizQuestion> generateQuizzes() {
    return [
      const QuizQuestion(
        questionText: 'Which animal says "Meow"?',
        correctAnswer: 'Cat',
        options: ['Dog', 'Cat', 'Elephant', 'Lion'],
        emojiHint: '🐱',
      ),
      const QuizQuestion(
        questionText: 'What color is the sky?',
        correctAnswer: 'Blue',
        options: ['Red', 'Green', 'Blue', 'Yellow'],
        emojiHint: '🌌',
      ),
      const QuizQuestion(
        questionText: 'Which food do monkeys love?',
        correctAnswer: 'Banana',
        options: ['Apple', 'Pizza', 'Banana', 'Carrot'],
        emojiHint: '🍌',
      ),
      const QuizQuestion(
        questionText: 'What letter comes after A?',
        correctAnswer: 'B',
        options: ['C', 'Z', 'B', 'D'],
        emojiHint: '🅱️',
      ),
    ];
  }
}
