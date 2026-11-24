import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/portfolio_project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({required this.project, super.key});
  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Hero(
            tag: project.title,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors.primaryContainer, colors.tertiaryContainer],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(projectIcon(project), size: 88, color: colors.primary),
            ),
          ),
          const SizedBox(height: 26),
          Text(project.title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text(project.description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Text('Technologies', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies.map((item) => Chip(label: Text(item))).toList(),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.verified_outlined),
              title: const Text('Project outcome'),
              subtitle: const Text(
                'Designed as a reusable, responsive Flutter experience with clear navigation and maintainable components.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
