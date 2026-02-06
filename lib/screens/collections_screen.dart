import 'package:flutter/material.dart';
import '../models/const.dart';
import '../widgets/collection_card.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int expandedIndex = -1;

  // Toggle which collection card is expanded.
  void toggleExpand(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Main screen scaffold with a list of collections.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: Colors.white,
      ),
      // List of collection cards with expand/collapse behavior.
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return CollectionCard(
            collection: collections[index],
            isExpanded: expandedIndex == index,
            onTap: () => toggleExpand(index),
          );
        },
      ),
    );
  }
}
