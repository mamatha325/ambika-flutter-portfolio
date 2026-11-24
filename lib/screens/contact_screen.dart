import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/section_header.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<void> _open(String value) async {
    final uri = Uri.parse(value);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication) && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open this link.')),
      );
    }
  }

  Future<void> _downloadResume() async {
    try {
      final ByteData data = await rootBundle.load('assets/docs/ananya_rao_resume.pdf');
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/Ananya_Rao_Resume.pdf');
      await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resume saved to ${file.path}')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resume could not be saved.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
        children: [
          const SectionHeader(
            eyebrow: 'Get in touch',
            title: 'Letâ€™s build something useful',
            description:
                'I am open to Flutter development opportunities, collaborations, and thoughtful product conversations.',
          ),
          const SizedBox(height: 24),
          _ContactTile(
            icon: Icons.email_outlined,
            title: 'Email',
            subtitle: 'ananya.rao.dev@example.com',
            onTap: () => _open('mailto:ananya.rao.dev@example.com'),
          ),
          _ContactTile(
            icon: Icons.phone_outlined,
            title: 'Phone',
            subtitle: '+91 90000 12345',
            onTap: () => _open('tel:+919000012345'),
          ),
          _ContactTile(
            icon: Icons.business_center_outlined,
            title: 'LinkedIn',
            subtitle: 'linkedin.com/in/ananya-rao-demo',
            onTap: () => _open('https://www.linkedin.com'),
          ),
          _ContactTile(
            icon: Icons.code_rounded,
            title: 'GitHub',
            subtitle: 'github.com/ananya-rao-demo',
            onTap: () => _open('https://github.com'),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: _downloadResume,
            icon: const Icon(Icons.download_rounded),
            label: const Text('Download Resume'),
          ),
          const SizedBox(height: 14),
          Text(
            'Demo profile information created for this educational portfolio project.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
          leading: CircleAvatar(child: Icon(icon)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.open_in_new_rounded, size: 20),
        ),
      );
}
