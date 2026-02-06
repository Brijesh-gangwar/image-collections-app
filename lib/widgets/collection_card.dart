import 'package:flutter/material.dart';
import '../models/collection_model.dart';
import 'image_item.dart';

class CollectionCard extends StatefulWidget {
  final CollectionModel collection;
  final bool isExpanded;
  final VoidCallback onTap;

  const CollectionCard({
    super.key,
    required this.collection,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<CollectionCard> createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  bool showAllImages = false;

  @override
  void didUpdateWidget(covariant CollectionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset the expanded images when the card collapses.
    if (!widget.isExpanded) {
      showAllImages = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Prepare preview and overflow image lists.
    final previewImages = widget.collection.images.take(4).toList();
    final remainingImages = widget.collection.images.skip(4).toList();
    final remainingCount = remainingImages.length;

    // Animated card container for smooth expand/collapse.
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with title and expand/collapse control.
          InkWell(
            onTap: widget.onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.collection.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  widget.isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),


          // Preview strip shown only when expanded.
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: widget.isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Stack(
                      children: [
                        // Horizontal list of preview images.
                        SizedBox(
                          height: ImageItem.size,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: previewImages.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              return ImageItem(
                                imageUrl: previewImages[index],
                              );
                            },
                          ),
                        ),

                        // Tap +n button for showing all remaining images.
                        if (remainingCount > 0)
                          Positioned(
                            right: 0,
                            bottom: 20,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAllImages = !showAllImages;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '+$remainingCount',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),


                  // showin remaining images from list
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: showAllImages
                ? Column(
                    children: remainingImages
                        .map(
                          (img) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                img,
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

