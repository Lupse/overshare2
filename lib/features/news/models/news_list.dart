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
    url:
        'https://medium.com/@willitheowl/where-we-are-in-the-ai-revolution-fe448c4006da',
    description:
        '''ChatGPT was a wake-up call for society because everyone could experience what seemed like a big step on silicon’s long road from pocket calculators to taking over the world. Indeed, it is the culmination of decades of work on processing natural language with computers.''',
    imageAsset: 'assets/news/ai.png',
  ),
  News(
    id: '3',
    name: 'Biggest Cyber Security Challenges in 2024',
    url:
        'https://www.checkpoint.com/cyber-hub/cyber-security/what-is-cybersecurity/biggest-cyber-security-challenges-in-2024/',
    description:
        '''2023 saw a rapidly evolving cybersecurity threat landscape. Cyberattacks are on the rise, existing attacks are changing, and new, more sophisticated threats are on the horizon. Going into 2024, these trends are likely to continue or — more likely — accelerate. As artificial intelligence (AI) matures, it promises to significantly impact how both cyber attackers and defenders do their jobs.''',
    imageAsset: 'assets/news/cyber_security.png',
  ),
  News(
    id: '4',
    name:
        'Quantum Computing: A Game-Changer for the Information Technology Industry',
    url:
        'https://www.veridicsolutions.com/insights/quantum-computing-a-game-changer-for-the-information-technology-industry',
    description:
        '''In recent years, quantum computing has emerged as one of the most exciting and promising areas of research in the field of information technology. With the potential to revolutionize the way we approach computation, quantum computing represents a game-changing development that could have far-reaching implications for a wide range of industries.''',
    imageAsset: 'assets/news/quantum.png',
  ),
  News(
    id: '5',
    name: '16 DevOps Best Practices Every Developer Should Know',
    url: 'https://spacelift.io/blog/devops-best-practices',
    description:
        '''Utilizing DevOps practices to maximize speed and value creation has been a hot topic in the software industry for the past decade. We have embraced these practices and changed how we work and think about development, operations, project management, code quality, observability, and continuous feedback.''',
    imageAsset: 'assets/news/devops.png',
  ),
  // New entries
  News(
    id: '6',
    name:
        'Blockchain Beyond Cryptocurrency: Exploring Its Impact on Modern Business Operations',
    url: 'https://cioviews.com/blockchain-beyond-cryptocurrency/',
    description:
        '''Blockchain technology, often associated with cryptocurrencies, extends far beyond digital currencies. At its core, blockchain is a decentralized, immutable ledger that records transactions across multiple computers. This technology’s potential to transform various industries lies in its ability to provide transparency, security, and efficiency.''',
    imageAsset: 'assets/news/blockchain.png',
  ),
  News(
    id: '7',
    name:
        'Unleashing the Power: How 5G Technology is Revolutionizing Industries',
    url:
        'https://media.inti.asia/read/unleashing-the-power-how-5g-technology-is-revolutionizing-industries',
    description:
        '''INTI- In today's interconnected world, technology plays a pivotal role in shaping industries and driving innovation. One such technology that is transforming the landscape is 5G. With its lightning-fast speeds, ultra-low latency, and massive connectivity capabilities, 5G is poised to revolutionize various sectors, unlocking new opportunities and powering unprecedented advancements. From healthcare to manufacturing, transportation to entertainment, the impact of 5G technology is reshaping industries across the globe.''',
    imageAsset: 'assets/news/5g.png',
  ),
  News(
    id: '8',
    name: 'The Future of Work: Embracing Remote Work Technology',
    url:
        'https://customerthink.com/the-future-of-work-embracing-remote-work-technology/',
    description:
        '''The dynamic nature of work has been significantly shifted due to advancements in technology, with the trend towards remote work becoming increasingly prevalent. Even before the COVID-19 era, the rise of remote work was apparent, facilitated by advancing technology and the increasing demand for flexible work options.''',
    imageAsset: 'assets/news/future.png',
  ),
  News(
    id: '9',
    name: 'The Total Economic Impact™ (TEI) of OutSystems ',
    url:
        'https://www.outsystems.com/1/low-code-roi-tei/?utm_source=google&utm_medium=search-ads&utm_campaign=GOOGLE_SEARCH_NB_APAC_SEA&utm_term=low%20code%20value&utm_adid=low_code_roi&utm_campaignteam=digital-mktg&utm_partner=none&gad_source=1&gclid=CjwKCAjw3624BhBAEiwAkxgTOsK29zfn7vVfqhwd4luGvZ2F_1O6JrRBCiUaoKFlMCa0eVBjHD70VBoCVRcQAvD_BwE',
    description:
        '''As the demand for applications continues to grow, organizations are looking for ways to modernize how they augment their teams to deliver innovative digital solutions faster and with high quality. Many organizations are using low-code development platforms to transform and accelerate their software delivery strategies.''',
    imageAsset: 'assets/news/outsystem.png',
  ),
  News(
    id: '10',
    name:
        'Sustainability in Tech: How Green Practices are Shaping the Industry',
    url:
        'https://www.ironhack.com/gb/blog/sustainability-in-tech-how-green-practices-are-shaping-the-industry-in-2024',
    description:
        '''Without a doubt, one of the biggest trends in tech in 2024 is sustainability and it’s evident across practically every area; as the world places an increasingly large importance on tech in every aspect of their life, such as banking, healthcare, and how they interact with others, we’re faced with a question: are we making truly sustainable choices? ''',
    imageAsset: 'assets/news/ironhack.png',
  ),
];
