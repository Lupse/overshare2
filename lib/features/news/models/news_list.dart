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

//method factory untuk bikin object baru dari firebase yang di fetch
  factory News.fromFirestore(Map<String, dynamic> data, String documentId) {
    return News(
        id: documentId,
        name: data['name'] ?? 'Name not found!',
        url: data['url'] ?? 'Url not found!',
        description: data['description'] ?? 'Description not found!',
        imageAsset: data['imageAsset'] ?? 'Image not found!');
  }
}

//dummy data
var newsList = [
  News(
    id: '1',
    name: 'The Future of Cloud Computing 2025-2030: Trends and Predictions',
    url: 'https://www.clouddefense.ai/future-of-cloud-computing/',
    description:
        '''Almost every modern organization is shifting to digital infrastructure and opting for a cloud workspace due to its fast workflow, better business management, and impressive return.
          Cloud computing serves as the key driver behind the digital transformation in today’s businesses and helps businesses to operate with better scalability, operation, and collaboration. 
          With the increase in digitization in business operations and heavy reliance on data analysis, are you speculating what the future holds? ''',
    imageAsset: 'assets/news/cloud_computing.png',
  ),
  News(
    id: '2',
    name: 'Where are we in the AI revolution? Robert Jack Will',
    url: 'https://medium.com/@willitheowl/where-we-are-in-the-ai-revolution-fe448c4006da',
    description:
        '''ChatGPT was a wake-up call for society because everyone could experience what seemed like a big step on silicon’s long road from pocket calculators to taking over the world. Indeed, it is the culmination of decades of work on processing natural language with computers.''',
    imageAsset: 'assets/ai_revolution.png',
  ),
  News(
    id: '3',
    name: 'Cybersecurity in 2024: Top Challenges',
    url: 'https://example.com/cybersecurity-2024',
    description:
        'This article delves into the biggest cybersecurity challenges facing businesses in 2024.',
    imageAsset: 'assets/cybersecurity.png',
  ),
  News(
    id: '4',
    name: 'Quantum Computing: A Game Changer for IT',
    url: 'https://example.com/quantum-computing-it',
    description: 'Quantum computing promises to revolutionize the IT industry.',
    imageAsset: 'assets/quantum_computing.png',
  ),
  News(
    id: '5',
    name: 'DevOps Best Practices for 2024',
    url: 'https://example.com/devops-best-practices-2024',
    description:
        'This article outlines the best DevOps practices for 2024, focusing on CI/CD and automation.',
    imageAsset: 'assets/devops_best_practices.png',
  ),
  // New entries
  News(
    id: '6',
    name: 'Blockchain Beyond Cryptocurrency: The IT Impact',
    url: 'https://example.com/blockchain-it-impact',
    description:
        'This article explores the ways in which blockchain is improving security and transparency.',
    imageAsset: 'assets/blockchain.png',
  ),
  News(
    id: '7',
    name: 'The Role of 5G in Revolutionizing IT Infrastructure',
    url: 'https://example.com/5g-it-infrastructure',
    description:
        '5G technology is set to revolutionize IT infrastructure by enabling faster data transmission.',
    imageAsset: 'assets/5g.png',
  ),
  News(
    id: '8',
    name: 'Remote Work Technology: Adapting IT for the Future',
    url: 'https://example.com/remote-work-it',
    description:
        'IT teams are adapting to provide secure and scalable solutions for remote work environments.',
    imageAsset: 'assets/remote_work.png',
  ),
  News(
    id: '9',
    name: 'The Rise of Low-Code Platforms in IT Development',
    url: 'https://example.com/low-code-it-development',
    description:
        'Low-code platforms are allowing non-developers to create apps and automate workflows.',
    imageAsset: 'assets/low_code.png',
  ),
  News(
    id: '10',
    name: 'Sustainability in IT: How Green Tech is Shaping the Future',
    url: 'https://example.com/green-tech-it',
    description:
        'Green technology is becoming a critical component of modern IT strategies to reduce carbon footprint.',
    imageAsset: 'assets/green_tech.png',
  ),
];
