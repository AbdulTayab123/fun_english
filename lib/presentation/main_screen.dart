import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../core/theme.dart';
import '../data/providers/ad_provider.dart';
import '../data/providers/progress_provider.dart';
import 'home/home_screen.dart';
import 'alphabet/alphabet_screen.dart';
import 'quiz/quiz_screen.dart';
import 'progress/progress_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    AlphabetScreen(),
    QuizScreen(),
    ProgressScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isPremium = context.read<ProgressProvider>().isPremium;
      if (!isPremium) {
        context.read<AdProvider>().loadBannerAd();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final adProvider = context.watch<AdProvider>();
    final isPremium = context.watch<ProgressProvider>().isPremium;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
          if (!isPremium && adProvider.isBannerAdLoaded && adProvider.bannerAd != null)
            Container(
              alignment: Alignment.center,
              width: adProvider.bannerAd!.size.width.toDouble(),
              height: adProvider.bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: adProvider.bannerAd!),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppTheme.primaryPurple,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'ABC',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports_rounded),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded),
              activeIcon: Icon(Icons.star_rounded),
              label: 'Stars',
            ),
          ],
        ),
      ),
    );
  }
}
