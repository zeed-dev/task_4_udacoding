part of 'services.dart';

class FarmServices {
  static Future<ApiReturnValue<List<Farm>>> getFarm(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + "get_farm.php";

    var response = await client.get(url);
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode != 200) {
      ApiReturnValue(message: "Error");
    }

    List data = json.decode(response.body);
    List<Farm> farm = data.map((e) => Farm.fromJson(e)).toList();

    return ApiReturnValue(value: farm);
  }
}
