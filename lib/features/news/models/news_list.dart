class NewsList {
  final String name;
  final String url;
  final String description;
  final String imageAsset;

  NewsList({
    required this.name,
    required this.url,
    required this.description,
    required this.imageAsset,
  });
}

var newsList = [
  NewsList(
    name: 'TechCrunch',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/login/asset1.png',
  ),
  NewsList(
    name: 'TechCrunch',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/logo.png',
  ),
];
