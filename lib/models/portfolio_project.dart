class PortfolioProject {
  const PortfolioProject({
    required this.title,
    required this.summary,
    required this.description,
    required this.technologies,
    required this.iconCodePoint,
  });

  final String title;
  final String summary;
  final String description;
  final List<String> technologies;
  final int iconCodePoint;
}
