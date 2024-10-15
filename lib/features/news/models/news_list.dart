class News {
  String id;
  String name;
  String url;
  String description;
  String imageAsset;
  String logoImageAsset;
  String author;
  String date;

  News({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.imageAsset,
    required this.logoImageAsset,
    required this.author,
    required this.date,
  });

//method factory untuk bikin object baru dari firebase yang di fetch
  factory News.fromFirestore(Map<String, dynamic> data, String documentId) {
    return News(
      id: documentId,
      name: data['name'] ?? 'Name not found!',
      url: data['url'] ?? 'Url not found!',
      description: data['description'] ?? 'Description not found!',
      imageAsset: data['imageAsset'] ?? 'Image not found!',
      logoImageAsset: data['logoImageAsset'] ?? 'Logo not found!',
      author: data['author'] ?? 'Author not found!',
      date: data['date'] ?? 'Date not found!',
    );
  }
}

//dummy data
var newsList = [
  News(
    id: '1',
    name: 'The Future of Cloud Computing 2025-2030: Trends and Predictions',
    url: 'https://www.clouddefense.ai/future-of-cloud-computing/',
    description:
        '''Almost every modern organization is shifting to digital infrastructure and opting for a cloud workspace due to its fast workflow, better business management, and impressive return. Cloud computing serves as the key driver behind the digital transformation in today’s businesses and helps businesses to operate with better scalability, operation, and collaboration. ''',
    imageAsset: 'assets/news/background/cloud_background.png',
    logoImageAsset:
        'assets/news/logo/cloud_computing.png', // Path to the logo image
    author: 'Abhishek Arora', // Author's name
    date: 'October 13, 2023', // Date as string
  ),
  News(
    id: '2',
    name: 'Where are we in the AI revolution? Robert Jack Will',
    url:
        'https://medium.com/@willitheowl/where-we-are-in-the-ai-revolution-fe448c4006da',
    description:
        '''ChatGPT was a wake-up call for society because everyone could experience what seemed like a big step on silicon’s long road from pocket calculators to taking over the world. An area that made slow, but steady progress for the first few decades (1950s to 1980s), and from then on started producing results that made it into usable products, including slowly improving text to speech, speech to text, and hand-writing recognition. ''',
    imageAsset: 'assets/news/background/ai_background.jpg',
    logoImageAsset: 'assets/news/logo/ai.png',
    author: 'Robert Jack Will',
    date: 'August 10, 2024',
  ),
  News(
    id: '3',
    name: 'Biggest Cyber Security Challenges in 2024',
    url:
        'https://www.checkpoint.com/cyber-hub/cyber-security/what-is-cybersecurity/biggest-cyber-security-challenges-in-2024/',
    description:
        '''2023 saw a rapidly evolving cybersecurity threat landscape. Cyberattacks are on the rise, existing attacks are changing, and new, more sophisticated threats are on the horizon. these trends are likely to continue or — more likely — accelerate. As artificial intelligence (AI) matures, it promises to significantly impact how both cyber attackers and defenders do their jobs.''',
    imageAsset: 'assets/news/background/cyber_security_background.jpg',
    logoImageAsset: 'assets/news/logo/cyber_security.png',
    author: 'Jane Smith',
    date: 'January 10, 2024',
  ),
  News(
    id: '4',
    name:
        'Quantum Computing: A Game-Changer for the Information Technology Industry',
    url:
        'https://www.veridicsolutions.com/insights/quantum-computing-a-game-changer-for-the-information-technology-industry',
    description:
        '''In recent years, quantum computing has emerged as one of the most exciting and promising areas of research in the field of information technology.''',
    imageAsset: 'assets/news/background/quantum_background.jpg',
    logoImageAsset: 'assets/news/logo/quantum.png',
    author: 'Alice Johnson',
    date: 'December 5, 2023',
  ),
  News(
    id: '5',
    name: '16 DevOps Best Practices Every Developer Should Know',
    url: 'https://spacelift.io/blog/devops-best-practices',
    description:
        '''Utilizing DevOps practices to maximize speed and value creation has been a hot topic in the software industry for the past decade.''',
    imageAsset: 'assets/news/background/devops_background.png',
    logoImageAsset: 'assets/news/logo/devops.png',
    author: 'Michael Green',
    date: 'November 15, 2023',
  ),
  News(
    id: '6',
    name:
        'Blockchain Beyond Cryptocurrency: Exploring Its Impact on Modern Business Operations',
    url: 'https://cioviews.com/blockchain-beyond-cryptocurrency/',
    description:
        '''Blockchain technology, often associated with cryptocurrencies, extends far beyond digital currencies.''',
    imageAsset: 'assets/news/background/blockchain_background.jpg',
    logoImageAsset: 'assets/news/logo/blockchain.png',
    author: 'Sarah Lee',
    date: 'May 8, 2024',
  ),
  News(
    id: '7',
    name:
        'Unleashing the Power: How 5G Technology is Revolutionizing Industries',
    url:
        'https://media.inti.asia/read/unleashing-the-power-how-5g-technology-is-revolutionizing-industries',
    description:
        '''5G is poised to revolutionize various sectors, unlocking new opportunities and powering unprecedented advancements.''',
    imageAsset: 'assets/news/background/5g_background.jpg',
    logoImageAsset: 'assets/news/logo/5g.png',
    author: 'Chris Williams',
    date: 'June 14, 2024',
  ),
  News(
    id: '8',
    name: 'The Future of Work: Embracing Remote Work Technology',
    url:
        'https://customerthink.com/the-future-of-work-embracing-remote-work-technology/',
    description:
        '''The dynamic nature of work has been significantly shifted due to advancements in technology.''',
    imageAsset: 'assets/news/background/future_background.jpg',
    logoImageAsset: 'assets/news/logo/future.png',
    author: 'David Zhang',
    date: 'July 1, 2024',
  ),
  News(
    id: '9',
    name: 'The Total Economic Impact™ (TEI) of OutSystems',
    url: 'https://www.outsystems.com/1/low-code-roi-tei/',
    description:
        '''Many organizations are using low-code development platforms to transform and accelerate their software delivery strategies.''',
    imageAsset: 'assets/news/background/outsystem_background.png',
    logoImageAsset: 'assets/news/logo/outsystem.png',
    author: 'Paul Baker',
    date: 'March 22, 2024',
  ),
  News(
    id: '10',
    name:
        'Sustainability in Tech: How Green Practices are Shaping the Industry',
    url:
        'https://www.ironhack.com/gb/blog/sustainability-in-tech-how-green-practices-are-shaping-the-industry-in-2024',
    description:
        '''Without a doubt, one of the biggest trends in tech in 2024 is sustainability.''',
    imageAsset: 'assets/news/background/ironhack_background.jpg',
    logoImageAsset: 'assets/news/logo/ironhack.png',
    author: 'Emma Watson',
    date: 'August 18, 2024',
  ),
];
