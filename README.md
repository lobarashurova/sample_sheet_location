# Flutter Localization with Google Sheets

## Overview
This open-source Flutter project demonstrates a simple, one-screen implementation of localization using Google Sheets. Instead of managing multiple JSON files for translations, this approach centralizes all language data in a Google Sheet, making updates and maintenance much easier.

## Features
- Implements localization in Flutter using Google Sheets as the translation source.
- Eliminates the need for multiple JSON files.
- Simplifies translation updates without requiring app recompilation.
- Uses Google Sheets API for fetching translations dynamically.

## Why Use Google Sheets for Localization?
Traditional localization using JSON files can have several drawbacks, such as redundancy, difficulty in managing updates, and requiring app recompilation. Google Sheets provides a centralized and easily accessible way to store and update translations dynamically.

Read more about this approach in my article: [Disadvantages of Using JSON Files in Localization & Sheet Localization Realization Stages in Flutter](https://medium.com/@lobarashurova06/disadvantages-of-using-json-files-in-localization-sheet-localization-realization-stages-in-flutter-79297e887f50).

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/flutter-localization-google-sheets.git
   cd flutter-localization-google-sheets
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Set up Google Sheets API:
   - Create a Google Sheet with translation keys and values.
   - Enable Google Sheets API and generate a service account key.
   - Add the credentials to your project.
   
4. Run the project:
   ```sh
   flutter run
   ```

## Usage
- Add translations in your Google Sheet.
- Fetch the latest translations dynamically.
- Apply them in your Flutter app without recompiling.



## Contributing
Contributions are welcome! Feel free to fork this repository and submit a pull request with improvements.

## License
This project is licence used under the MIT License.

---
### Author
Developed by [Lobar Ashurova](https://github.com/yourusername). Follow me for more Flutter content!

## Demo
Watch the video below to see how the project works:
https://github.com/user-attachments/assets/42da0bc1-3b99-46ae-9453-c6b11c25e170
