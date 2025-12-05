import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/search_result.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late TextEditingController _searchController;
  String _query = '';
  List<SearchResult> _results = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      _query = args;
      _searchController = TextEditingController(text: _query);
      _performSearch(_query);
    } else {
      _searchController = TextEditingController();
    }
  }

  void _performSearch(String query) {
    // Simple mock search logic
    setState(() {
      _query = query;
      if (query.isEmpty) {
        _results = [];
      } else {
        // Filter mock results loosely based on query
        _results = mockResults.where((result) {
          final q = query.toLowerCase();
          return result.title.toLowerCase().contains(q) ||
                 result.description.toLowerCase().contains(q) ||
                 result.url.toLowerCase().contains(q);
        }).toList();
        
        // If no matches, just show all for demo purposes if the query is "demo" or similar
        // otherwise show empty state
        if (_results.isEmpty && query.toLowerCase() == 'demo') {
          _results = mockResults;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                onPressed: () {
                  _searchController.clear();
                  _performSearch('');
                },
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10), // Center text vertically
              isDense: true,
            ),
            onSubmitted: _performSearch,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
          ),
        ),
      ),
      body: _results.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text(
                    'No results found for "$_query"',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Try searching for "Flutter", "Hari", or "News"',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final result = _results[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // URL / Breadcrumb
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.public, size: 12, color: Colors.grey),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              result.url,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      
                      // Title
                      InkWell(
                        onTap: () {
                          // In a real app, this would open the URL
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opening ${result.url}')),
                          );
                        },
                        child: Text(
                          result.title,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.transparent, // Hide underline unless hovered (web) - simplified here
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      // Description
                      Text(
                        result.description,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
