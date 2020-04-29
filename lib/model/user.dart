import 'package:sua_carteira_investimentos/db/entity.dart';
import 'dart:convert' as converter;

class User extends Entity {
  int id;
  String name;
  String password;
  String email;
  String phone;
  DateTime birthDate;
  String photo;
  String profission;

  User(
      {this.id,
      this.name,
      this.password,
      this.email,
      this.phone,
      this.birthDate,
      this.photo,
      this.profission});


  User.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    photo = json['photo'];
    profission = json['profission'];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    data['photo'] = this.photo;
    data['profission'] = this.profission;
    return data;
  }

  String toJson() {
    var json = converter.json.encode(toMap());
    return json;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, password: $password, email: $email, phone: $phone, birthDate: $birthDate, photo: $photo, profission: $profission}';
  }

}
