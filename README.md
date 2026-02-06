# image_collections_app

Image collections Flutter app with expandable cards and preview galleries.

## Approach
- Built with a simple, stateful UI flow where the screen tracks which card is expanded.
- Each collection card manages its own internal toggle to reveal remaining images.
- Smooth UI interactions using `AnimatedContainer` and `AnimatedSize`.
- Use of `cached_network_image` package to smooth render of images and store in cache
- Data is static and provided from a constants file for easy edits.

## Project structure
```
image_collections_app/           # Project root
├─ lib/                           # App source
│  ├─ const.dart                  # Static data/constants
│  ├─ main.dart                   # App entry point
│  ├─ models/                     # Data models
│  │  └─ collection_model.dart    # Collection + images model
│  ├─ screens/                    # App screens
│  │  └─ collections_screen.dart  # Main list + expand/collapse logic
│  └─ widgets/                    # Reusable UI widgets
│     ├─ collection_card.dart     # Collection card UI + preview/overflow
│     └─ image_item.dart          # Image tile in preview list
├─ android/                       # Android platform files
├─ build/                         # Build outputs (generated)
├─ pubspec.yaml                   # Flutter dependencies/config
└─ README.md                      # Project documentation
```

### One-line file explanations
- lib/main.dart: root file and loads the main screen.
- lib/const.dart: Holds the demo collections and image URLs.
- lib/models/collection_model.dart: Defines the collection data structure.
- lib/screens/collections_screen.dart: Renders the list and handles expand/collapse.
- lib/widgets/collection_card.dart: Card UI with preview and overflow toggle.
- lib/widgets/image_item.dart: Small widget for a preview image tile.
- pubspec.yaml: Flutter dependencies and project metadata.
- README.md: Project overview and documentation.