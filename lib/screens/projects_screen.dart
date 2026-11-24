import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/portfolio_project.dart';
import '../widgets/section_header.dart';
import 'project_detail_screen.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
        children: [
          const SectionHeader(
            eyebrow: 'Selected work',
            title: 'Projects',
            description:
                'Projects that demonstrate responsive layouts, reusable components, navigation, and practical state management.',
          ),
          const SizedBox(height: 24),
          ...demoProjects.map((project) => _ProjectCard(project: project)),
        ],
      );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (_, animation, __) => ProjectDetailScreen(project: project),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(begin: const Offset(.04, .04), end: Offset.zero)
                    .animate(animation),
                child: child,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: project.title,
                child: Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colors.primaryContainer, colors.tertiaryContainer],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(projectIcon(project), color: colors.primary, size: 36),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(project.summary),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies
                          .take(3)
                          .map((item) => Chip(
                                visualDensity: VisualDensity.compact,
                                label: Text(item),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 17),
            ],
          ),
        ),
      ),
    );
  }
}
