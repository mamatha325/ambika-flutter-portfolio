import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/info_card.dart';
import '../widgets/section_header.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
        children: [
          const SectionHeader(
            eyebrow: 'Capabilities',
            title: 'Skills & Tools',
            description:
                'A balanced toolkit for developing responsive, maintainable, and user-focused applications.',
          ),
          const SizedBox(height: 24),
          InfoCard(
            icon: Icons.code_rounded,
            title: 'Technical Skills',
            child: Column(
              children: demoSkills.entries
                  .map((skill) => _SkillBar(name: skill.key, value: skill.value))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          InfoCard(
            icon: Icons.build_outlined,
            title: 'Tools & Technologies',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: demoTools.map((tool) => Chip(label: Text(tool))).toList(),
            ),
          ),
          const SizedBox(height: 16),
          InfoCard(
            icon: Icons.groups_2_outlined,
            title: 'Soft Skills',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: demoSoftSkills
                  .map((skill) => Chip(
                        avatar: const Icon(Icons.check_rounded, size: 17),
                        label: Text(skill),
                      ))
                  .toList(),
            ),
          ),
        ],
      );
}

class _SkillBar extends StatelessWidget {
  const _SkillBar({required this.name, required this.value});
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600))),
                Text('${(value * 100).round()}%'),
              ],
            ),
            const SizedBox(height: 7),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 900),
              tween: Tween(begin: 0, end: value),
              builder: (context, progress, _) => LinearProgressIndicator(
                value: progress,
                minHeight: 9,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      );
}
