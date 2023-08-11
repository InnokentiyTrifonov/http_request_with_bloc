import 'package:http/http.dart';
import 'package:lesson_2/features/model/users_model.dart';

class GetUsers {
  static Future<List<Users>> getUsers() async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      var listOfUsers = usersFromJson(response.body);
      return listOfUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
