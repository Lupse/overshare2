class News {
  String id;
  String name;
  String url;
  String description;
  String imageAsset;

  News({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.imageAsset,
  });
}

var newsList = [
  News(
    name: 'TechCrunch1',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/login/asset1.png',
    id: '1',
  ),
  News(
    name: 'TechCrunch2',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/logo.png',
    id: '2',
  ),
  News(
    name: 'TechCrunch3',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/login/asset1.png',
    id: '3',
  ),
  News(
    name: 'TechCrunch4',
    url: 'https://techcrunch.com',
    description:
        'TechCrunch delivers the latest news on startups, gadgets, and technology trends.',
    imageAsset: 'assets/logo.png',
    id: '4',
  ),
];
