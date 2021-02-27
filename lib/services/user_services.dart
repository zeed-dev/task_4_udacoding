part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "login.php";

    var response = await client.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please Try Again');
    }

    var data = json.decode(response.body);

    int value = data['value'];
    String name = data['name'];
    String emails = data['email'];

    if (value == 1) {
      saveDataPref(
        name: name,
        value: value,
        email: emails,
      );
      print("saved Prev");
    }

    if (data['value'] != 1) {
      return ApiReturnValue(message: 'Please Try Again');
    }

    User user = User.formJson(data);
    return ApiReturnValue(value: user);
  }

  static Future<ApiReturnValue<int>> signOut(String email,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "logout.php";

    var response = await client.post(
      url,
      body: {
        'email': email,
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please Try Again');
    }

    var data = json.decode(response.body);

    return ApiReturnValue(value: data['value']);
  }
}
