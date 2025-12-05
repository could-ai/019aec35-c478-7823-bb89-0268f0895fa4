class SearchResult {
  final String title;
  final String url;
  final String description;

  SearchResult({
    required this.title,
    required this.url,
    required this.description,
  });
}

// Mock data for demonstration
final List<SearchResult> mockResults = [
  SearchResult(
    title: 'Flutter - Build apps for any screen',
    url: 'https://flutter.dev',
    description: 'Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.',
  ),
  SearchResult(
    title: 'Dart programming language',
    url: 'https://dart.dev',
    description: 'Dart is a client-optimized language for fast apps on any platform.',
  ),
  SearchResult(
    title: 'Hari - Wikipedia',
    url: 'https://id.wikipedia.org/wiki/Hari',
    description: 'Hari adalah unit waktu. Dalam penggunaan sehari-hari, satu hari sama dengan 24 jam.',
  ),
  SearchResult(
    title: 'Search Engine Optimization (SEO) Starter Guide',
    url: 'https://developers.google.com/search/docs/fundamentals/seo-starter-guide',
    description: 'Who is this guide for? If you own, manage, monetize, or promote online content via Google Search, this guide is meant for you.',
  ),
  SearchResult(
    title: 'Weather Forecast',
    url: 'https://weather.com',
    description: 'Today\'s weather forecast, local weather, and radar.',
  ),
  SearchResult(
    title: 'Latest News - Hari Ini',
    url: 'https://news.example.com/hari-ini',
    description: 'Berita terkini dan terpercaya hari ini. Simak ulasan lengkapnya di sini.',
  ),
];
