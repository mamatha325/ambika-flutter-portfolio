import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/skills_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  runApp(PortfolioApp(initialDarkMode: preferences.getBool('darkMode') ?? false));
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({required this.initialDarkMode, super.key});
  final bool initialDarkMode;

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late bool _darkMode = widget.initialDarkMode;

  Future<void> _toggleTheme() async {
    setState(() => _darkMode = !_darkMode);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('darkMode', _darkMode);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Ambika Portfolio',
        debugShowCheckedModeBanner: false,
        themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
        theme: _theme(Brightness.light),
        darkTheme: _theme(Brightness.dark),
        home: PortfolioShell(darkMode: _darkMode, onThemeToggle: _toggleTheme),
      );

  ThemeData _theme(Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      scaffoldBackgroundColor:
          brightness == Brightness.light ? const Color(0xFFF9F7FF) : const Color(0xFF111018),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colors.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -.8),
        headlineMedium: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -.5),
        titleLarge: TextStyle(fontWeight: FontWeight.w800),
        bodyLarge: TextStyle(height: 1.55),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({
    required this.darkMode,
    required this.onThemeToggle,
    super.key,
  });
  final bool darkMode;
  final VoidCallback onThemeToggle;

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      HomeScreen(onNavigate: (index) => setState(() => _index = index)),
      const AboutScreen(),
      const SkillsScreen(),
      const ProjectsScreen(),
      const ContactScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flutter_dash_rounded),
            SizedBox(width: 8),
            Text('AR Portfolio', style: TextStyle(fontWeight: FontWeight.w900)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: widget.darkMode ? 'Use light mode' : 'Use dark mode',
            onPressed: widget.onThemeToggle,
            icon: Icon(widget.darkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween(begin: const Offset(.02, .02), end: Offset.zero).animate(animation),
            child: child,
          ),
        ),
        child: KeyedSubtree(key: ValueKey(_index), child: screens[_index]),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.work_outline), selectedIcon: Icon(Icons.work), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.mail_outline), selectedIcon: Icon(Icons.mail), label: 'Contact'),
        ],
      ),
    );
  }
}


