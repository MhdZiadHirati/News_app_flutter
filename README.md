# Flutter News Application

This is a flutter news application that fetches news articles from the MediaStack API and displays them in a user-friendly interface. The application allows users to browse through different categories of news and search for specific articles.

## Features

- Browse news articles by category
- Search for specific news articles
- Dark mode support

## Getting Started

To get started with the application, follow these steps:

1. Clone the repository to your local machine
2. Open the project in your preferred IDE (such as Visual Studio Code)
3. Run flutter pub get to install the necessary packages
4. Create an account on News API (https://mediastack.com/) and obtain an API key
5. Add your API key to the lib/shared/constants.dart file
6. Run the application using flutter run

## Dependencies

The following dependencies are used in this application:


- dio (https://pub.dev/packages/dio): For making HTTP requests to the News API
- shared_preferences (https://pub.dev/packages/shared_preferences): For storing dark mode preference
- webview_flutter(https://pub.dev/packages/webview_flutter): For opening article WebView inside the application
- hexcolor(https://pub.dev/packages/hexcolor): For getting colors using hex code
- bloc(https://pub.dev/packages/bloc): For state management
- flutter_bloc(https://pub.dev/packages/flutter_bloc): For state management



## Contributing

Contributions to the project are welcome! If you find any bugs or have suggestions for new features, please open an issue or submit a pull request.

"# News_app_flutter" 
