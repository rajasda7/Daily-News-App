import 'package:daily_news/models/my_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String apiKey = '&apiKey=bbf122bf7715439d8cc0dd426ff50aa1';
String newsUrl = 'https://newsapi.org/v2/top-headlines?';
String country = 'country=in';
String category = '&category=';
List<String> newsCategories = ['Business','Entertainment','Sports','Science','Health','Technology','Politics','Music'];
List<String> newsCategoriesForUrl = ['business','entertainment','sports','science','health','technology','politics','music'];
late SharedPreferences sharedPrefs;
late Set<String> allPrefKeys = {};
late Set<String> prefKeys = {};
late Set<String> bookmarksKeys = {};
late Set<String> noteKeys = {};
void updatePrefKeys(){
  allPrefKeys = sharedPrefs.getKeys();
  prefKeys = {};
  for(int i=0; i<allPrefKeys.length; i++){
    if (allPrefKeys.elementAt(i).contains('pref')) {
      prefKeys.add(allPrefKeys.elementAt(i));
    }
  }
}
void updateBookmarkKeys(){
  allPrefKeys = sharedPrefs.getKeys();
  bookmarksKeys = {};
  for(int i=0; i<allPrefKeys.length; i++){
    if (allPrefKeys.elementAt(i).contains('book')) {
      bookmarksKeys.add(allPrefKeys.elementAt(i));
    }
  }
}
void updateNoteKeys(){
  allPrefKeys = sharedPrefs.getKeys();
  noteKeys = {};
  for(int i=0; i<allPrefKeys.length; i++){
    if (allPrefKeys.elementAt(i).contains('note')) {
      noteKeys.add(allPrefKeys.elementAt(i));
    }
  }
}
List<MyNewsModel> newsModels= [];
List<String> newsModelsStored = [];
bool isWelcomed = false;