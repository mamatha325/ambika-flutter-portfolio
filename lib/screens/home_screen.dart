import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.onNavigate, super.key});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 32, 22, 120),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [colors.primary, colors.tertiary],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 74,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'AVAILABLE FOR OPPORTUNITIES',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.onPrimaryContainer,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .7,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Ambika',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(height: 6),
                Text(
                  'Flutter Developer & UI Designer',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'I build thoughtful mobile experiences that combine clean code, accessible interfaces, and delightful interactions.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 28),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: () => onNavigate(3),
                      icon: const Icon(Icons.work_outline_rounded),
                      label: const Text('View Projects'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => onNavigate(4),
                      icon: const Icon(Icons.chat_bubble_outline_rounded),
                      label: const Text('Contact Me'),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                Row(
                  children: [
                    _Stat(value: '3+', label: 'Projects', color: colors.primary),
                    _Stat(value: '7', label: 'Core tools', color: colors.tertiary),
                    _Stat(value: '100%', label: 'Curiosity', color: colors.secondary),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label, required this.color});
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      );
}

