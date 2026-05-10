import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProgressProvider extends ChangeNotifier {
  int _stars = 0;
  int _quizScore = 0;
  int _quizAttempts = 0;
  bool _alphabetCompleted = false;
  bool _animalsCompleted = false;
  bool _colorsCompleted = false;
  bool _numbersCompleted = false;
  bool _foodCompleted = false;
  bool _bodyCompleted = false;
  String _name = "Little Learner";
  bool _isPremium = false;

  String? _userId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int get stars => _stars;
  int get quizScore => _quizScore;
  int get quizAttempts => _quizAttempts;
  int get totalQuizScore => _quizScore; // Added for compatibility with redesign
  bool get isPremium => _isPremium;

  ProgressProvider() {
    _initUser();
  }

  Future<void> _initUser() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('device_user_id');

    if (_userId == null) {
      _userId = const Uuid().v4();
      await prefs.setString('device_user_id', _userId!);
      await _createFirestoreUser();
    } else {
      await _loadFromFirestore();
    }
  }

  Future<void> _createFirestoreUser() async {
    final docRef = _firestore.collection('users').doc(_userId);
    await docRef.set({
      'Name': _name,
      'alphabet_completed': _alphabetCompleted,
      'animals_completed': _animalsCompleted,
      'body_completed': _bodyCompleted,
      'colors_completed': _colorsCompleted,
      'food_completed': _foodCompleted,
      'isPremium': _isPremium,
      'numbers_completed': _numbersCompleted,
      'quiz_attempts': _quizAttempts,
      'quiz_score': _quizScore,
      'stars': _stars,
    });
    notifyListeners();
  }

  Future<void> _loadFromFirestore() async {
    final doc = await _firestore.collection('users').doc(_userId).get();
    if (doc.exists) {
      final data = doc.data()!;
      _name = data['Name'] ?? _name;
      _alphabetCompleted = data['alphabet_completed'] ?? false;
      _animalsCompleted = data['animals_completed'] ?? false;
      _bodyCompleted = data['body_completed'] ?? false;
      _colorsCompleted = data['colors_completed'] ?? false;
      _foodCompleted = data['food_completed'] ?? false;
      _isPremium = data['isPremium'] ?? false;
      _numbersCompleted = data['numbers_completed'] ?? false;
      _quizAttempts = data['quiz_attempts'] ?? 0;
      _quizScore = data['quiz_score'] ?? 0;
      _stars = data['stars'] ?? 0;
      notifyListeners();
    } else {
      await _createFirestoreUser();
    }
  }

  Future<void> addStars(int count) async {
    _stars += count;
    notifyListeners();
    await _updateFirestore({'stars': _stars});
  }

  Future<void> incrementQuizScore() async {
    _quizScore += 1;
    notifyListeners();
    await _updateFirestore({'quiz_score': _quizScore});
  }
  
  Future<void> incrementQuizAttempts() async {
    _quizAttempts += 1;
    notifyListeners();
    await _updateFirestore({'quiz_attempts': _quizAttempts});
  }

  Future<void> _updateFirestore(Map<String, dynamic> data) async {
    if (_userId != null) {
      try {
        await _firestore.collection('users').doc(_userId).update(data);
      } catch (e) {
        if (kDebugMode) {
          print("Error updating Firestore: $e");
        }
      }
    }
  }
}
