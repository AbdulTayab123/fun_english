import 'package:go_router/go_router.dart';
import '../presentation/main_screen.dart';
import '../presentation/alphabet/alphabet_screen.dart';
import '../presentation/words/words_categories_screen.dart';
import '../presentation/words/words_list_screen.dart';
import '../presentation/quiz/quiz_screen.dart';
import '../presentation/progress/progress_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/alphabet',
        builder: (context, state) => const AlphabetScreen(),
      ),
      GoRoute(
        path: '/words',
        builder: (context, state) => const WordsCategoriesScreen(),
      ),
      GoRoute(
        path: '/words_list/:category',
        builder: (context, state) {
          final category = state.pathParameters['category']!;
          return WordsListScreen(category: category);
        },
      ),
      GoRoute(
        path: '/quiz',
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: '/progress',
        builder: (context, state) => const ProgressScreen(),
      ),
    ],
  );
}
