class News {
  String name;
  String url;
  String description;
  String imageAsset;

  News({
    required this.name,
    required this.url,
    required this.description,
    required this.imageAsset,
  });
}

var newsList = [
  News(
    name: 'TechCrunch',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/login/asset1.png',
  ),
  News(
    name: 'TechCrunch',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/logo.png',
  ),
];
