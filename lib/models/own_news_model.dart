class OwnNewsModel{
  late int totalResults;
  late List<ArticleModel> articles;
  //imgUrl: Articles.fromJson(json)
 // late Articles imgUrl;
// required this.imgUrl
  OwnNewsModel({required this.totalResults, required this.articles,});
  factory OwnNewsModel.fromJson(Map<String,dynamic> json){
    var obj = json['articles'];
    return OwnNewsModel(
      totalResults:json['totalResults'],
      articles: List<ArticleModel>.from(obj),
      //articles: json['articles']

    );
  }
}

class ArticleModel{
  late Source source;
 late String urlToImage;
 
 ArticleModel({required this.source,required this.urlToImage});
 factory ArticleModel.fromJson(Map<String,dynamic> json){
   return ArticleModel(
     source: Source.fromJson(json['source']),
     urlToImage: json['title'],
   );
 }
 
}

class Source {
  //late String id;
  late String name;
  Source({required this.name});
  factory Source.fromJson(Map<String,dynamic> json){
    return Source(
        name:json['name']
    );
  }
}