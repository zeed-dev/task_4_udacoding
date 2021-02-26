part of 'services.dart';

class DictionaryServices {
  static Future<ApiReturnValue<List<Dictionary>>> getDataLimit(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "get_dictionary_limit.php";

    var response = await client.get(url);

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode != 200) {
      ApiReturnValue(message: "Error");
    }

    List data = json.decode(response.body);
    List<Dictionary> dictionary =
        data.map((e) => Dictionary.fromJson(e)).toList();

    return ApiReturnValue(value: dictionary);
  }
}
