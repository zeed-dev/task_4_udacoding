part of 'models.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;

  User({this.name, this.email, this.id});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
      };

  @override
  List<Object> get props => throw UnimplementedError();
}
