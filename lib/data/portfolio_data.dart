import 'package:flutter/material.dart';

import '../models/portfolio_project.dart';

const demoSkills = <String, double>{
  'Flutter & Dart': .90,
  'Responsive UI': .88,
  'Firebase': .76,
  'Git & GitHub': .84,
  'REST APIs': .78,
};

const demoTools = <String>[
  'Flutter',
  'Dart',
  'Firebase',
  'Git',
  'Figma',
  'VS Code',
  'Android Studio',
];

const demoSoftSkills = <String>[
  'Communication',
  'Problem solving',
  'Team collaboration',
  'Adaptability',
  'Time management',
];

const demoProjects = <PortfolioProject>[
  PortfolioProject(
    title: 'EasyBuy',
    summary: 'A responsive shopping experience with cart and wishlist flows.',
    description:
        'EasyBuy presents searchable products, category filters, detailed product pages, persistent cart and wishlist data, reviews, and a guided checkout interface.',
    technologies: ['Flutter', 'Dart', 'Local Storage', 'Material 3'],
    iconCodePoint: 0xe59c,
  ),
  PortfolioProject(
    title: 'Smart Quiz',
    summary: 'A timed category-based quiz with scores and high-score tracking.',
    description:
        'Smart Quiz provides randomized Flutter and Dart questions, a timer for every question, instant score calculation, persistent high scores, and restart support.',
    technologies: ['Flutter', 'Dart', 'SharedPreferences'],
    iconCodePoint: 0xe6c4,
  ),
  PortfolioProject(
    title: 'TaskFlow',
    summary: 'A focused productivity app for planning and tracking daily work.',
    description:
        'TaskFlow organizes tasks by priority and status. Its clean dashboard, progress summaries, filtering, and local persistence help users stay focused.',
    technologies: ['Flutter', 'Dart', 'Responsive UI', 'Animations'],
    iconCodePoint: 0xe6f1,
  ),
];

IconData projectIcon(PortfolioProject project) => switch (project.title) {
      'EasyBuy' => Icons.shopping_bag_outlined,
      'Smart Quiz' => Icons.quiz_outlined,
      'TaskFlow' => Icons.checklist_rounded,
      _ => Icons.work_outline,
    };

