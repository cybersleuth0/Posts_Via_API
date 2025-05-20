---

# Posts_Via_API

A simple Flutter application that fetches and displays posts from a remote API using HTTP requests. The app demonstrates model parsing, asynchronous data fetching, and dynamic list rendering using Flutter widgets.

## Features

- Fetches posts from a remote API (`https://dummyjson.com/posts`)
- Displays post titles, bodies, tags, and reactions (likes, dislikes, views)
- Asynchronous API calls with loading and error states
- Uses model classes for structured data parsing

## Directory Structure (lib/)

- **main.dart**  
  Entry point for the app. Launches `PostScreen` as the home widget.

- **models.dart**  
  Contains data models:
  - `ReactionsModel`: Represents likes and dislikes.
  - `PostModel`: Represents a single post, including reactions, tags, and metadata.
  - `PostDataModel`: Represents the full response with a list of posts and pagination info.

- **postscreen.dart**  
  Main UI screen:
  - Fetches posts asynchronously from the API.
  - Displays each post in a card with title, body, tags (as chips), and reaction icons.
  - Handles loading and error states.

## Getting Started

1. Ensure you have Flutter installed.
2. Clone this repository:
   ```bash
   git clone https://github.com/cybersleuth0/Posts_Via_API.git
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Example Code Overview

```dart
// main.dart
void main() {
  runApp(
    MaterialApp(
      home: PostScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
```

```dart
// postscreen.dart (snippet)
Future<PostDataModel> getPosts() async {
  var response = await http.get(Uri.parse("https://dummyjson.com/posts"));
  return PostDataModel.fromJson(jsonDecode(response.body));
}
```

## Dependencies

- Flutter SDK
- http

## License

This project is open source.

---
