part of 'services.dart';

class NewsServices {
  static Future<ApiReturnValue<List<News>>> getNews(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "get_news.php";

    var response = await client.get(url);

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode != 200) {
      ApiReturnValue(message: "Error");
    }

    List data = json.decode(response.body);
    List<News> news = data.map((e) => News.fromJson(e)).toList();

    return ApiReturnValue(value: news);
  }
}
