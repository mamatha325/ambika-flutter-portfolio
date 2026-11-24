import 'package:flutter/material.dart';

import '../widgets/info_card.dart';
import '../widgets/section_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
        children: [
          const SectionHeader(
            eyebrow: 'My story',
            title: 'About Me',
            description:
                'A curious developer who enjoys turning real problems into simple, useful mobile experiences.',
          ),
          const SizedBox(height: 24),
          _grid(context, const [
            InfoCard(
              icon: Icons.person_outline_rounded,
              title: 'Background',
              child: Text(
                'I am a Bengaluru-based Flutter developer with a strong interest in product design. I enjoy working across the full journey from an early idea to a polished mobile interface.',
              ),
            ),
            InfoCard(
              icon: Icons.school_outlined,
              title: 'Education',
              child: Text(
                'B.Tech in Computer Science and Engineering\nRiverdale Institute of Technology\n2021 - 2025',
              ),
            ),
            InfoCard(
              icon: Icons.rocket_launch_outlined,
              title: 'Career Objective',
              child: Text(
                'To contribute to a collaborative product team where I can build reliable Flutter applications, deepen my engineering skills, and create meaningful experiences for users.',
              ),
            ),
            InfoCard(
              icon: Icons.favorite_outline_rounded,
              title: 'Interests & Hobbies',
              child: Text(
                'Interface design, open-source learning, photography, sketching, travel, and reading about emerging technology.',
              ),
            ),
          ]),
        ],
      );

  Widget _grid(BuildContext context, List<Widget> children) => LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 700 ? 2 : 1;
          return GridView.count(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: columns == 1 ? 1.55 : 1.25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: children,
          );
        },
      );
}
